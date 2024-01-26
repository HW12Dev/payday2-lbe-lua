core:import("CoreMissionScriptElement")

ElementUnitSequenceVR = ElementUnitSequenceVR or class(CoreMissionScriptElement.MissionScriptElement)

function ElementUnitSequenceVR:init(...)
	ElementUnitSequenceVR.super.init(self, ...)

	self._unit = CoreUnit.safe_spawn_unit("units/pd2_dlc_vr/run_sequence_dummy_vr/run_sequence_dummy_vr", self._values.position)

	managers.worlddefinition:add_trigger_sequence(self._unit, self._values.trigger_list)
end

function ElementUnitSequenceVR:on_script_activated()
	self._mission_script:add_save_state_cb(self._id)
end

function ElementUnitSequenceVR:client_on_executed(...)
	self:on_executed(...)
end

function ElementUnitSequenceVR:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local run_sequence = true

	if self._values.only_for_local_player then
		run_sequence = not managers.player:player_unit() or instigator == managers.player:player_unit()
	end

	if run_sequence then
		if _G.IS_VR and managers.vr:get_setting("default_weapon_hand") == "left" then
			print("RUNNING LEFT SEQUENCE")
			self._unit:damage():run_sequence_simple("run_sequence_left")
		else
			print("RUNNING RIGHT SEQUENCE")
			self._unit:damage():run_sequence_simple("run_sequence_right")
		end
	end

	ElementUnitSequenceVR.super.on_executed(self, instigator)
end

function ElementUnitSequenceVR:save(data)
	data.enabled = self._values.enabled
end

function ElementUnitSequenceVR:load(data)
	self:set_enabled(data.enabled)
end
