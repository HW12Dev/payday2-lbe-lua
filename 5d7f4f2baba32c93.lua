local function pack_attributes(attributes)
	local str = ""

	for k, v in pairs(attributes) do
		str = str .. (#str > 0 and ";" .. k or k) .. "=" .. tostring(v)
	end

	return str
end

local function expand_attributes(str)
	local vars = string.split(str, ";")
	local attributes = {}

	for _, var in ipairs(vars) do
		local name, value = unpack(string.split(var, "="))
		value = tonumber(value) or value
		attributes[name] = value
	end

	return attributes
end

NetworkMatchMakingLBE = NetworkMatchMakingLBE or class()
NetworkMatchMakingLBE.OPEN_SLOTS = tweak_data.max_players

function NetworkMatchMakingLBE:init()
	cat_print("lobby", "matchmake = NetworkMatchMakingLBE")

	self._callback_map = {}
	self._lobby_filters = {}
	self._distance_filter = -1
	self._lobby_return_count = 30
	self._difficulty_filter = 0
	self._try_re_enter_lobby = nil
end

function NetworkMatchMakingLBE:register_callback(event, callback)
	self._callback_map[event] = callback
end

function NetworkMatchMakingLBE:create_lobby(settings)
	self._num_players = nil

	self:_set_attributes(settings)
	managers.menu:created_lobby()
end

function NetworkMatchMakingLBE:set_num_players(num)
	self._num_players = num
end

function NetworkMatchMakingLBE:set_server_state(state)
	local state_id = tweak_data:server_state_to_index(state)
end

function NetworkMatchMakingLBE:set_server_joinable(state)
	self._server_joinable = state
end

function NetworkMatchMakingLBE:set_server_attributes(settings)
	self:_set_attributes(settings)
end

function NetworkMatchMakingLBE:join_game(id, private)
end

function NetworkMatchMakingLBE:start_game()
end

function NetworkMatchMakingLBE:end_game()
end

function NetworkMatchMakingLBE:leave_game()
	self._server_rpc = nil
end

function NetworkMatchMakingLBE:destroy_game()
	self:leave_game()
end

function NetworkMatchMakingLBE:game_owner_name()
	return self._game_owner_name
end

function NetworkMatchMakingLBE:on_discover_host_received(sender)
	sender:discover_host_reply(self._lobby_attribute_string or "")
end

function NetworkMatchMakingLBE:join_server(room_id, skip_showing_dialog)
	if not skip_showing_dialog then
		managers.menu:show_joining_lobby_dialog()
	end

	local server_rpc = nil
	local hosts = managers.network:session():discovered_hosts()

	for _, host_data in ipairs(hosts) do
		if host_data.rpc:ip_at_index(0) == room_id then
			server_rpc = Network:handshake(room_id, nil, "TCP_IP")

			break
		end
	end

	self._server_rpc = server_rpc
	self._game_owner_name = server_rpc:name_at_index(0)

	local function joined_game(res, level_index, difficulty_index, state_index)
		managers.system_menu:close("waiting_for_server_response")
		print("[NetworkMatchMakingLBE:join_server:joined_game]", res, level_index, difficulty_index, state_index)

		if res == "JOINED_LOBBY" then
			MenuCallbackHandler:crimenet_focus_changed(nil, false)
			managers.menu:on_enter_lobby()
		elseif res == "JOINED_GAME" then
			local level_id = tweak_data.levels:get_level_name_from_index(level_index)
			Global.game_settings.level_id = level_id

			managers.network:session():local_peer():set_in_lobby(false)
		else
			managers.network.matchmake:leave_game()
			managers.network.voice_chat:destroy_voice()
			managers.network:queue_stop_network()
			game_state_machine:current_state():on_failed_to_join_game()
			setup:load_start_menu()
		end
	end

	if not self._server_rpc then
		managers.system_menu:close("waiting_for_server_response")

		return
	end

	managers.network:start_client()
	managers.menu:show_waiting_for_server_response({
		cancel_func = function ()
			managers.network:session():on_join_request_cancelled()
		end
	})
	managers.network:join_game_at_host_rpc(self._server_rpc, joined_game)
end

function NetworkMatchMakingLBE:join_server_with_check(room_id, is_invite)
	self:join_server(room_id, true)
end

function NetworkMatchMakingLBE:is_server_ok(friends_only, room, attributes_list, is_invite)
	return true
end

function NetworkMatchMakingLBE:difficulty_filter()
	return self._difficulty_filter
end

function NetworkMatchMakingLBE:set_difficulty_filter(filter)
	self._difficulty_filter = filter
end

function NetworkMatchMakingLBE:search_lobby(friends_only)
	self._search_friends_only = friends_only

	local function refresh_lobby()
		if not self._lobby_browser then
			return
		end

		local lobbies = self._lobby_browser:lobbies()
		local info = {
			room_list = {},
			attribute_list = {}
		}

		if lobbies then
			for _, lobby in ipairs(lobbies) do
				table.insert(info.room_list, {
					owner_level = 1,
					owner_id = lobby:key_value("owner_id"),
					owner_name = lobby:key_value("owner_name"),
					room_id = lobby:id()
				})

				local attributes_data = {
					numbers = self:_lobby_to_numbers(lobby),
					mutators = false
				}

				table.insert(info.attribute_list, attributes_data)
			end
		end

		self:_call_callback("search_lobby", info)
	end

	self._lobby_browser = self._lobby_browser or LobbyBrowserImpl:new(refresh_lobby, function ()
	end)

	self._lobby_browser:set_lobby_filters(self._lobby_filters)
	self._lobby_browser:refresh()
end

function NetworkMatchMakingLBE:search_lobby_done()
end

function NetworkMatchMakingLBE:lobby_filters()
	return self._lobby_filters
end

function NetworkMatchMakingLBE:set_lobby_filters(filters)
	self._lobby_filters = filters or {}
end

function NetworkMatchMakingLBE:add_lobby_filter(key, value, comparision_type)
	self._lobby_filters[key] = {
		key = key,
		value = value,
		comparision_type = comparision_type
	}
end

function NetworkMatchMakingLBE:get_lobby_filter(key)
	return self._lobby_filters[key] and self._lobby_filters[key].value or false
end

function NetworkMatchMakingLBE:get_lobby_return_count()
	return self._lobby_return_count
end

function NetworkMatchMakingLBE:set_lobby_return_count(lobby_return_count)
	self._lobby_return_count = lobby_return_count
end

function NetworkMatchMakingLBE:distance_filter()
	return self._distance_filter
end

function NetworkMatchMakingLBE:set_distance_filter(filter)
	self._distance_filter = filter
end

function NetworkMatchMakingLBE:search_friends_only()
	return self._search_friends_only
end

function NetworkMatchMakingLBE:update()
end

function NetworkMatchMakingLBE:_split_attribute_number(attribute_number, splitter)
	if not splitter or splitter == 0 or type(splitter) ~= "number" then
		Application:error("NetworkMatchMakingLBE:_split_attribute_number. splitter needs to be a non 0 number!", "attribute_number", attribute_number, "splitter", splitter)
		Application:stack_dump()

		return 1, 1
	end

	return attribute_number % splitter, math.floor(attribute_number / splitter)
end

function NetworkMatchMakingLBE:_lobby_to_numbers(lobby)
	return {
		tonumber(lobby:key_value("level")) + 1000 * tonumber(lobby:key_value("job_id")),
		tonumber(lobby:key_value("difficulty")),
		tonumber(lobby:key_value("permission")),
		tonumber(lobby:key_value("state")),
		tonumber(lobby:key_value("num_players")),
		tonumber(lobby:key_value("drop_in")),
		tonumber(lobby:key_value("min_level")),
		tonumber(lobby:key_value("kick_option")),
		tonumber(lobby:key_value("job_class")),
		tonumber(lobby:key_value("job_plan"))
	}
end

function NetworkMatchMakingLBE:_load_globals()
	if Global.lbe and Global.lbe.match then
		self._lobby_browser = Global.lbe.match.lobby_browser
		self._lobby_attributes = Global.lbe.match.lobby_attributes or {}
		self._lobby_attribute_string = pack_attributes(self._lobby_attributes or {})
		self._try_re_enter_lobby = Global.lbe.match.try_re_enter_lobby
		self._server_rpc = Global.lbe.match.server_rpc
		self._lobby_filters = Global.lbe.match.lobby_filters or self._lobby_filters
		self._distance_filter = Global.lbe.match.distance_filter or self._distance_filter
		self._difficulty_filter = Global.lbe.match.difficulty_filter or self._difficulty_filter
		self._lobby_return_count = Global.lbe.match.lobby_return_count or self._lobby_return_count
		Global.lbe.match = nil
	end
end

function NetworkMatchMakingLBE:_save_globals()
	if not Global.lbe then
		Global.lbe = {}
	end

	Global.lbe.match = {
		lobby_browser = self._lobby_browser,
		lobby_attributes = self._lobby_attributes,
		try_re_enter_lobby = self._try_re_enter_lobby,
		server_rpc = self._server_rpc,
		lobby_filters = self._lobby_filters,
		distance_filter = self._distance_filter,
		difficulty_filter = self._difficulty_filter,
		lobby_return_count = self._lobby_return_count
	}
end

function NetworkMatchMakingLBE:_call_callback(name, ...)
	if self._callback_map[name] then
		return self._callback_map[name](...)
	else
		Application:error("Callback " .. name .. " not found.")
	end
end

function NetworkMatchMakingLBE:_has_callback(name)
	if self._callback_map[name] then
		return true
	end

	return false
end

function NetworkMatchMakingLBE:_set_attributes(settings)
	local permissions = {
		"public",
		"friend",
		"private"
	}
	local level_index, job_index = self:_split_attribute_number(settings.numbers[1], 1000)
	local lobby_attributes = {
		owner_name = managers.network.account:username_id(),
		level = level_index,
		difficulty = settings.numbers[2],
		permission = settings.numbers[3],
		state = settings.numbers[4] or self._lobby_attributes and self._lobby_attributes.state or 1,
		min_level = settings.numbers[7] or 0,
		num_players = self._num_players or 1,
		drop_in = settings.numbers[6] or 1,
		job_id = job_index or 0,
		kick_option = settings.numbers[8] or 0,
		job_class_min = settings.numbers[9] or 10,
		job_class_max = settings.numbers[9] or 10,
		job_plan = settings.numbers[10]
	}
	self._lobby_attributes = lobby_attributes
	self._lobby_attribute_string = pack_attributes(lobby_attributes)
end

LobbyBrowserImpl = LobbyBrowserImpl or class()

function LobbyBrowser(on_match, on_update)
	return LobbyBrowserImpl:new(on_match, on_update)
end

function LobbyBrowserImpl:init(on_match, on_update)
	self._on_match = on_match
	self._on_update = on_update
	self._filters = {}
	self._discover_callback = callback(self, self, "_on_discovered_host")
	self._lobbies = {}
end

function LobbyBrowserImpl:set_lobby_filter(key, value, operator)
	table.insert(self._filters, {
		key = key,
		value = value,
		operator = operator
	})
end

function LobbyBrowserImpl:_on_discovered_host(host, data)
	if self._on_update then
		self._on_update()
	end

	if self._on_match then
		self._on_match()
	end
end

function LobbyBrowserImpl:lobbies()
	local hosts = managers.network:session():discovered_hosts()
	local lobbies = {}

	for _, host_data in ipairs(hosts) do
		if host_data.data and #host_data.data > 0 then
			local attributes = expand_attributes(host_data.data)
			local owner_id = host_data.rpc:ip_at_index(0)
			local lobby = {
				id = function (self)
					return owner_id
				end,
				key_value = function (self, key)
					if key == "owner_id" then
						return owner_id
					else
						return attributes[key]
					end
				end
			}

			if self:_match(lobby) then
				table.insert(lobbies, lobby)
			end
		end
	end

	return lobbies
end

function LobbyBrowserImpl:set_lobby_filters(filter)
	self._filters = filter or {}
end

function LobbyBrowserImpl:set_lobby_filter(key, comparision_type, value)
	self._filters[key] = {
		key = key,
		value = value,
		comparision_type = comparision_type
	}
end

function LobbyBrowserImpl:refresh()
	if not managers.network:session() then
		managers.network:discover_hosts(self._discover_callback)
	elseif managers.network:session():is_client() then
		managers.network:session():discover_hosts()
	end
end

local compare_func = {
	equalto_less_than = function (a, b)
		return a <= b
	end,
	less_than = function (a, b)
		return a < b
	end,
	equal = function (a, b)
		return a == b
	end,
	greater_than = function (a, b)
		return b < a
	end,
	equalto_or_greater_than = function (a, b)
		return b <= a
	end,
	not_equal = function (a, b)
		return a ~= b
	end
}

function LobbyBrowserImpl:_match(lobby)
	for k, v in pairs(self._filters) do
		local src = lobby:key_value(k)
		local func = compare_func[v.comparision_type]

		if func and not func(src, v.value) then
			return false
		end
	end

	return true
end
