require("lib/states/GameState")

IngameHost = IngameHost or class(GameState)

function IngameHost:init(game_state_machine)
	GameState.init(self, "ingame_host", game_state_machine)
end

function IngameHost:at_enter()
	print("[IngameHost] Enter")
	managers.network:session():local_peer():set_waiting_for_player_ready(true)
	managers.network:session():on_set_member_ready(managers.network:session():local_peer():id(), true, true, false)

	if Global.game_host and Global.test_startup then
		self._restart_timer_t = TimerManager:game():time() + Global.test_startup.restart_time
	end
end

function IngameHost:update(t, dt)
	if self._restart_timer_t and self._restart_timer_t < t then
		managers.job:set_arcade_state("endscreen")

		self._restart_timer_t = nil
	end
end

function IngameHost:at_exit()
	print("[IngameHost] Exit")
end
