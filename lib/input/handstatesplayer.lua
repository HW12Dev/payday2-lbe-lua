require("lib/input/HandState")

local common = require("lib/input/HandStatesCommon")
EmptyHandState = EmptyHandState or class(HandState)

function EmptyHandState:init()
	EmptyHandState.super.init(self)

	self._connections = {
		toggle_menu = {
			inputs = {
				"menu_"
			},
			condition = common.toggle_menu_condition
		},
		warp = {
			inputs = common.warp_inputs
		},
		warp_target = {
			inputs = common.warp_target_inputs
		},
		run = {
			inputs = common.run_input
		},
		touchpad_move = {
			inputs = {
				"dpad_"
			}
		},
		interact_right = {
			hand = 1,
			inputs = {
				"trigger_"
			}
		},
		interact_left = {
			hand = 2,
			inputs = {
				"trigger_"
			}
		},
		weapon_assist = {
			inputs = {
				"trigger_"
			}
		}
	}
end

PointHandState = PointHandState or class(HandState)

function PointHandState:init()
	PointHandState.super.init(self)

	self._connections = {
		warp = {
			inputs = common.warp_inputs
		},
		warp_target = {
			inputs = common.warp_target_inputs
		},
		run = {
			inputs = common.run_input
		},
		touchpad_move = {
			inputs = {
				"dpad_"
			}
		}
	}
end

WeaponHandState = WeaponHandState or class(HandState)

function WeaponHandState:init()
	WeaponHandState.super.init(self)

	self._connections = {
		toggle_menu = {
			exclusive = true,
			inputs = {
				"menu_"
			}
		},
		primary_attack = {
			inputs = {
				"trigger_"
			}
		},
		switch_weapon = {
			inputs = {
				"trackpad_button_"
			}
		},
		reload = {
			inputs = {}
		},
		weapon_firemode = {
			inputs = {}
		},
		weapon_gadget = {
			inputs = {}
		}
	}
end

WeaponAssistHandState = WeaponAssistHandState or class(HandState)

function WeaponAssistHandState:init()
	WeaponAssistHandState.super.init(self)

	self._connections = {
		toggle_menu = {
			inputs = {
				"menu_"
			},
			condition = common.toggle_menu_condition
		},
		warp = {
			inputs = common.warp_inputs
		},
		warp_target = {
			inputs = common.warp_target_inputs
		},
		run = {
			inputs = common.run_input
		},
		touchpad_move = {
			inputs = {
				"dpad_"
			}
		},
		weapon_assist = {
			inputs = {
				"trigger_"
			}
		}
	}
end

AkimboHandState = AkimboHandState or class(HandState)

function AkimboHandState:init()
	AkimboHandState.super.init(self, 1)

	self._connections = {
		akimbo_fire = {
			inputs = {
				"trigger_"
			}
		}
	}
end

MaskHandState = MaskHandState or class(HandState)

function MaskHandState:init()
	MaskHandState.super.init(self)

	self._connections = {
		toggle_menu = {
			exclusive = true,
			inputs = {
				"menu_"
			}
		},
		use_item = {
			inputs = {
				"trigger_"
			}
		}
	}
end

ItemHandState = ItemHandState or class(HandState)

function ItemHandState:init()
	ItemHandState.super.init(self, 1)

	self._connections = {
		use_item_vr = {
			inputs = {
				"trigger_"
			}
		},
		unequip = {
			inputs = {
				"grip_"
			}
		}
	}
end

AbilityHandState = AbilityHandState or class(HandState)

function AbilityHandState:init()
	AbilityHandState.super.init(self, 2)

	self._connections = {
		throw_grenade = {
			inputs = {
				"grip_"
			}
		}
	}
end

EquipmentHandState = EquipmentHandState or class(HandState)

function EquipmentHandState:init()
	EquipmentHandState.super.init(self, 1)

	self._connections = {
		use_item = {
			inputs = {
				"trigger_"
			}
		},
		unequip = {
			inputs = {
				"grip_"
			}
		}
	}
end

TabletHandState = TabletHandState or class(HandState)

function TabletHandState:init()
	TabletHandState.super.init(self)

	self._connections = {
		toggle_menu = {
			inputs = {
				"menu_"
			},
			condition = common.toggle_menu_condition
		}
	}
end

BeltHandState = BeltHandState or class(HandState)

function BeltHandState:init()
	BeltHandState.super.init(self, 1)

	self._connections = {
		toggle_menu = {
			inputs = {
				"menu_"
			},
			condition = common.toggle_menu_condition
		},
		belt_right = {
			hand = 1,
			inputs = {
				"grip_"
			}
		},
		belt_left = {
			hand = 2,
			inputs = {
				"grip_"
			}
		},
		disabled = {
			inputs = {
				"trigger_"
			}
		}
	}
end

RepeaterHandState = RepeaterHandState or class(HandState)

function RepeaterHandState:init()
	RepeaterHandState.super.init(self, 2)
end

DrivingHandState = DrivingHandState or class(HandState)

function DrivingHandState:init()
	DrivingHandState.super.init(self)

	self._connections = {
		toggle_menu = {
			inputs = {
				"menu_"
			},
			condition = common.toggle_menu_condition
		},
		hand_brake = {
			hand = 2,
			inputs = {
				"trackpad_button_"
			}
		},
		interact_right = {
			hand = 1,
			inputs = {
				"grip_"
			}
		},
		interact_left = {
			hand = 2,
			inputs = {
				"grip_"
			}
		}
	}
end
