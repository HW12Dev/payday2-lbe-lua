core:import("CoreMissionScriptElement")

ElementLoadoutWeaponDummy = ElementLoadoutWeaponDummy or class(CoreMissionScriptElement.MissionScriptElement)

function ElementLoadoutWeaponDummy:init(...)
	ElementLoadoutWeaponDummy.super.init(self, ...)

	if managers.sync then
		managers.sync:add_managed_unit(self._id, self)
	end
end

function ElementLoadoutWeaponDummy:client_on_executed(...)
end

function ElementLoadoutWeaponDummy:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	self:_spawn_weapon(self._values.loadout_id, self._values.category, self._values.position, self._values.rotation)
	ElementLoadoutWeaponDummy.super.on_executed(self, instigator)
end

function ElementLoadoutWeaponDummy:_spawn_weapon(loadout_id, category, position, rotation)
	if not Network:is_server() then
		return
	end

	local loadout = tweak_data.vr_arcade.loadouts[loadout_id]

	if not loadout then
		return
	end

	local loadout_data = loadout.loadout[category]

	if not loadout_data then
		return
	end

	self._factory_id = loadout_data.factory_id .. "_npc"

	self:assemble_weapon(self._factory_id, loadout_data.blueprint, position, rotation)
	managers.sync:add_synced_weapon_blueprint(self._id, self._factory_id, loadout_data.blueprint)
end

function ElementLoadoutWeaponDummy:assemble_weapon(factory_id, blueprint, position, rotation)
	if not position and self._values then
		position = self._values.position
	end

	if not rotation and self._values then
		rotation = self._values.rotation
	end

	self._factory_id = factory_id
	local unit_name = tweak_data.weapon.factory[factory_id].unit

	managers.dyn_resource:load(Idstring("unit"), Idstring(unit_name), DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)

	self._weapon_unit = World:spawn_unit(Idstring(unit_name), position, rotation)
	self._parts, self._blueprint = managers.weapon_factory:assemble_from_blueprint(factory_id, self._weapon_unit, blueprint, false, true, callback(self, self, "_assemble_completed"))

	self._weapon_unit:set_moving(true)
end

function ElementLoadoutWeaponDummy:_assemble_completed(parts, blueprint)
	self._parts = parts
	self._blueprint = blueprint

	self._weapon_unit:set_moving(true)

	self._weapon_unit:base()._parts = parts
	self._weapon_unit:base()._blueprint = blueprint
	self._weapon_unit:base()._factory_id = self._factory_id

	self._weapon_unit:base():_apply_cosmetics(function ()
	end)
end

function ElementLoadoutWeaponDummy:pre_destroy()
	ElementLoadoutWeaponDummy.super.pre_destroy(self)
	self:_destroy_weapon()
end

function ElementLoadoutWeaponDummy:_destroy_weapon()
	if alive(self._weapon_unit) then
		managers.weapon_factory:disassemble(self._parts)

		local name = self._weapon_unit:name()

		self._weapon_unit:base():set_slot(self._weapon_unit, 0)
		World:delete_unit(self._weapon_unit)
		managers.dyn_resource:unload(Idstring("unit"), name, DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)
	end
end
