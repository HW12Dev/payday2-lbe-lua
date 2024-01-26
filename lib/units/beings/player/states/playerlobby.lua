PlayerLobbyEmpty = PlayerLobbyEmpty or class(PlayerCivilian)

function PlayerLobbyEmpty:enter(...)
	PlayerLobby.super.enter(self, ...)

	self._state_data.warp_disabled = true
end

function PlayerLobbyEmpty:exit(state_data, next_state_name)
	PlayerLobbyEmpty.super.exit(self, state_data, next_state_name)

	self._state_data.warp_disabled = false

	return {
		skip_equip = true
	}
end

function PlayerLobbyEmpty:update(t, dt)
	PlayerLobbyEmpty.super.super.update(self, t, dt)
end

function PlayerLobbyEmpty:_check_action_interact(t, input)
	local new_action, timer, interact_object = nil

	if input.btn_interact_press then
		if _G.IS_VR then
			self._interact_hand = input.btn_interact_left_press and PlayerHand.LEFT or PlayerHand.RIGHT
		end

		local action_forbidden = self:chk_action_forbidden("interact") or self._unit:base():stats_screen_visible() or self:_interacting() or self._ext_movement:has_carry_restriction() or self:_on_zipline()

		if not action_forbidden then
			new_action, timer, interact_object = managers.interaction:interact(self._unit, nil, self._interact_hand)

			if timer then
				new_action = true

				self:_start_action_interact(t, input, timer, interact_object)
			end
		end
	end

	if input.btn_interact_release then
		self:_interupt_action_interact()
	end

	return new_action
end

function PlayerLobbyEmpty:_start_action_interact(t, input, timer, interact_object)
	if _G.IS_VR then
		managers.hud:link_interaction_hud(self._unit:hand():hand_unit(self._interact_hand), interact_object)
	end

	PlayerLobbyEmpty.super._start_action_interact(self, t, input, timer, interact_object)
end

PlayerLobbyWeapon = PlayerLobbyWeapon or class(PlayerStandard)

function PlayerLobbyWeapon:enter(...)
	PlayerLobbyWeapon.super.enter(self, ...)

	self._state_data.warp_disabled = true
end

function PlayerLobbyWeapon:exit(...)
	PlayerLobbyWeapon.super.exit(self, ...)

	self._state_data.warp_disabled = false

	return {
		skip_equip = true
	}
end

PlayerLobby = PlayerLobby or class(PlayerStandard)

function PlayerLobby:exit(state_data, new_state_name)
	local exit_data = PlayerLobby.super.exit(self, state_data, new_state_name)
	exit_data.skip_equip = new_state_name == "carry"

	return exit_data
end
