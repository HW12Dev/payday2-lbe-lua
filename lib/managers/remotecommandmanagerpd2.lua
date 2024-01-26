RemoteCommandManagerPD2 = RemoteCommandManagerPD2 or class()

function RemoteCommandManagerPD2:init()
	print("[RemoteCommandManagerPD2] Init")

	if rawget(_G, "RemoteCommandManager") ~= nil then
		RemoteCommandManager:set_callback(callback(self, self, "remote_callback"))

		self._controller = managers.controller:get_vr_controller()
		self._controller_poll_t = nil
		self._controller_battery_level = {
			-1,
			-1
		}
	end
end

local ASSET_PATH = Application:base_path() .. "assets/"
local VERSION_PATH = ASSET_PATH .. "version"
local steam_users = {}
local IS_STEAM = SystemInfo:distribution() == Idstring("STEAM")

function RemoteCommandManagerPD2:remote_callback(method, parameters)
	if method == "user_id" then
		return managers.network.account:player_id()
	elseif method == "user_name" then
		return managers.network.account:username()
	elseif method == "num_players" then
		return managers.network:session():amount_of_players()
	elseif method == "start_timer" then
		local state = managers.job:arcade_state()

		if Global.game_host and (state == "lobby" or state == "tutorial") then
			return managers.job:force_start_lobby_timer()
		end

		return false
	elseif method == "start_game" then
		local state = managers.job:arcade_state()

		if Global.game_host and (state == "lobby" or state == "tutorial") then
			return managers.job:force_start_heist()
		end

		return false
	elseif method == "version" then
		local file = SystemFS:open(VERSION_PATH, "r")

		if file then
			local version = file:read() or "-1"
			version = string.match(version, "([^%s\r\n]+)") or "-1"

			file:close()

			return version
		end

		return "-1"
	elseif method == "players" then
		local users = {}

		if managers.network:session() then
			for _, peer in pairs(managers.network:session():all_peers()) do
				if peer and not peer:is_host() then
					table.insert(users, tostring(peer:user_id()))
				end
			end
		end

		return users
	elseif method == "toggle_primary_hand" then
		if managers.vr then
			managers.vr:toggle_primary_hand()

			return true
		end

		return false
	elseif method == "set_primary_hand" then
		if managers.vr then
			managers.vr:set_primary_hand(parameters.hand or "right")

			return true
		end

		return false
	elseif method == "set_player_ready" then
		if not Network:is_server() and game_state_machine:current_state_name() == "ingame_waiting_for_players" then
			managers.menu_component:on_ready_pressed_mission_briefing_gui(true)
		end

		Global.auto_ready = true

		return true
	elseif method == "set_voice_chat" then
		if IS_STEAM and managers.vr then
			managers.vr:set_voice_chat(parameters.enabled or false)

			return true
		end

		return false
	elseif method == "deserialize" then
		if type(parameters) == "table" then
			for method, params in pairs(parameters or {}) do
				print("[RemoteCommandManagerPD2] deserialized call ", method, inspect(params))
				self:remote_callback(method, params)
			end

			return true
		end

		return false
	elseif method == "game_state" then
		local current_time = TimerManager:wall_running():time()

		if self._controller and (not self._controller_poll_t or self._controller_poll_t < current_time) then
			self._controller_battery_level[1] = self._controller:battery_level(0)
			self._controller_battery_level[2] = self._controller:battery_level(1)
			self._controller_poll_t = current_time + 5
		end

		local players = {}

		if managers.network:session() then
			for _, peer in pairs(managers.network:session():all_peers()) do
				if peer and not peer:is_host() then
					local user_id = tostring(peer:user_id())
					local user_name = nil

					if IS_STEAM then
						user_name = steam_users[user_id]

						if not user_name then
							user_name = Steam:username(user_id)
							steam_users[user_id] = user_name
						end
					else
						user_name = peer:name()
					end

					table.insert(players, {
						user_id = user_id,
						user_name = user_name
					})
				end
			end
		end

		local is_server = Global.game_host or false
		local game_state = game_state_machine:current_state_name()
		local ready = false

		if string.find(game_state, "ingame_") then
			ready = game_state ~= "ingame_waiting_for_players"
		end

		local pos = managers.viewport:get_current_camera_position()
		local cam_pos = {}

		if pos then
			cam_pos.x = pos.x
			cam_pos.y = pos.y
			cam_pos.z = pos.z
		end

		local vr_state = "unknown"
		local primary_hand = "right"

		if managers.vr then
			primary_hand = managers.vr:get_setting("default_weapon_hand")
			vr_state = managers.vr:vr_system_goodness_value() > 0.1 and "ok" or "bad"
		end

		local arcade_state = managers.job:arcade_state()
		local simplified_state = "stopped"

		if arcade_state and ready then
			if arcade_state == "tutorial" or arcade_state == "lobby" then
				simplified_state = "started"
			elseif arcade_state == "ingame" then
				simplified_state = "playing"
			end
		end

		return {
			game_state = game_state or {},
			arcade_state = arcade_state or {},
			killed_enemies = managers.statistics:session_total_kills() or 0,
			cam_pos = cam_pos,
			is_server = is_server,
			is_ready = ready,
			primary_hand = primary_hand,
			players = players,
			battery_level = {
				right = self._controller_battery_level[1],
				left = self._controller_battery_level[2]
			},
			timer = managers.game_play_central and math.floor(math.abs(managers.game_play_central:get_heist_timer())) or {},
			voice_chat = Global.voice_chat or false,
			vr_state = vr_state,
			score = math.floor(managers.job:peer_score() or 0),
			simplified_state = simplified_state
		}
	end
end
