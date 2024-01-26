LoadoutWeaponDummyUnitElement = LoadoutWeaponDummyUnitElement or class(MissionElement)

function LoadoutWeaponDummyUnitElement:init(unit)
	MissionElement.init(self, unit)

	self._hed.loadout_id = "rifle_american"
	self._hed.category = "primaries"

	table.insert(self._save_values, "loadout_id")
	table.insert(self._save_values, "category")
end

function LoadoutWeaponDummyUnitElement:test_element()
	local loadout = tweak_data.vr_arcade.loadouts[self._hed.loadout_id]

	if not loadout then
		return
	end

	local loadout_data = loadout.loadout[self._hed.category]

	if not loadout_data then
		return
	end

	self._unit:set_visible(false)
	ElementLoadoutWeaponDummy.assemble_weapon(self, loadout_data.factory_id, loadout_data.blueprint, self._unit:position(), self._unit:rotation())
end

function LoadoutWeaponDummyUnitElement:stop_test_element()
	ElementLoadoutWeaponDummy._destroy_weapon(self)
	self._unit:set_visible(true)

	self._parts = nil
	self._blueprint = nil
	self._factory_id = nil
end

function LoadoutWeaponDummyUnitElement:_assemble_completed()
end

function LoadoutWeaponDummyUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local loadouts = {}

	for id in pairs(tweak_data.vr_arcade.loadouts) do
		table.insert(loadouts, id)
	end

	self:_build_value_combobox(panel, panel_sizer, "loadout_id", loadouts, "Select a loadout.")
	self:_build_value_combobox(panel, panel_sizer, "category", {
		"secondaries",
		"primaries"
	}, "Select a weapon category.")
end
