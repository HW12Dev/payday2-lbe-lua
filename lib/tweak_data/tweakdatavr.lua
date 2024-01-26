TweakDataVR = TweakDataVR or class()

function TweakDataVR:init(tweak_data)
	self.melee_offsets = {
		default = {
			rotation = Rotation(0, 70)
		},
		types = {
			fists = {
				rotation = Rotation(180, 70, 180)
			}
		},
		weapons = {
			boxing_gloves = {
				rotation = Rotation(0, 0, 90),
				position = Vector3(0, -17, -2),
				hit_point = Vector3(-2, 20, 0)
			},
			dingdong = {
				position = Vector3(0, 4, 13)
			},
			fists = {
				hit_point = Vector3(0, 3, 0)
			},
			catch = {
				rotation = Rotation(0, 110, 180),
				hit_point = Vector3(5, 0, -20)
			},
			nin = {
				rotation = Rotation(),
				hit_point = Vector3(0, 20, 8)
			},
			ostry = {
				rotation = Rotation(0, 0, -90),
				hit_point = Vector3(-12, 42, 0)
			},
			scoutknife = {
				position = Vector3(0, 0, 3)
			},
			fairbair = {
				rotation = Rotation(90, 90, 20)
			},
			bowie = {
				rotation = Rotation(180, 110, 0),
				position = Vector3(0, 0, 3)
			},
			twins = {
				rotation = Rotation(90, 90, 20)
			},
			baseballbat = {
				position = Vector3(0, 2, 10)
			},
			sandsteel = {
				position = Vector3(0, 2, 6.5)
			},
			cutters = {
				rotation = Rotation(180, 110, 0)
			},
			alien_maul = {
				position = Vector3(0, 8, 26)
			},
			barbedwire = {
				position = Vector3(0, 0, 0)
			},
			beardy = {
				position = Vector3(0, 8, 26)
			},
			buck = {
				rotation = Rotation(90, 90, 20),
				hit_point = Vector3(4, 0, 2)
			},
			brick = {
				rotation = Rotation(0, -20, 0),
				position = Vector3(0, 5, 10),
				hit_point = Vector3(0, 0, 18)
			},
			tiger = {
				hand_flip = true,
				rotation = Rotation(175, 85, 180),
				hit_point = Vector3(0, 0, 8)
			},
			zeus = {
				hit_point = Vector3(0, 0, 10),
				rotation = Rotation(180, 110, 0)
			},
			freedom = {
				position = Vector3(0, 4, 15)
			},
			great = {
				position = Vector3(0, 1, 4)
			},
			clean = {
				anim = "charge",
				position = Vector3(0, 1, 0),
				rotation = Rotation(180, 90, -90),
				hit_point = Vector3(20, 0, 0)
			}
		},
		bayonets = {
			wpn_fps_snp_mosin_ns_bayonet = {
				hit_point = Vector3(0, 30, -3)
			}
		}
	}
	self.weapon_offsets = {
		default = {
			grip = "weapon_1_grip",
			position = Vector3(-0.5, 1.8, 2)
		},
		weapons = {
			deagle = {
				position = Vector3(-0.5, 1, 2)
			},
			new_raging_bull = {
				position = Vector3(-0.5, 3, 2)
			},
			usp = {
				position = Vector3(-0.5, 2.5, 1)
			},
			ppk = {
				position = Vector3(-0.5, 2, 1)
			},
			p226 = {
				position = Vector3(-0.2, 2, 2)
			},
			mateba = {
				position = Vector3(-0.5, 4, 2)
			},
			sparrow = {
				position = Vector3(-0.5, 1, 1.5)
			},
			pl14 = {
				position = Vector3(-0.5, 2, 2)
			},
			chinchilla = {
				position = Vector3(-0.5, 2, 2)
			},
			breech = {
				position = Vector3(-0.5, 1, 1)
			},
			shrew = {
				position = Vector3(-0.5, 1, 1)
			},
			x_usp = {
				position = Vector3(-0.5, 2.5, 1)
			},
			x_chinchilla = {
				position = Vector3(-0.5, 2, 2)
			},
			x_shrew = {
				position = Vector3(-0.5, 1, 1)
			},
			akmsu = {
				position = Vector3(0, 2, 2)
			},
			p90 = {
				grip = "weapon_2_grip",
				position = Vector3(-0.5, 2, 1)
			},
			mp9 = {
				position = Vector3(-0.5, -0.3, 1.5)
			},
			mac10 = {
				position = Vector3(-0.5, -1.5, 2)
			},
			m45 = {
				position = Vector3(-0.1, -0.4, 1)
			},
			mp7 = {
				position = Vector3(-0.5, -1, 2)
			},
			scorpion = {
				position = Vector3(0, 0.3, 2)
			},
			tec9 = {
				position = Vector3(-0.5, 0, 0)
			},
			uzi = {
				position = Vector3(-0.5, 0, 1.5)
			},
			m1928 = {
				position = Vector3(-0.5, 1, 1.5)
			},
			cobray = {
				position = Vector3(-0.5, -1, 1.5)
			},
			polymer = {
				position = Vector3(-0.5, -0.5, -0.5)
			},
			baka = {
				position = Vector3(-0.2, -0.5, 2.5)
			},
			sr2 = {
				position = Vector3(-0.2, -0.5, 0)
			},
			erma = {
				position = Vector3(-0.2, 2, 3.2)
			},
			x_akmsu = {
				position = Vector3(0, 2, 2)
			},
			x_sr2 = {
				position = Vector3(-0.2, -0.5, 0)
			},
			r870 = {
				position = Vector3(-0.5, 2, 1)
			},
			serbu = {
				position = Vector3(-0.5, 2, 1.2)
			},
			huntsman = {
				grip = "weapon_2_grip",
				position = Vector3(-0.8, 3, -3)
			},
			judge = {
				position = Vector3(-0.5, 3, 1.2)
			},
			benelli = {
				position = Vector3(-0.5, 2, 2)
			},
			b682 = {
				grip = "weapon_2_grip",
				position = Vector3(-0.5, 4, -2)
			},
			boot = {
				grip = "weapon_2_grip",
				position = Vector3(-0.5, 2, 0)
			},
			striker = {
				position = Vector3(-0.5, 1, 1)
			},
			aa12 = {
				position = Vector3(-0.5, 1, 1)
			},
			m37 = {
				grip = "weapon_2_grip",
				position = Vector3(-0.5, 2, -1)
			},
			spas12 = {
				position = Vector3(-0.1, 2, 2)
			},
			rota = {
				position = Vector3(-0.1, 2, 1.2)
			},
			basset = {
				position = Vector3(-0.1, 2, 1.2)
			},
			mosin = {
				position = Vector3(0, -6, 2)
			},
			r93 = {
				position = Vector3(-0.8, 0, 1)
			},
			wa2000 = {
				position = Vector3(0, -2, 2)
			},
			msr = {
				position = Vector3(-0.2, -1, 0)
			},
			winchester1874 = {
				position = Vector3(-0.2, -1, 0)
			},
			wa2000 = {
				position = Vector3(-0.2, -1, 2.3)
			},
			tti = {
				position = Vector3(-0.2, 1, 1)
			},
			desertfox = {
				position = Vector3(-0.2, 1, 1)
			},
			siltstone = {
				position = Vector3(-0.2, 1, 1)
			},
			gre_m79 = {
				grip = "weapon_2_grip",
				position = Vector3(-1.5, 1.8, 0)
			},
			m134 = {
				position = Vector3(-8, 29, 0)
			},
			m32 = {
				position = Vector3(-0.5, 0, 2)
			},
			arbiter = {
				position = Vector3(-0.5, 1, 1.6)
			},
			ray = {
				position = Vector3(-0.5, 0, 4)
			},
			ecp = {
				position = Vector3(-0.5, 1, 1)
			},
			slap = {
				position = Vector3(-0.5, 1, 3)
			},
			china = {
				grip = "weapon_2_grip",
				position = Vector3(-0.8, 0, 0)
			},
			hk21 = {
				position = Vector3(-0.5, 1, 2.8)
			},
			m249 = {
				position = Vector3(-0.5, 1, 1)
			},
			rpk = {
				position = Vector3(-0.5, 2, 1)
			},
			mg42 = {
				position = Vector3(-0.5, 1, -1)
			},
			ak5 = {
				position = Vector3(0, 2, 2)
			},
			fal = {
				position = Vector3(-0.5, 3, 1)
			},
			l85a2 = {
				position = Vector3(-0.5, 0.8, 2)
			},
			galil = {
				position = Vector3(-0.5, 0, 1)
			},
			vhs = {
				position = Vector3(-0.5, 0, 1)
			},
			asval = {
				position = Vector3(-0.5, 0, 1.5)
			},
			tecci = {
				position = Vector3(-0.5, 0, 1)
			},
			contraband = {
				position = Vector3(-0.5, 2, 1)
			},
			flint = {
				position = Vector3(-0.5, 1, 1)
			},
			ching = {
				grip = "weapon_2_grip",
				position = Vector3(-0.5, 3, -3)
			}
		}
	}
	self.throwable_offsets = {
		default = {},
		wpn_prj_ace = {
			grip = "grip_wpn",
			position = Vector3(0, 0, -3),
			rotation = Rotation(0, 30, 0)
		},
		wpn_prj_target = {
			grip = "grip_wpn",
			position = Vector3(0, 0, 3),
			rotation = Rotation(0, 70, 0)
		},
		wpn_prj_hur = {
			grip = "grip_wpn",
			position = Vector3(0, 0, 3),
			rotation = Rotation(180, 110, -40)
		}
	}
	self.magazine_offsets = {
		default = {
			position = Vector3(0, 0, 0),
			rotation = Rotation(0, 0, 0)
		},
		colt_1911 = {
			position = Vector3(0, 17, 0)
		},
		deagle = {
			position = Vector3(0, -2, 0)
		},
		usp = {
			position = Vector3(0, 18, 0)
		},
		ppk = {
			position = Vector3(0, 18, 0)
		},
		hs2000 = {
			position = Vector3(0, 1, 5)
		},
		sparrow = {
			position = Vector3(0, 2, -2)
		},
		pl14 = {
			position = Vector3(0, 3, -2)
		},
		lemming = {
			position = Vector3(0, 1.5, -2)
		},
		breech = {
			position = Vector3(2, 0, -4),
			rotation = Rotation(0, 20, 0)
		},
		new_raging_bull = {
			position = Vector3(3, 2, 2),
			rotation = Rotation(-45, 12, -20)
		},
		mateba = {
			position = Vector3(3, 2, 2),
			rotation = Rotation(-45, 12, -20)
		},
		chinchilla = {
			position = Vector3(3, 2, 2),
			rotation = Rotation(-45, 12, -20)
		},
		peacemaker = {
			position = Vector3(3, 2, 2),
			rotation = Rotation(-45, 12, -20)
		},
		c96 = {
			position = Vector3(0, 0, 2),
			rotation = Rotation(0, -15, 0)
		},
		x_1911 = {
			position = Vector3(0, 17, 0)
		},
		x_deagle = {
			position = Vector3(0, -2, 0)
		},
		x_usp = {
			position = Vector3(0, 18, 0)
		},
		x_chinchilla = {
			position = Vector3(3, 2, 2),
			rotation = Rotation(-45, 12, -20)
		},
		r870 = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70),
			weapon_offset = Vector3(0, 16, 8)
		},
		huntsman = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		b682 = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		judge = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		benelli = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		striker = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		ksg = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		spas12 = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		m37 = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		boot = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70)
		},
		aa12 = {
			position = Vector3(10, 0, 0),
			rotation = Rotation(90, 90, 30)
		},
		rota = {
			position = Vector3(3, 0, 1),
			rotation = Rotation(-1, 55, -4)
		},
		basset = {
			position = Vector3(0, 1, 3),
			rotation = Rotation(0, -25, 0)
		},
		serbu = {
			position = Vector3(3, 0, 0),
			rotation = Rotation(-223, -129, 70),
			weapon_offset = Vector3(0, 16, 8)
		},
		olympic = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		akmsu = {
			position = Vector3(0, 0, 2),
			rotation = Rotation(0, -35, 0)
		},
		mp9 = {
			position = Vector3(0, 1, 10)
		},
		mac10 = {
			position = Vector3(0, 0, 10)
		},
		new_mp5 = {
			position = Vector3(0, 0, 6),
			rotation = Rotation(0, -20, 0)
		},
		m45 = {
			position = Vector3(0, 0, 6)
		},
		p90 = {
			position = Vector3(0, 1, 7),
			rotation = Rotation(-90, 90, 170)
		},
		mp7 = {
			position = Vector3(0, 3.5, 10),
			rotation = Rotation(0, -15, 0)
		},
		scorpion = {
			position = Vector3(0, -2, 5),
			rotation = Rotation(0, -25, 0)
		},
		tec9 = {
			position = Vector3(1, -9, 8),
			rotation = Rotation(0, -15, 0)
		},
		uzi = {
			position = Vector3(1, 3, 12),
			rotation = Rotation(0, -15, 0)
		},
		sterling = {
			position = Vector3(0, 0, 5),
			rotation = Rotation(90, -90, -75)
		},
		m1928 = {
			position = Vector3(10, -2, 8)
		},
		cobray = {
			position = Vector3(1, 3, 12),
			rotation = Rotation(0, -15, 0)
		},
		polymer = {
			position = Vector3(0, 2, 8)
		},
		baka = {
			position = Vector3(1, 0, -5),
			rotation = Rotation(0, -15, 0)
		},
		sr2 = {
			position = Vector3(1, 2, 5),
			rotation = Rotation(0, -15, 0)
		},
		hajk = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		schakal = {
			position = Vector3(0, 0, 6),
			rotation = Rotation(0, -20, 0)
		},
		coal = {
			grip = "idle_wpn",
			position = Vector3(8, 2, 12),
			rotation = Rotation(50, 86, 20)
		},
		erma = {
			position = Vector3(1, 2, 8),
			rotation = Rotation(0, -15, 0)
		},
		x_mp5 = {
			position = Vector3(0, 0, 6),
			rotation = Rotation(0, -20, 0)
		},
		x_akmsu = {
			position = Vector3(0, 0, 2),
			rotation = Rotation(0, -35, 0)
		},
		x_sr2 = {
			position = Vector3(1, 2, 5),
			rotation = Rotation(0, -15, 0)
		},
		new_m4 = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		amcar = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		m16 = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		ak5 = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		aug = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		g36 = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		new_m14 = {
			position = Vector3(0, 0, 4)
		},
		s552 = {
			position = Vector3(0, 0, 4),
			rotation = Rotation(0, -20, 0)
		},
		fal = {
			position = Vector3(0, 3, 2)
		},
		g3 = {
			position = Vector3(0, -15, 0)
		},
		galil = {
			position = Vector3(0, 0, 0),
			rotation = Rotation(0, -20, 0)
		},
		famas = {
			position = Vector3(0, 1, -5),
			rotation = Rotation(0, -15, 0)
		},
		l85a2 = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		vhs = {
			position = Vector3(0, 1, 3),
			rotation = Rotation(0, -15, 0)
		},
		asval = {
			position = Vector3(0, 1.5, -4),
			rotation = Rotation(0, -25, 0)
		},
		tecci = {
			position = Vector3(5, 4, 0),
			rotation = Rotation(-187, -185, 87)
		},
		contraband = {
			position = Vector3(0, 3, -5),
			rotation = Rotation(0, -25, 0)
		},
		flint = {
			position = Vector3(0, -1, 2),
			rotation = Rotation(0, -25, 0)
		},
		ching = {
			position = Vector3(3, 2, 4),
			rotation = Rotation(99, -76, 16)
		},
		corgi = {
			position = Vector3(0, 3, 2),
			rotation = Rotation(0, -25, 0)
		},
		m95 = {
			position = Vector3(5, 0, 0),
			rotation = Rotation(33, 35, 50)
		},
		msr = {
			position = Vector3(5, 5, 5),
			rotation = Rotation(33, 35, 50)
		},
		r93 = {
			position = Vector3(2, 5, 5),
			rotation = Rotation(75, 45, 60)
		},
		wa2000 = {
			position = Vector3(0, 3, 5),
			rotation = Rotation(88, 100, 28)
		},
		model70 = {
			position = Vector3(0, 3, 5),
			rotation = Rotation(88, 100, 28)
		},
		desertfox = {
			position = Vector3(2, 1, 0),
			rotation = Rotation(88, 100, 28)
		},
		tti = {
			position = Vector3(1, 2, 0),
			rotation = Rotation(-2, -16, 9)
		},
		siltstone = {
			position = Vector3(1, 2, 5),
			rotation = Rotation(-2, -16, 9)
		},
		hk21 = {
			position = Vector3(12, 0, 0)
		},
		m249 = {
			position = Vector3(12, 0, 0)
		},
		rpk = {
			position = Vector3(8, 0, 4)
		},
		mg42 = {
			position = Vector3(7, 0, 0),
			weapon_offset = Vector3(0, 16, 8)
		},
		par = {
			position = Vector3(0, -3, -10),
			rotation = Rotation(25, 0, 0)
		},
		gre_m79 = {
			position = Vector3(1.5, 0, 2),
			rotation = Rotation(-45, 12, -20)
		},
		rpg7 = {
			position = Vector3(2, 0, -7),
			rotation = Rotation(67, 82, 0)
		},
		m32 = {
			position = Vector3(9, -2, -3),
			rotation = Rotation(-184, -178, 76)
		},
		flamethrower_mk2 = {
			position = Vector3(4, 0, 10),
			rotation = Rotation(0, 82, 0)
		},
		arbiter = {
			position = Vector3(0, 2, -4),
			rotation = Rotation(20, -15, 1)
		},
		china = {
			grip = "idle_wpn",
			position = Vector3(3, 0, 0),
			rotation = Rotation(-213, 23, -61)
		},
		ray = {
			position = Vector3(8, 0, 12),
			rotation = Rotation(40, -96, 5)
		},
		ecp = {
			position = Vector3(8, 0, 8),
			rotation = Rotation(86, -90, 6)
		},
		slap = {
			position = Vector3(1.5, 0, 2),
			rotation = Rotation(-45, 12, -20)
		}
	}
	self.locked = {
		melee_weapons = {
			weapon = true,
			road = true
		},
		weapons = {
			contraband = true
		},
		skills = {
			rifleman = {
				effect = "less",
				version = "basic"
			},
			shotgun_cqb = {
				effect = "less",
				version = "ace"
			},
			close_by = {
				effect = "none",
				version = "basic"
			},
			overkill = {
				effect = "less",
				version = "ace"
			},
			shock_and_awe = {
				effect = "none",
				version = "basic"
			},
			awareness = {
				effect = "none",
				version = "ace"
			},
			silence_expert = {
				effect = "less",
				version = "basic"
			},
			equilibrium = {
				effect = "none",
				version = "basic"
			},
			running_from_death = {
				effect = "less",
				version = "basic"
			}
		},
		perks = {
			[4] = {
				[9] = {
					effect = "less"
				}
			}
		}
	}
	self.weapon_kick = {
		kick_speed = 200,
		kick_mul = 1.5,
		max_kick = 20,
		return_speed = 10,
		precision_multiplier = 0.2,
		exclude_list = {
			flamethrower_mk2 = true,
			m134 = true,
			saw_secondary = true,
			saw = true
		}
	}
	self.custom_wall_check = {
		saw_secondary = "a_fl",
		saw = "a_fl"
	}
	self.weapon_hidden = {
		china = {
			lower_receiver = {
				"g_nade_empty"
			}
		},
		mateba = {
			magazine = {
				"g_loader_lod0"
			}
		},
		chinchilla = {
			magazine = {
				"g_speedloader"
			}
		},
		x_chinchilla = {
			magazine = {
				"g_speedloader"
			}
		}
	}
	self.weapon_assist = {
		weapons = {
			striker = {
				position = Vector3(0, 28, 0)
			},
			aa12 = {
				grip = "idle_wpn",
				position = Vector3(-1, 25, 3)
			},
			spas12 = {
				grip = "idle_wpn",
				position = Vector3(-1, 35, 0)
			},
			rota = {
				position = Vector3(0, 15, -2)
			},
			ksg = {
				position = Vector3(0, 22, -2)
			},
			saiga = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 4)
			},
			b682 = {
				grip = "idle_wpn",
				position = Vector3(-2, 25, 0)
			},
			m37 = {
				grip = "idle_wpn",
				position = Vector3(-2, 40, 0)
			},
			r870 = {
				grip = "idle_wpn",
				position = Vector3(-2, 40, 0)
			},
			huntsman = {
				grip = "idle_wpn",
				position = Vector3(-2, 25, 2)
			},
			benelli = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 2)
			},
			serbu = {
				grip = "idle_wpn",
				position = Vector3(-2, 35, 0)
			},
			basset = {
				position = Vector3(-2, 10, 0)
			},
			boot = {
				grip = "idle_wpn",
				position = Vector3(-2, 28, 2)
			},
			hk21 = {
				points = {
					{
						position = Vector3(-4.5, 39, 3.2)
					},
					{
						position = Vector3(-9.5, 17, -3.8)
					}
				}
			},
			rpk = {
				points = {
					{
						position = Vector3(0.5, 32, -1)
					},
					{
						position = Vector3(-7.5, 16, -7)
					}
				}
			},
			m249 = {
				points = {
					{
						position = Vector3(0, 30, 2)
					},
					{
						position = Vector3(-13, 15, 0)
					}
				}
			},
			mg42 = {
				points = {
					{
						position = Vector3(-2, 35, 4)
					},
					{
						position = Vector3(-15, 15, 6)
					}
				}
			},
			par = {
				points = {
					{
						position = Vector3(8, 30, 16)
					},
					{
						position = Vector3(-10, 24, 4)
					}
				}
			},
			m95 = {
				points = {
					{
						grip = "idle_wpn",
						position = Vector3(-2, 20, 4)
					},
					{
						position = Vector3(-11, 30, -8)
					}
				}
			},
			msr = {
				grip = "idle_wpn",
				position = Vector3(-2, 35, 4)
			},
			r93 = {
				grip = "idle_wpn",
				position = Vector3(-1, 30, 2)
			},
			mosin = {
				grip = "idle_wpn",
				position = Vector3(0, 40, 0)
			},
			winchester1874 = {
				grip = "idle_wpn",
				position = Vector3(-1, 35, 0)
			},
			wa2000 = {
				grip = "idle_wpn",
				position = Vector3(-1, 35, 0)
			},
			r93 = {
				grip = "idle_wpn",
				position = Vector3(-1, 30, 2)
			},
			model70 = {
				grip = "idle_wpn",
				position = Vector3(-1, 35, 0)
			},
			tti = {
				grip = "idle_wpn",
				position = Vector3(0, 26.5, 2)
			},
			siltstone = {
				grip = "idle_wpn",
				position = Vector3(-1, 35, 4)
			},
			desertfox = {
				grip = "idle_wpn",
				position = Vector3(-1, 18, 2)
			},
			olympic = {
				grip = "idle_wpn",
				position = Vector3(-2, 22, 4)
			},
			mp7 = {
				position = Vector3(0, 15, -2)
			},
			uzi = {
				position = Vector3(0, 15, -2)
			},
			m45 = {
				position = Vector3(0, 23, -3)
			},
			p90 = {
				position = Vector3(0, 10, -5)
			},
			polymer = {
				position = Vector3(0, 27, -5)
			},
			m1928 = {
				position = Vector3(0, 26, 0)
			},
			mp9 = {
				position = Vector3(0, 15, -5)
			},
			erma = {
				position = Vector3(0, 30, 1)
			},
			akmsu = {
				grip = "idle_wpn",
				position = Vector3(-2, 27, 3)
			},
			hajk = {
				position = Vector3(0, 25, -1)
			},
			coal = {
				grip = "idle_wpn",
				position = Vector3(-2, 25, 0)
			},
			new_mp5 = {
				grip = "idle_wpn",
				position = Vector3(-2, 20, 4)
			},
			sr2 = {
				position = Vector3(0, 15, 0)
			},
			cobray = {
				position = Vector3(0, 15, -4)
			},
			sterling = {
				points = {
					{
						grip = "idle_wpn",
						position = Vector3(-2, 20, 4)
					},
					{
						position = Vector3(-10, 10, 6)
					}
				}
			},
			schakal = {
				position = Vector3(0, 23, -2)
			},
			scorpion = {
				position = Vector3(0, 13, -2)
			},
			tec9 = {
				position = Vector3(0, 13, -2)
			},
			new_m4 = {
				grip = "idle_wpn",
				position = Vector3(-2, 25, 3)
			},
			m16 = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 4)
			},
			new_m14 = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 4)
			},
			amcar = {
				grip = "idle_wpn",
				position = Vector3(-2, 25, 3)
			},
			akm = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 4)
			},
			akm_gold = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 4)
			},
			ak74 = {
				grip = "idle_wpn",
				position = Vector3(0, 32, 4)
			},
			ak5 = {
				grip = "idle_wpn",
				position = Vector3(-2, 30, 4)
			},
			g36 = {
				grip = "idle_wpn",
				position = Vector3(-2, 24, 2)
			},
			aug = {
				position = Vector3(0, 15, -4)
			},
			g3 = {
				grip = "idle_wpn",
				position = Vector3(-2, 30, 2)
			},
			tecci = {
				position = Vector3(0, 24, 0)
			},
			l85a2 = {
				position = Vector3(0, 19, -4)
			},
			contraband = {
				grip = "idle_wpn",
				position = Vector3(-1, 30, 0)
			},
			famas = {
				grip = "idle_wpn",
				position = Vector3(-1, 20, 0)
			},
			fal = {
				grip = "idle_wpn",
				position = Vector3(-2, 30, 4)
			},
			galil = {
				grip = "idle_wpn",
				position = Vector3(-2, 27, 2)
			},
			vhs = {
				grip = "idle_wpn",
				position = Vector3(-2, 18, 0)
			},
			ching = {
				grip = "idle_wpn",
				position = Vector3(-2, 35, 4)
			},
			asval = {
				grip = "idle_wpn",
				position = Vector3(-2, 18, 1)
			},
			flint = {
				grip = "idle_wpn",
				position = Vector3(-2, 28, 4)
			},
			scar = {
				grip = "idle_wpn",
				position = Vector3(-1, 27, 3)
			},
			s552 = {
				grip = "idle_wpn",
				position = Vector3(-2, 25, 0)
			},
			sub2000 = {
				grip = "idle_wpn",
				position = Vector3(-2, 28, 2)
			},
			corgi = {
				position = Vector3(0, 22, -3)
			},
			rpg7 = {
				position = Vector3(0, -15, -2)
			},
			m134 = {
				points = {
					{
						position = Vector3(0, 0, 0)
					},
					{
						position = Vector3(14, 0, 0)
					}
				}
			},
			gre_m79 = {
				grip = "idle_wpn",
				position = Vector3(-1, 20, -2)
			},
			saw_secondary = {
				points = {
					{
						position = Vector3(-10, 25, 6)
					},
					{
						position = Vector3(8, 32, 8)
					}
				}
			},
			saw = {
				points = {
					{
						position = Vector3(-10, 25, 6)
					},
					{
						position = Vector3(8, 32, 8)
					}
				}
			},
			m32 = {
				position = Vector3(0, 37, -2)
			},
			arblast = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 0)
			},
			frankish = {
				grip = "idle_wpn",
				position = Vector3(-2, 32, 0)
			},
			arbiter = {
				grip = "idle_wpn",
				position = Vector3(-2, 20, 4)
			},
			flamethrower_mk2 = {
				position = Vector3(0, 22, -6)
			},
			china = {
				grip = "idle_wpn",
				position = Vector3(0, 48, -6)
			},
			ray = {
				position = Vector3(0, 20, -6)
			},
			ecp = {
				position = Vector3(0, 25, -2)
			},
			slap = {
				position = Vector3(0, 18, -1)
			}
		},
		limits = {
			pistol_max = 20,
			min = 5,
			max = 50
		}
	}
	self.reload_buff = 0.2
	self.reload_speed_mul = 1.2
	self.reload_timelines = {
		default_keys = {
			pos = Vector3(),
			rot = Rotation()
		},
		glock_17 = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		glock_18c = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		deagle = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -3, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -3, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -1.6, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -1.6, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		colt_1911 = {
			start = {
				{
					time = 0,
					sound = "wp_usp_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -4, -12)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_usp_clip_out",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -12)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -12)
				},
				{
					time = 0.6,
					sound = "wp_usp_mantel_back",
					pos = Vector3()
				}
			}
		},
		b92fs = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		new_raging_bull = {
			reload_part_type = "upper_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_pis_speedloader_6x/wpn_pis_speedloader_6x",
			start = {
				{
					time = 0,
					sound = "wp_rbull_drum_open",
					anims = {
						{
							anim_group = "reload",
							to = 0.7,
							from = 0.2,
							part = "upper_reciever"
						}
					}
				},
				{
					time = 0.19,
					visible = {
						visible = false,
						parts = {
							upper_reciever = {
								"g_bullets"
							}
						}
					},
					effect = {
						part = "upper_reciever",
						name = "effects/payday2/particles/weapons/shells/shell_revolver_dump",
						object = "align_house_align"
					}
				},
				{
					time = 0.9,
					sound = "wp_rbull_shells_out"
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_rbull_shells_in",
					visible = {
						visible = true,
						parts = {
							upper_reciever = {
								"g_bullets"
							}
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_rbull_drum_close",
					pos = Vector3(),
					anims = {
						{
							anim_group = "reload",
							part = "upper_reciever",
							from = 3.2
						}
					}
				}
			}
		},
		usp = {
			start = {
				{
					time = 0,
					sound = "wp_usp_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_usp_clip_out",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.6,
					sound = "wp_usp_mantel_back",
					pos = Vector3()
				}
			}
		},
		g22c = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		ppk = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2.5, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2.5, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		p226 = {
			start = {
				{
					time = 0,
					sound = "wp_usp_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_usp_clip_out",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2.5, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2.5, -10)
				},
				{
					time = 0.6,
					sound = "wp_usp_mantel_back",
					pos = Vector3()
				}
			}
		},
		g26 = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -3, -10)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		c96 = {
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_pis_c96_mag/wpn_pis_c96_mag",
			start = {
				{
					time = 0,
					sound = "wp_c96_mantel_back"
				},
				{
					time = 0.05
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_c96_mantel_back",
					anims = {
						{
							anim_group = "reload",
							to = 2.7,
							from = 2.6,
							part = "magazine"
						}
					}
				},
				{
					time = 0,
					sound = "wp_c96_second_slide"
				},
				{
					time = 0.5,
					sound = "wp_c96_release"
				},
				{
					time = 0.99,
					anims = {
						{
							anim_group = "reload",
							to = 0,
							part = "magazine"
						}
					}
				}
			}
		},
		hs2000 = {
			start = {
				{
					time = 0,
					sound = "wp_usp_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_usp_clip_out",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.6,
					sound = "wp_usp_mantel_back",
					pos = Vector3()
				}
			}
		},
		peacemaker = {
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_44/wpn_vr_m_44",
			start = {
				{
					time = 0,
					sound = "wp_pmkr45_cylinder_click_02",
					anims = {
						{
							anim_group = "reload",
							from = 2.7
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_pmkr45_shell_land"
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_pmkr45_load_bullet"
				},
				{
					time = 0.5,
					sound = "wp_foley_generic_lever_release",
					pos = Vector3()
				}
			}
		},
		mateba = {
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_pis_speedloader_6x/wpn_pis_speedloader_6x",
			start = {
				{
					time = 0,
					sound = "wp_mateba_open_barrel",
					anims = {
						{
							anim_group = "reload",
							to = 0.7,
							from = 0.3,
							part = "magazine"
						}
					}
				},
				{
					time = 0.15,
					sound = "wp_mateba_empty_barrel"
				},
				{
					time = 0.15,
					visible = {
						visible = false,
						parts = {
							magazine = {
								"g_bullets"
							}
						}
					},
					effect = {
						part = "magazine",
						name = "effects/payday2/particles/weapons/shells/shell_revolver_dump",
						object = "align_bullets"
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mateba_put_in_bullets",
					visible = {
						visible = true,
						parts = {
							magazine = {
								"g_bullets"
							}
						}
					},
					anims = {
						{
							anim_group = "reload",
							part = "magazine",
							from = 3.2
						}
					}
				},
				{
					time = 0.99,
					sound = "wp_mateba_close_barrel"
				}
			}
		},
		sparrow = {
			start = {
				{
					time = 0,
					sound = "wp_pmkr45_open_latch"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_pmkr45_load_bullet",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.6,
					sound = "wp_pmkr45_close_latch",
					pos = Vector3()
				}
			}
		},
		pl14 = {
			start = {
				{
					time = 0,
					sound = "wp_sparrow_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_sparrow_mag_in",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.6,
					sound = "wp_sparrow_cock",
					pos = Vector3()
				}
			}
		},
		packrat = {
			start = {
				{
					time = 0,
					sound = "wp_packrat_mag_throw"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -6, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_packrat_mag_in",
					visible = true,
					pos = Vector3(0, -6, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2.5, -7)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2.5, -7)
				},
				{
					time = 0.6,
					sound = "wp_packrat_slide_release",
					pos = Vector3()
				}
			}
		},
		lemming = {
			start = {
				{
					time = 0,
					sound = "wp_lemming_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_lemming_mag_in",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.6,
					sound = "wp_lemming_mantle_forward",
					pos = Vector3()
				}
			}
		},
		chinchilla = {
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_pis_speedloader_6x/wpn_pis_speedloader_6x",
			start = {
				{
					time = 0,
					sound = "wp_chinchilla_cylinder_out",
					anims = {
						{
							anim_group = "reload",
							to = 0.5
						}
					}
				},
				{
					time = 0.02,
					sound = "wp_chinchilla_eject_shells"
				},
				{
					time = 0.25,
					visible = false,
					effect = {
						object = "a_m",
						name = "effects/payday2/particles/weapons/shells/shell_revolver_dump"
					}
				}
			},
			finish = {
				{
					visible = true,
					time = 0,
					sound = "wp_chinchilla_insert"
				},
				{
					time = 0,
					sound = "wp_chinchilla_insert",
					visible = {
						visible = false,
						parts = {
							magazine = {
								"g_speedloader"
							}
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_chinchilla_cylinder_in",
					anims = {
						{
							anim_group = "reload",
							from = 2.7
						}
					}
				}
			}
		},
		breech = {
			start = {
				{
					time = 0,
					sound = "wp_breech_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -13, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_breech_clip_slide_in",
					visible = true,
					pos = Vector3(0, -13, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -6, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -6, -10)
				},
				{
					time = 0.6,
					sound = "wp_breech_lock_release",
					pos = Vector3()
				}
			}
		},
		shrew = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		mp9 = {
			start = {
				{
					time = 0,
					sound = "wp_mac10_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mac10_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_mac10_lever_release",
					pos = Vector3()
				}
			}
		},
		olympic = {
			start = {
				{
					time = 0,
					sound = "wp_m4_clip_grab_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m4_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m4_lever_release",
					pos = Vector3()
				}
			}
		},
		akmsu = {
			start = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_ak47_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		p90 = {
			start = {
				{
					time = 0,
					sound = "wp_p90_clip_slide_out"
				},
				{
					time = 0.01,
					pos = Vector3(0, -1, 2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.03,
					pos = Vector3(0, -1.2, 2.2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.04,
					pos = Vector3(0, -15, 4),
					rot = Rotation(0, 0, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(10, -15, 4),
					rot = Rotation(1, -4, -4)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_p90_clip_slide_in",
					visible = true,
					pos = Vector3(0, -15, 4),
					rot = Rotation(0, 0, 0)
				},
				{
					time = 0.01,
					pos = Vector3(0, -1.2, 2.2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.45,
					pos = Vector3(0, -1, 2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.5,
					sound = "wp_p90_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		new_mp5 = {
			start = {
				{
					time = 0,
					sound = "wp_mp5_clip_grab"
				},
				{
					time = 0.02,
					pos = Vector3(0, 2, -4),
					rot = Rotation(0, 20, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 2, -20),
					rot = Rotation(0, 10, 0)
				},
				{
					time = 0.051,
					pos = Vector3(0, 2, -10),
					rot = Rotation()
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mp5_clip_slide_in",
					visible = true,
					pos = Vector3(0, 2, -10),
					rot = Rotation()
				},
				{
					time = 0.04,
					pos = Vector3(0, 2, -4),
					rot = Rotation()
				},
				{
					time = 0.045,
					pos = Vector3(0, 2, -4),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_mp5_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		mac10 = {
			start = {
				{
					time = 0,
					sound = "wp_mac10_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mac10_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_mac10_lever_release",
					pos = Vector3()
				}
			}
		},
		m45 = {
			start = {
				{
					time = 0,
					sound = "wp_m45_clip_grab_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m45_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m45_lever_release",
					pos = Vector3()
				}
			}
		},
		mp7 = {
			start = {
				{
					time = 0,
					sound = "wp_mp7_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mp7_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.2,
					pos = Vector3(0, 0, -7.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -7)
				},
				{
					time = 0.6,
					sound = "wp_mp7_lever_release",
					pos = Vector3()
				}
			}
		},
		scorpion = {
			start = {
				{
					time = 0,
					sound = "wp_scorpion_clip_slide_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_scorpion_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_scorpion_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		tec9 = {
			start = {
				{
					time = 0,
					sound = "wp_tec9_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_tec9_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_tec9_lever_release",
					pos = Vector3()
				}
			}
		},
		uzi = {
			start = {
				{
					time = 0,
					sound = "wp_uzi_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_uzi_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_uzi_clip_lever_release",
					pos = Vector3()
				}
			}
		},
		sterling = {
			start = {
				{
					time = 0,
					sound = "wp_sterling_clip_remove"
				},
				{
					time = 0.019,
					pos = Vector3(-3, 4, 0),
					rot = Rotation(0, 0, 0)
				},
				{
					time = 0.02,
					pos = Vector3(-3, 4, 0),
					rot = Rotation(-30, 0, 0)
				},
				{
					drop_mag = true,
					time = 0.03,
					visible = false,
					pos = Vector3(-20, 0, 0),
					rot = Rotation(-60, 0, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_sterling_clip_insert",
					visible = true,
					pos = Vector3(-10, 0, 0),
					rot = Rotation()
				},
				{
					time = 0.1,
					pos = Vector3(-5, 0, 0),
					rot = Rotation(-30, 0, 0)
				},
				{
					time = 0.56,
					pos = Vector3(-5, 0, 0),
					rot = Rotation(-30, 0, 0)
				},
				{
					time = 0.6,
					sound = "wp_sterling_lever_pull",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		m1928 = {
			start = {
				{
					time = 0,
					sound = "wp_m1928_mag_empty_out"
				},
				{
					time = 0.01,
					pos = Vector3(-4, 0, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(-8, 0, -10)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m1928_mag_slide_in",
					visible = true,
					pos = Vector3(-8, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(-4, 0, -0.5)
				},
				{
					time = 0.56,
					pos = Vector3(-4, 0, -0.1)
				},
				{
					time = 0.6,
					sound = "wp_m1928_lever_release",
					pos = Vector3()
				}
			}
		},
		cobray = {
			start = {
				{
					time = 0,
					sound = "wp_cobray_mag_slipping"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_cobray_mag_slap",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_cobray_lever_release",
					pos = Vector3()
				}
			}
		},
		polymer = {
			start = {
				{
					time = 0,
					sound = "wp_polymer_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_polymer_mag_in",
					visible = true,
					pos = Vector3(0, -7, -15)
				},
				{
					time = 0.1,
					pos = Vector3(0, -3.5, -11)
				},
				{
					time = 0.56,
					pos = Vector3(0, -3.5, -10)
				},
				{
					time = 0.6,
					sound = "wp_polymer_button_press",
					pos = Vector3()
				}
			}
		},
		baka = {
			start = {
				{
					time = 0,
					sound = "wp_baka_mag_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_baka_mag_slide_in",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_baka_lever_release",
					pos = Vector3()
				}
			}
		},
		sr2 = {
			start = {
				{
					time = 0,
					sound = "wp_sr2_pull_out_mag"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_sr2_put_in_mag",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.5,
					sound = "wp_sr2_release_lever",
					pos = Vector3()
				}
			}
		},
		hajk = {
			start = {
				{
					time = 0,
					sound = "hajk_push_mag_release"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "hajk_push_in_mag",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "hajk_release_lever",
					pos = Vector3()
				}
			}
		},
		schakal = {
			start = {
				{
					time = 0,
					sound = "wp_schakal_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_schakal_mag_in",
					visible = true,
					pos = Vector3(0, 2.5, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0.9, -3.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0.9, -3.5)
				},
				{
					time = 0.6,
					sound = "wp_schakal_bolt_slap",
					pos = Vector3()
				}
			}
		},
		coal = {
			start = {
				{
					time = 0,
					sound = "wp_coal_mag_out_back"
				},
				{
					time = 0.001,
					pos = Vector3(0, 0, 0),
					rot = Rotation(0, 5, 0)
				},
				{
					time = 0.025,
					pos = Vector3(0, 0, 0),
					rot = Rotation(0, 6, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -12),
					rot = Rotation(0, 40, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_coal_mag_in_back",
					visible = true,
					pos = Vector3(0, 0, -12),
					rot = Rotation(0, 40, 0)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, 0),
					rot = Rotation(0, 6, 0)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, 0),
					rot = Rotation(0, 5, 0)
				},
				{
					time = 0.6,
					sound = "wp_coal_release_lever",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		erma = {
			start = {
				{
					time = 0,
					sound = "wp_erma_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_erma_mag_in",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -3.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -3.5)
				},
				{
					time = 0.6,
					sound = "wp_erma_slide_release",
					pos = Vector3()
				}
			}
		},
		serbu = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_reinbeck_reload_cock"
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_reinbeck_shell_insert"
				},
				{
					time = 0.5,
					sound = "wp_reinbeck_reload_cock"
				}
			}
		},
		judge = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_rbull_drum_open",
					anims = {
						{
							anim_group = "reload",
							to = 1,
							from = 0.5,
							part = "lower_reciever"
						}
					}
				},
				{
					time = 0.02,
					sound = "wp_rbull_shells_out"
				},
				{
					time = 0.09,
					visible = {
						visible = false,
						parts = {
							lower_reciever = {
								"g_bullet_1",
								"g_bullet_2",
								"g_bullet_3",
								"g_bullet_4",
								"g_bullet_5"
							}
						}
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_rbull_shells_in",
					anims = {
						{
							anim_group = "reload",
							part = "lower_reciever",
							from = 1.9
						}
					},
					visible = {
						visible = true,
						parts = {
							lower_reciever = {
								"g_bullet_1",
								"g_bullet_2",
								"g_bullet_3",
								"g_bullet_4",
								"g_bullet_5"
							}
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_rbull_drum_close"
				}
			}
		},
		striker = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_reinbeck_reload_cock"
				},
				{
					time = 0.03
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_reinbeck_shell_insert"
				},
				{
					time = 0.5,
					sound = "wp_reinbeck_reload_cock"
				}
			}
		},
		m37 = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_m37_reload_enter"
				},
				{
					time = 0.03
				}
			},
			finish = {
				{
					time = 0,
					anims = {
						{
							anim_group = "reload_exit",
							to = 0.7,
							from = 0.2,
							part = "foregrip"
						}
					}
				},
				{
					time = 0,
					sound = "wp_m37_insert_shell"
				},
				{
					time = 0.6,
					sound = "wp_m37_reload_exit_push_handle"
				}
			}
		},
		rota = {
			start = {
				{
					time = 0,
					sound = "wp_rota_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_rota_slide_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4),
					rot = Rotation(0, 10, 60)
				},
				{
					time = 0.8,
					pos = Vector3(0, 0, -3),
					rot = Rotation(0, 10, 60)
				},
				{
					time = 0.99,
					sound = "wp_rota_rotate_mag",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		basset = {
			start = {
				{
					time = 0,
					sound = "basset_mag_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "basset_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "basset_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		rpg7 = {
			start = {
				{
					time = 0,
					visible = false
				},
				{
					time = 0.03,
					pos = Vector3(0, 80, -10),
					rot = Rotation()
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_rpg_grenade_slide_01",
					visible = true,
					pos = Vector3(0, 80, 0),
					rot = Rotation()
				},
				{
					time = 0.11,
					pos = Vector3(0, 5, 0),
					rot = Rotation(0, 0, 60)
				},
				{
					time = 0.7,
					pos = Vector3(0, 5, 0),
					rot = Rotation(0, 0, 40)
				},
				{
					time = 0.99,
					sound = "wp_rpg_safety_click_01",
					pos = Vector3(0, 0, 0.1),
					rot = Rotation()
				}
			}
		},
		hunter = {
			start = {
				{
					time = 0,
					sound = "wp_dragon_lever_pull",
					anims = {
						{
							anim_group = "reload",
							to = 0.5
						}
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_dragon_insert_arrow",
					visible = true,
					pos = Vector3(0, -20, 0)
				},
				{
					time = 0.5,
					sound = "wp_dragon_lever_release",
					pos = Vector3(),
					anims = {
						{
							anim_group = "reload",
							from = 2.7
						}
					}
				}
			}
		},
		china = {
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_grenade/wpn_vr_m_grenade_3",
			start = {
				{
					time = 0,
					visible = false
				},
				{
					time = 0.03,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_china_push_in_shell",
					visible = true,
					pos = Vector3(0, -10, -20),
					rot = Rotation(0, 0, -10)
				},
				{
					time = 0.3,
					sound = "wp_china_push_in_shell",
					visible = true,
					pos = Vector3(0, -10, -8),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.8,
					sound = "wp_china_push_in_shell",
					visible = true,
					pos = Vector3(0, -8, -5),
					rot = Rotation(0, 20, 0)
				},
				{
					time = 0.9,
					sound = "wp_china_push_in_shell",
					visible = true,
					pos = Vector3(0, -7, -2),
					rot = Rotation(0, 20, 0)
				},
				{
					time = 0.99,
					sound = "wp_china_push_handle",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		arbiter = {
			start = {
				{
					time = 0,
					sound = "arbiter_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "arbiter_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "arbiter_release_lever",
					pos = Vector3()
				}
			}
		},
		ray = {
			start = {
				{
					time = 0,
					visible = false
				},
				{
					time = 0.03,
					pos = Vector3(0, -40, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ray_push_down_01",
					visible = true,
					pos = Vector3(0, -40, 0)
				},
				{
					time = 0.5,
					sound = "wp_ray_hit",
					pos = Vector3()
				}
			}
		},
		ecp = {
			start = {
				{
					time = 0,
					sound = "wp_ecp_remove_clip"
				},
				{
					time = 0.01,
					pos = Vector3(0, -1, 2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.03,
					pos = Vector3(0, -1.2, 2.2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.04,
					pos = Vector3(0, -15, 4),
					rot = Rotation(0, 0, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(10, -15, 4),
					rot = Rotation(1, -4, -4)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ecp_attach_clip",
					visible = true,
					pos = Vector3(0, -15, 4),
					rot = Rotation(0, 0, 0)
				},
				{
					time = 0.01,
					pos = Vector3(0, -1.2, 2.2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.45,
					pos = Vector3(0, -1, 2),
					rot = Rotation(0, -5, 0)
				},
				{
					time = 0.5,
					sound = "ecp_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		slap = {
			start = {
				{
					time = 0,
					anims = {
						{
							anim_group = "reload",
							to = 1,
							from = 0.4
						}
					}
				},
				{
					sound = "wp_gl40_shell_out",
					time = 0.2,
					visible = {
						visible = false,
						parts = {
							magazine = true
						}
					},
					effect = {
						object = "a_m",
						name = "effects/payday2/particles/weapons/shells/shell_40mm"
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_gl40_shell_in",
					visible = {
						visible = true,
						parts = {
							magazine = true
						}
					}
				},
				{
					time = 0.99,
					sound = "wp_gl40_barrel_close",
					pos = Vector3(),
					anims = {
						{
							anim_group = "reload",
							from = 3
						}
					}
				}
			}
		},
		new_m4 = {
			start = {
				{
					time = 0,
					sound = "wp_m4_clip_grab_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m4_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m4_lever_release",
					pos = Vector3()
				}
			}
		},
		amcar = {
			start = {
				{
					time = 0,
					sound = "wp_m4_clip_grab_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m4_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m4_lever_release",
					pos = Vector3()
				}
			}
		},
		m16 = {
			start = {
				{
					time = 0,
					sound = "wp_m16_clip_grab_throw"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m16_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m16_lever_release",
					pos = Vector3()
				}
			}
		},
		ak74 = {
			start = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_ak47_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		akm = {
			start = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_ak47_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		akm_gold = {
			start = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_ak47_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		ak5 = {
			start = {
				{
					time = 0,
					sound = "wp_m4_clip_grab_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m4_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m4_lever_release",
					pos = Vector3()
				}
			}
		},
		aug = {
			start = {
				{
					time = 0,
					sound = "wp_aug_clip_grab_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_aug_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_aug_lever_release",
					pos = Vector3()
				}
			}
		},
		g36 = {
			start = {
				{
					time = 0,
					sound = "wp_g36_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g36_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_g36_clip_in_hit",
					pos = Vector3()
				}
			}
		},
		new_m14 = {
			start = {
				{
					time = 0,
					sound = "wp_m14_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m14_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m14_lever_release",
					pos = Vector3()
				}
			}
		},
		s552 = {
			start = {
				{
					time = 0,
					sound = "wp_sig553_clip_grab"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_sig553_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_sig553_lever_punch",
					pos = Vector3()
				}
			}
		},
		scar = {
			start = {
				{
					time = 0,
					sound = "wp_scar_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_scar_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_scar_push_release",
					pos = Vector3()
				}
			}
		},
		fal = {
			start = {
				{
					time = 0,
					sound = "wp_fn_fal_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_fn_fal_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_fn_fal_lever_release",
					pos = Vector3()
				}
			}
		},
		g3 = {
			start = {
				{
					time = 0,
					sound = "wp_g3_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g3_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_g3_lever_release",
					pos = Vector3()
				}
			}
		},
		galil = {
			start = {
				{
					time = 0,
					sound = "wp_galil_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_galil_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_galil_lever_release",
					pos = Vector3()
				}
			}
		},
		famas = {
			start = {
				{
					time = 0,
					sound = "wp_famas_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_famas_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_famas_lever_release",
					pos = Vector3()
				}
			}
		},
		l85a2 = {
			start = {
				{
					time = 0,
					sound = "wp_l85_mag_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_l85_mag_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_l85_lever_release",
					pos = Vector3()
				}
			}
		},
		vhs = {
			start = {
				{
					time = 0,
					sound = "wp_vhs_mag_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_vhs_mag_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_vhs_lever_release",
					pos = Vector3()
				}
			}
		},
		asval = {
			start = {
				{
					time = 0,
					sound = "asval_mag_click_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "asval_mag_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "asval_release_lever",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		sub2000 = {
			start = {
				{
					time = 0,
					sound = "sub2k_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20),
					rot = Rotation()
				}
			},
			finish = {
				{
					time = 0,
					sound = "sub2k_mag_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -1.5, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, -1.5, -4.5)
				},
				{
					time = 0.6,
					sound = "sub2k_release_lever",
					pos = Vector3()
				}
			}
		},
		tecci = {
			start = {
				{
					time = 0,
					sound = "wp_tecci_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_tecci_mag_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_tecci_bolt_release",
					pos = Vector3()
				}
			}
		},
		contraband = {
			start = {
				{
					time = 0,
					sound = "contraband_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "contraband_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "contraband_bolt_release",
					pos = Vector3()
				}
			}
		},
		contraband_m203 = {
			start = {
				{
					time = 0,
					sound = "contraband_grenade_pull_handle"
				},
				{
					drop_mag = true,
					time = 0.03,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "contraband_grenade_shell_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.5,
					sound = "contraband_grenade_push_handle",
					pos = Vector3()
				}
			}
		},
		flint = {
			start = {
				{
					time = 0,
					sound = "wp_flint_mag_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_flint_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_flint_cock_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		ching = {
			start = {
				{
					visible = false,
					time = 0,
					sound = "ching_bolt_back"
				},
				{
					time = 0.05,
					pos = Vector3(0, 0, 10),
					rot = Rotation(0, 10, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "ching_clip_in",
					visible = true,
					pos = Vector3(0, 0, 10),
					rot = Rotation(0, 10, 0)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, 2),
					rot = Rotation(0, 5, 0)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, 2)
				},
				{
					time = 0.6,
					sound = "ching_bolt_forward",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		corgi = {
			start = {
				{
					time = 0,
					sound = "corgi_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "corgi_clip_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "corgi_lever_release",
					pos = Vector3()
				}
			}
		},
		jowi = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -3, -10)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2, -7)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		x_1911 = {
			start = {
				{
					time = 0,
					sound = "wp_usp_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -4, -12)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_usp_clip_out",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -12)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -12)
				},
				{
					time = 0.6,
					sound = "wp_usp_mantel_back",
					pos = Vector3()
				}
			}
		},
		x_b92fs = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		x_deagle = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -3, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -3, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -1.6, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -1.6, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		x_g22c = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		x_g17 = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		x_usp = {
			start = {
				{
					time = 0,
					sound = "wp_usp_clip_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -5, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_usp_clip_out",
					visible = true,
					pos = Vector3(0, -5, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -3, -10)
				},
				{
					time = 0.6,
					sound = "wp_usp_mantel_back",
					pos = Vector3()
				}
			}
		},
		x_sr2 = {
			start = {
				{
					time = 0,
					sound = "wp_sr2_pull_out_mag"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_sr2_put_in_mag",
					visible = true,
					pos = Vector3(0, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.5,
					sound = "wp_sr2_release_lever",
					pos = Vector3()
				}
			}
		},
		x_mp5 = {
			start = {
				{
					time = 0,
					sound = "wp_mp5_clip_grab"
				},
				{
					time = 0.02,
					pos = Vector3(0, 2, -4),
					rot = Rotation(0, 20, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 2, -20),
					rot = Rotation(0, 10, 0)
				},
				{
					time = 0.051,
					pos = Vector3(0, 2, -10),
					rot = Rotation()
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mp5_clip_slide_in",
					visible = true,
					pos = Vector3(0, 2, -10),
					rot = Rotation()
				},
				{
					time = 0.04,
					pos = Vector3(0, 2, -4),
					rot = Rotation()
				},
				{
					time = 0.045,
					pos = Vector3(0, 2, -4),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_mp5_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		x_akmsu = {
			start = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_ak47_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		x_packrat = {
			start = {
				{
					time = 0,
					sound = "wp_packrat_mag_throw"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -6, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_packrat_mag_in",
					visible = true,
					pos = Vector3(0, -6, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -2.5, -7)
				},
				{
					time = 0.56,
					pos = Vector3(0, -2.5, -7)
				},
				{
					time = 0.6,
					sound = "wp_packrat_slide_release",
					pos = Vector3()
				}
			}
		},
		x_chinchilla = {
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_pis_speedloader_6x/wpn_pis_speedloader_6x",
			start = {
				{
					time = 0,
					sound = "wp_chinchilla_cylinder_out",
					anims = {
						{
							anim_group = "reload_right",
							to = 0.5
						},
						{
							anim_group = "reload_left",
							to = 0.5
						}
					}
				},
				{
					time = 0.02,
					sound = "wp_chinchilla_eject_shells"
				},
				{
					time = 0.25,
					visible = false,
					effect = {
						object = "a_m",
						name = "effects/payday2/particles/weapons/shells/shell_revolver_dump"
					}
				}
			},
			finish = {
				{
					visible = true,
					time = 0,
					sound = "wp_chinchilla_insert"
				},
				{
					time = 0,
					visible = {
						visible = false,
						parts = {
							magazine = {
								"g_speedloader"
							}
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_chinchilla_cylinder_in",
					anims = {
						{
							anim_group = "reload_right",
							from = 3.45
						},
						{
							anim_group = "reload_left",
							from = 3.45
						}
					}
				}
			}
		},
		x_shrew = {
			start = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, -7, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_g17_clip_slide_in",
					visible = true,
					pos = Vector3(0, -7, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.56,
					pos = Vector3(0, -4, -10)
				},
				{
					time = 0.6,
					sound = "wp_g17_lever_release",
					pos = Vector3()
				}
			}
		},
		x_basset = {
			start = {
				{
					time = 0,
					sound = "basset_mag_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "basset_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "basset_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		r870 = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_reinbeck_reload_cock"
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_reinbeck_shell_insert"
				},
				{
					time = 0.5,
					sound = "wp_reinbeck_reload_cock"
				}
			}
		},
		saiga = {
			start = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_ak47_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_ak47_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		huntsman = {
			reload_part_type = "barrel",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_2",
			start = {
				{
					time = 0,
					sound = "wp_huntsman_barrel_open",
					anims = {
						{
							anim_group = "reload",
							to = 1,
							from = 0.5,
							part = "barrel"
						}
					}
				},
				{
					time = 0.02,
					sound = "wp_huntsman_shell_out"
				},
				{
					time = 0.03,
					visible = {
						visible = false,
						parts = {
							barrel = {
								"g_slug_left",
								"g_slug_right"
							}
						}
					},
					effect = {
						part = "barrel",
						name = "effects/payday2/particles/weapons/shells/shell_slug_2x",
						object = "a_slugs"
					}
				}
			},
			finish = {
				{
					sound = "wp_huntsman_shell_insert",
					time = 0,
					visible = {
						visible = true,
						parts = {
							barrel = {
								"g_slug_left",
								"g_slug_right"
							}
						}
					}
				},
				{
					time = 0.4,
					sound = "wp_huntsman_barrel_close",
					anims = {
						{
							anim_group = "reload",
							part = "barrel",
							from = 2.3
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_huntsman_lock_click"
				}
			}
		},
		benelli = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_reinbeck_reload_cock"
				},
				{
					time = 0.03
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_reinbeck_shell_insert"
				},
				{
					time = 0.5,
					sound = "wp_benelli_lever_release"
				}
			}
		},
		ksg = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_reinbeck_reload_cock"
				},
				{
					time = 0.03
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_reinbeck_shell_insert"
				},
				{
					time = 0.5,
					sound = "wp_benelli_lever_release"
				}
			}
		},
		spas12 = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "wp_reinbeck_reload_cock"
				},
				{
					time = 0.03
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_reinbeck_shell_insert"
				},
				{
					time = 0.5,
					sound = "wp_benelli_lever_release"
				}
			}
		},
		b682 = {
			reload_part_type = "barrel",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_2",
			start = {
				{
					time = 0,
					sound = "wp_b682_barrel_open_01",
					anims = {
						{
							anim_group = "reload",
							to = 1,
							from = 0.5,
							part = "barrel"
						}
					},
					visible = {
						visible = false,
						parts = {
							barrel = {
								"g_slug_lower_lod0",
								"g_slug_upper_lod0"
							}
						}
					},
					effect = {
						part = "barrel",
						name = "effects/payday2/particles/weapons/shells/shell_slug_2x",
						object = "a_slugs"
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_b682_load_shell_01",
					pos = Vector3(),
					visible = {
						visible = true,
						parts = {
							barrel = {
								"g_slug_lower_lod0",
								"g_slug_upper_lod0"
							}
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_b682_barrel_close_01",
					pos = Vector3(),
					anims = {
						{
							anim_group = "reload",
							part = "barrel",
							from = 2.5
						}
					}
				},
				{
					time = 0.7
				}
			}
		},
		aa12 = {
			start = {
				{
					time = 0,
					sound = "wp_aa12_clip_out"
				},
				{
					time = 0.01,
					pos = Vector3(0, 0.1, -4)
				},
				{
					time = 0.06,
					pos = Vector3(0, 0.1, -4)
				},
				{
					drop_mag = true,
					time = 0.1,
					visible = false,
					pos = Vector3(0, 2, -30)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_aa12_clip_in",
					visible = true,
					pos = Vector3(0, 2, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0.1, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0.1, -4.5)
				},
				{
					time = 0.6,
					sound = "wp_aa12_lever_pull",
					pos = Vector3()
				}
			}
		},
		boot = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_slug/wpn_vr_m_slug_6",
			start = {
				{
					time = 0,
					sound = "boot_reload_enter",
					anims = {
						{
							anim_group = "reload_exit",
							to = 0,
							from = 0,
							part = "lower_reciever"
						},
						{
							anim_group = "reload_enter",
							to = 1,
							from = 0.1,
							part = "lower_reciever"
						}
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "boot_push_in_shell"
				},
				{
					time = 0.5,
					sound = "boot_reload_empty_push_handle",
					anims = {
						{
							anim_group = "reload_enter",
							to = 0.1,
							from = 0.1,
							part = "lower_reciever"
						},
						{
							anim_group = "reload_exit",
							part = "lower_reciever",
							from = 0.2
						}
					}
				}
			}
		},
		hk21 = {
			start = {
				{
					time = 0,
					sound = "wp_hk21_box_out"
				},
				{
					time = 0.01,
					pos = Vector3(-5, 0, -1)
				},
				{
					time = 0.03,
					pos = Vector3(-5, 0, -1)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_hk21_box_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(-5, 0, -1)
				},
				{
					time = 0.56,
					pos = Vector3(-5, 0, -1)
				},
				{
					time = 0.6,
					sound = "wp_hk21_lever_release",
					pos = Vector3()
				}
			}
		},
		m249 = {
			start = {
				{
					time = 0,
					sound = "wp_m249_box_out"
				},
				{
					time = 0.01,
					pos = Vector3(-2, 0, -2)
				},
				{
					time = 0.03,
					pos = Vector3(-2, 0, -2)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m249_box_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(-2, 0, -2)
				},
				{
					time = 0.56,
					pos = Vector3(-2, 0, -2)
				},
				{
					time = 0.6,
					sound = "wp_m249_lever_release",
					pos = Vector3()
				}
			}
		},
		rpk = {
			start = {
				{
					time = 0,
					sound = "wp_rpk_box_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_rpk_box_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_rpk_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		mg42 = {
			reload_part_type = "lower_reciever",
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_mg42/wpn_vr_m_mg42",
			start = {
				{
					time = 0,
					sound = "wp_mg42_cover_open"
				},
				{
					time = 0.03,
					sound = "wp_mg42_box_remove",
					visible = {
						visible = false,
						parts = {
							lower_reciever = {
								"g_mag",
								"g_bullet_1",
								"g_bullet_2",
								"g_bullet_3",
								"g_bullet_4",
								"g_bullet_5",
								"g_bullet_6",
								"g_band_1",
								"g_band_2",
								"g_band_3",
								"g_band_4",
								"g_mag_handle"
							}
						}
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mg42_box_slide_in",
					visible = {
						visible = true,
						parts = {
							lower_reciever = {
								"g_mag",
								"g_bullet_1",
								"g_bullet_2",
								"g_bullet_3",
								"g_bullet_4",
								"g_bullet_5",
								"g_bullet_6",
								"g_band_1",
								"g_band_2",
								"g_band_3",
								"g_band_4",
								"g_mag_handle"
							}
						}
					}
				},
				{
					time = 0.56,
					sound = "wp_mg42_cover_close"
				},
				{
					time = 0.6,
					sound = "wp_mg42_lever_release"
				}
			}
		},
		par = {
			start = {
				{
					time = 0,
					sound = "wp_svinet_mag_out"
				},
				{
					time = 0.01,
					pos = Vector3(-2, 0, -2)
				},
				{
					time = 0.03,
					pos = Vector3(-2, 0, -2)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_svinet_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(-2, 0, -2)
				},
				{
					time = 0.56,
					pos = Vector3(-2, 0, -2)
				},
				{
					time = 0.6,
					sound = "wp_svinet_lever_release",
					pos = Vector3()
				}
			}
		},
		m95 = {
			start = {
				{
					time = 0,
					sound = "wp_m95_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m95_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m95_lever_release",
					pos = Vector3()
				}
			}
		},
		msr = {
			start = {
				{
					time = 0,
					sound = "wp_msr_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_msr_clip_slide_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_msr_lever_release",
					pos = Vector3()
				}
			}
		},
		r93 = {
			start = {
				{
					time = 0,
					sound = "wp_blazer_clip_slide_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_blazer_clip_punch_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_blazer_lever_release",
					pos = Vector3()
				}
			}
		},
		mosin = {
			start = {
				{
					time = 0,
					sound = "wp_nagant_pull_bolt_back"
				},
				{
					time = 0.03
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_nagant_second_slide"
				},
				{
					time = 0.4,
					sound = "wp_nagant_push_bolt"
				},
				{
					time = 0.5,
					sound = "wp_nagant_push_bolt_side"
				}
			}
		},
		winchester1874 = {
			start = {
				{
					time = 0,
					sound = "wp_m1873_lever_pull"
				},
				{
					time = 0.03
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m1873_bullet_in"
				},
				{
					time = 0.5,
					sound = "wp_m1873_lever_push"
				}
			}
		},
		wa2000 = {
			start = {
				{
					time = 0,
					sound = "lakner_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "lakner_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "lakner_lever_release",
					pos = Vector3()
				}
			}
		},
		model70 = {
			start = {
				{
					time = 0,
					sound = "wp_m70_mag_out_01"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_m70_mag_in_01",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_m70_pull_lever_01",
					pos = Vector3()
				}
			}
		},
		desertfox = {
			start = {
				{
					time = 0,
					sound = "wp_desertfox_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_desertfox_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_desertfox_push_bolt",
					pos = Vector3()
				}
			}
		},
		tti = {
			start = {
				{
					time = 0,
					sound = "wp_tti_mag_out"
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 5, -20),
					rot = Rotation(0, 30, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_tti_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.1,
					pos = Vector3(0, 0, -4.5)
				},
				{
					time = 0.56,
					pos = Vector3(0, 0, -4)
				},
				{
					time = 0.6,
					sound = "wp_tti_release_lever",
					pos = Vector3()
				}
			}
		},
		siltstone = {
			start = {
				{
					time = 0,
					sound = "wp_siltstone_mag_out"
				},
				{
					time = 0.02,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(0, 10, -20),
					rot = Rotation(0, 60, 0)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_siltstone_mag_in",
					visible = true,
					pos = Vector3(0, 0, -20),
					rot = Rotation()
				},
				{
					time = 0.3,
					pos = Vector3(0, 4, -1),
					rot = Rotation(0, 30, 0)
				},
				{
					time = 0.5,
					sound = "wp_siltstone_lever_release",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		flamethrower_mk2 = {
			start = {
				{
					time = 0,
					sound = "wp_flamethrower_unlock_tank"
				},
				{
					time = 0.01,
					sound = "wp_flamethrower_pull_out_tank"
				},
				{
					drop_mag = true,
					time = 0.03,
					visible = false,
					pos = Vector3(0, -20, 0),
					rot = Rotation(0, 0, 180)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_flamethrower_push_in_tank",
					visible = true,
					pos = Vector3(0, -20, 0),
					rot = Rotation(0, 0, 180)
				},
				{
					time = 0.5,
					sound = "wp_flamethrower_insert_tank",
					pos = Vector3(),
					rot = Rotation()
				}
			}
		},
		gre_m79 = {
			start = {
				{
					time = 0,
					sound = "wp_gl40_lock_open",
					anims = {
						{
							anim_group = "reload",
							to = 1,
							from = 0.4
						}
					},
					visible = {
						visible = false,
						parts = {
							magazine = true
						}
					}
				},
				{
					time = 0.01,
					sound = "wp_gl40_barrel_open"
				},
				{
					time = 0.12,
					sound = "wp_gl40_shell_out",
					effect = {
						object = "a_m",
						name = "effects/payday2/particles/weapons/shells/shell_40mm"
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_gl40_shell_in",
					visible = {
						visible = true,
						parts = {
							magazine = true
						}
					}
				},
				{
					time = 0.99,
					sound = "wp_gl40_barrel_close",
					pos = Vector3(),
					anims = {
						{
							anim_group = "reload",
							from = 3
						}
					}
				}
			}
		},
		saw = {
			start = {
				{
					time = 0,
					sound = "wp_saw_blade_grab_throw"
				},
				{
					drop_mag = true,
					time = 0.03,
					visible = false,
					pos = Vector3(0, 0, -20)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_saw_blade_load",
					visible = true,
					pos = Vector3(0, 0, -20)
				},
				{
					time = 0.5,
					sound = "wp_saw_blade_spin",
					pos = Vector3()
				}
			}
		},
		m134 = {
			start = {
				{
					time = 0,
					sound = "wp_minigun_belt_out"
				},
				{
					time = 0.001,
					pos = Vector3(4, 0, -1)
				},
				{
					time = 0.03,
					sound = "wp_minigun_box_out",
					pos = Vector3(4, 0, -1)
				},
				{
					drop_mag = true,
					time = 0.05,
					visible = false,
					pos = Vector3(20, 0, -10)
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_minigun_box_in",
					visible = true,
					pos = Vector3(20, 0, -10)
				},
				{
					time = 0.1,
					pos = Vector3(4, 0, -1)
				},
				{
					time = 0.88,
					pos = Vector3(4, 0, -1)
				},
				{
					time = 0.9,
					sound = "wp_minigun_belt_in",
					pos = Vector3()
				}
			}
		},
		m32 = {
			custom_mag_unit = "units/pd2_dlc_vr/units/wpn_vr_m_grenade/wpn_vr_m_grenade_6",
			start = {
				{
					time = 0,
					sound = "wp_mgl_open",
					anims = {
						{
							anim_group = "reload_exit",
							to = 0.1,
							from = 0.1
						},
						{
							anim_group = "reload_enter",
							to = 1.7,
							from = 1.2
						}
					}
				},
				{
					time = 0.02,
					sound = "wp_mgl_drag_out_empty_shell"
				},
				{
					time = 0.03,
					pos = Vector3(),
					visible = {
						visible = false,
						parts = {
							magazine = {
								"g_gre_lod0",
								"g_casing_1_lod0",
								"g_casing_2_lod0",
								"g_casing_3_lod0",
								"g_casing_4_lod0",
								"g_casing_5_lod0",
								"g_casing_6_lod0",
								"g_casing_07_lod0"
							}
						}
					},
					effect = {
						object = "a_m",
						name = "effects/payday2/particles/weapons/shells/shell_40mm_6x_dump"
					}
				}
			},
			finish = {
				{
					time = 0,
					sound = "wp_mgl_rotate_mag",
					pos = Vector3(),
					anims = {
						{
							anim_group = "reload_exit",
							to = 1,
							from = 0.1
						}
					}
				},
				{
					time = 0.5,
					sound = "wp_mgl_close_mag",
					pos = Vector3(),
					visible = {
						visible = true,
						parts = {
							magazine = {
								"g_gre_lod0",
								"g_casing_1_lod0",
								"g_casing_2_lod0",
								"g_casing_3_lod0",
								"g_casing_4_lod0",
								"g_casing_5_lod0",
								"g_casing_6_lod0",
								"g_casing_07_lod0"
							}
						}
					}
				}
			}
		},
		plainsrider = {
			start = {
				{
					time = 0
				},
				{
					time = 0.03,
					visible = false,
					pos = Vector3(0, 0, 0)
				}
			},
			finish = {
				{
					time = 0,
					visible = true,
					pos = Vector3(0, 0, 0)
				},
				{
					time = 0.5,
					sound = "wp_bow_new_arrow",
					pos = Vector3()
				}
			}
		},
		arblast = {
			start = {
				{
					time = 0
				},
				{
					time = 0.03,
					visible = false,
					pos = Vector3(0, 0, 0)
				}
			},
			finish = {
				{
					time = 0,
					visible = true,
					pos = Vector3(0, 0, 0)
				},
				{
					time = 0.5,
					sound = "wp_arblast_arrow_click_01",
					pos = Vector3()
				}
			}
		},
		frankish = {
			start = {
				{
					time = 0
				},
				{
					time = 0.03,
					visible = false,
					pos = Vector3(0, 0, 0)
				}
			},
			finish = {
				{
					time = 0,
					visible = true,
					pos = Vector3(0, 0, 0)
				},
				{
					time = 0.5,
					sound = "wp_frankish_new_arrow",
					pos = Vector3()
				}
			}
		},
		long = {
			start = {
				{
					time = 0
				},
				{
					time = 0.03,
					visible = false,
					pos = Vector3(0, 0, 0)
				}
			},
			finish = {
				{
					time = 0,
					visible = true,
					pos = Vector3(0, 0, 0)
				},
				{
					time = 0.5,
					sound = "wp_long_new_arrow",
					pos = Vector3()
				}
			}
		},
		ecp = {
			start = {
				{
					time = 0
				},
				{
					drop_mag = true,
					time = 0.03,
					visible = false,
					pos = Vector3(0, 0, 0)
				}
			},
			finish = {
				{
					time = 0,
					visible = true,
					pos = Vector3(0, 0, 0)
				},
				{
					time = 0.5,
					sound = "wp_long_new_arrow",
					pos = Vector3()
				}
			}
		}
	}
	self.reload_timelines.saw_secondary = self.reload_timelines.saw
	self.weapon_sound_overrides = {
		x_sr2 = {
			sounds = {
				fire_single = "sr2_fire_single",
				fire = "sr2_fire_single",
				fire_auto = "sr2_fire",
				stop_fire = "sr2_stop"
			}
		}
	}
	self.wall_check_delay = 0.2
	self.loading_screens = {
		loading = {
			loading_root = {
				visible = true,
				position = Vector3(0, 500, 150),
				rotation = Rotation(0, 0, 0),
				children = {
					loading_spin = {
						visible = true,
						width = 50,
						order = 3,
						position = Vector3(0, 0, 0),
						rotation = Rotation(0, 0, 0),
						texture = Idstring("guis/dlcs/vr/textures/loading/icon_loading")
					}
				}
			},
			floor = {
				width = 800,
				visible = true,
				order = 2,
				position = Vector3(0, 0, 0),
				rotation = Rotation(0, -90, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/floor_df")
			},
			roof = {
				width = 1000,
				visible = true,
				order = 2,
				position = Vector3(0, 0, 500),
				rotation = Rotation(0, 90, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/darkness_df")
			},
			darkness_below = {
				width = 10000,
				visible = true,
				order = 2,
				position = Vector3(0, 0, -10),
				rotation = Rotation(0, -90, 0),
				color = Color(1, 1, 1, 1),
				texture = Idstring("guis/dlcs/vr/textures/loading/darkness_df")
			},
			logo = {
				width = 1400,
				visible = true,
				order = 2,
				position = Vector3(0, 1000, 300),
				rotation = Rotation(0, 0, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/logotype_df")
			},
			background_pattern = {
				width = 4000,
				visible = true,
				order = 2,
				position = Vector3(0, 2000, 1000),
				rotation = Rotation(0, 0, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/front_bg_pattern_df")
			}
		},
		loading_arcade = {
			loading_root = {
				visible = true,
				position = Vector3(0, 500, 150),
				rotation = Rotation(0, 0, 0),
				children = {
					loading_spin = {
						visible = true,
						width = 50,
						order = 3,
						position = Vector3(0, 0, 0),
						rotation = Rotation(0, 0, 0),
						texture = Idstring("guis/dlcs/vr/textures/loading/icon_loading")
					}
				}
			},
			smoke_group = {
				visible = true,
				position = Vector3(-580, 850, 200),
				rotation = Rotation(0, 0, 0),
				children = {
					smoke_1 = {
						width = 1200,
						visible = true,
						order = 3,
						position = Vector3(0, 0, 0),
						rotation = Rotation(0, 0, 0),
						color = Color(1, 0.02, 0.02, 0.02),
						texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
					}
				}
			},
			smoke_group_small = {
				visible = true,
				position = Vector3(-800, 0, 200),
				rotation = Rotation(30, 0, 0),
				children = {
					smoke_1 = {
						width = 1000,
						visible = true,
						order = 3,
						position = Vector3(0, 0, 0),
						rotation = Rotation(0, 0, 0),
						color = Color(1, 0.02, 0.02, 0.02),
						texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
					}
				}
			},
			smoke_group_2 = {
				visible = true,
				position = Vector3(400, 550, 200),
				rotation = Rotation(0, 0, 0),
				children = {
					smoke_2_1 = {
						width = 1000,
						visible = true,
						order = 3,
						position = Vector3(0, 0, 0),
						rotation = Rotation(0, 0, 0),
						color = Color(1, 0.02, 0.02, 0.02),
						texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
					}
				}
			},
			smoke_lining_left_01 = {
				width = 500,
				visible = true,
				order = 4,
				position = Vector3(-400, 150, 100),
				rotation = Rotation(60, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_left_02 = {
				width = 1200,
				visible = true,
				order = 4,
				position = Vector3(-700, 350, 220),
				rotation = Rotation(80, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_left_03 = {
				width = 2000,
				visible = true,
				order = 4,
				position = Vector3(-800, 850, 350),
				rotation = Rotation(30, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_left_04 = {
				width = 1000,
				visible = true,
				order = 4,
				position = Vector3(-800, -150, 200),
				rotation = Rotation(90, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_right_01 = {
				width = 500,
				visible = true,
				order = 4,
				position = Vector3(400, 150, 100),
				rotation = Rotation(-60, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_right_02 = {
				width = 1200,
				visible = true,
				order = 4,
				position = Vector3(700, 350, 220),
				rotation = Rotation(-80, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_right_03 = {
				width = 2000,
				visible = true,
				order = 4,
				position = Vector3(800, 850, 350),
				rotation = Rotation(-30, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_right_04 = {
				width = 1000,
				visible = true,
				order = 4,
				position = Vector3(800, -150, 200),
				rotation = Rotation(-90, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_back_01 = {
				width = 1000,
				visible = true,
				order = 4,
				position = Vector3(0, -1000, 200),
				rotation = Rotation(-180, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_back_02 = {
				width = 1800,
				visible = true,
				order = 4,
				position = Vector3(1000, -800, 350),
				rotation = Rotation(-150, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_lining_back_03 = {
				width = 1800,
				visible = true,
				order = 4,
				position = Vector3(-1000, -800, 350),
				rotation = Rotation(-220, 0, 0),
				color = Color(1, 0.03, 0.03, 0.03),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_2_df")
			},
			smoke_ground = {
				width = 2000,
				visible = true,
				order = 4,
				position = Vector3(-250, 150, 10),
				rotation = Rotation(180, -90, 0),
				color = Color(1, 0.015, 0.015, 0.015),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
			},
			smoke_ground_02 = {
				width = 2000,
				visible = true,
				order = 4,
				position = Vector3(250, 70, 10),
				rotation = Rotation(120, -90, 0),
				color = Color(1, 0.015, 0.015, 0.015),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
			},
			smoke_ground_03 = {
				width = 5000,
				visible = true,
				order = 4,
				position = Vector3(0, 1500, 0),
				rotation = Rotation(0, -90, 0),
				color = Color(1, 0.015, 0.015, 0.015),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
			},
			smoke_ground_04 = {
				width = 5000,
				visible = true,
				order = 4,
				position = Vector3(-200, -200, 10),
				rotation = Rotation(-90, -90, 0),
				color = Color(1, 0.015, 0.015, 0.015),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
			},
			smoke_ground_05 = {
				width = 5000,
				visible = true,
				order = 4,
				position = Vector3(200, 0, 10),
				rotation = Rotation(30, -90, 0),
				color = Color(1, 0.015, 0.015, 0.015),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
			},
			smoke_ground_05 = {
				width = 5000,
				visible = true,
				order = 4,
				position = Vector3(1000, -1200, 10),
				rotation = Rotation(-130, -90, 0),
				color = Color(1, 0.015, 0.015, 0.015),
				texture = Idstring("guis/dlcs/vr/textures/loading/smoke_df")
			},
			floor = {
				width = 800,
				visible = true,
				order = 2,
				position = Vector3(0, 0, 0),
				rotation = Rotation(0, -90, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/floor_df")
			},
			roof = {
				width = 1000,
				visible = true,
				order = 2,
				position = Vector3(0, 0, 500),
				rotation = Rotation(0, 90, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/darkness_df")
			},
			darkness_below = {
				width = 10000,
				visible = true,
				order = 2,
				position = Vector3(0, 0, -10),
				rotation = Rotation(0, -90, 0),
				color = Color(1, 1, 1, 1),
				texture = Idstring("guis/dlcs/vr/textures/loading/darkness_df")
			},
			logo = {
				width = 1400,
				visible = true,
				order = 2,
				position = Vector3(0, 1000, 300),
				rotation = Rotation(0, 0, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/logotype_arcade_df")
			},
			background_pattern = {
				width = 4000,
				visible = true,
				order = 2,
				position = Vector3(0, 2000, 1000),
				rotation = Rotation(0, 0, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/front_bg_pattern_df")
			}
		},
		loading_arcade_end = {
			floor = {
				width = 800,
				visible = true,
				order = 2,
				position = Vector3(0, 0, 0),
				rotation = Rotation(0, -90, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/floor_df")
			},
			roof = {
				width = 1000,
				visible = true,
				order = 2,
				position = Vector3(0, 0, 500),
				rotation = Rotation(0, 90, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/darkness_df")
			},
			darkness_below = {
				width = 10000,
				visible = true,
				order = 2,
				position = Vector3(0, 0, -10),
				rotation = Rotation(0, -90, 0),
				color = Color(1, 1, 1, 1),
				texture = Idstring("guis/dlcs/vr/textures/loading/darkness_df")
			},
			logo = {
				width = 1400,
				visible = true,
				order = 2,
				position = Vector3(0, 1000, 300),
				rotation = Rotation(0, 0, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/logotype_arcade_df")
			},
			thanksforplaying = {
				width = 500,
				visible = true,
				order = 3,
				position = Vector3(0, 400, 100),
				rotation = Rotation(0, 0, 0),
				color = Color(1, 0.5, 0.5, 0.5),
				texture = Idstring("guis/dlcs/vr/textures/loading/thanksforplaying_df")
			},
			background_pattern = {
				width = 4000,
				visible = true,
				order = 2,
				position = Vector3(0, 2000, 1000),
				rotation = Rotation(0, 0, 0),
				texture = Idstring("guis/dlcs/vr/textures/loading/front_bg_pattern_df")
			}
		}
	}
	self.mask_offsets = {
		default = {
			position = Vector3(0, -5, 5),
			rotation = Rotation(180, 135, 0)
		}
	}
	self.ladder = {
		distance = 500
	}
	self.autowarp_length = {
		short = 0.65,
		long = 1
	}
	self.heartbeat_time = 5
	self.driving = {
		muscle = {
			max_angle = 170,
			steering_pos = Vector3(-40, 51, 110),
			middle_pos = Vector3(-40, 44, 94),
			exit_pos = {
				driver = {
					position = Vector3(-70, 35, 75),
					direction = Vector3(-1, 0, 0)
				},
				passenger_back_left = {
					position = Vector3(-70, -55, 75),
					direction = Vector3(-1, 0, 0)
				},
				passenger_back_right = {
					position = Vector3(70, -55, 75),
					direction = Vector3(1, 0, 0)
				},
				passenger_front = {
					position = Vector3(70, 35, 75),
					direction = Vector3(1, 0, 0)
				}
			}
		},
		falcogini = {
			max_angle = 170,
			steering_pos = Vector3(-36, 50, 90),
			middle_pos = Vector3(-36, 45, 72),
			exit_pos = {
				driver = {
					position = Vector3(-69, 18, 66),
					direction = Vector3(-1, 0, 0)
				},
				passenger_front = {
					position = Vector3(69, 18, 66),
					direction = Vector3(1, 0, 0)
				}
			}
		},
		forklift = {
			max_angle = 90,
			steering_pos = Vector3(-9, 43, 150),
			middle_pos = Vector3(-9, 31, 140),
			exit_pos = {
				driver = {
					position = Vector3(-50, 0, 140),
					direction = Vector3(-1, 0, 0)
				},
				passenger_front = {
					position = Vector3(0, -130, 130),
					direction = Vector3(0, 0, -1),
					up = Vector3(0, -1, 0)
				}
			}
		},
		boat_rib_1 = {
			max_angle = 30,
			inverted = true,
			steering_pos = Vector3(-6, -100, 68),
			middle_pos = Vector3(-6, -170, 68),
			steering_dir = Vector3(0, 0, -1),
			steering_up = Vector3(0, 1, 0),
			exit_pos = {
				driver = {
					position = Vector3(-75, -130, 120),
					direction = Vector3(-1, 0, 0)
				},
				passenger_front = {
					position = Vector3(130, 130, 120),
					direction = Vector3(1, 0, 0)
				},
				passenger_back_right = {
					position = Vector3(130, -30, 120),
					direction = Vector3(1, 0, 0)
				},
				passenger_back_left = {
					position = Vector3(-130, 30, 120),
					direction = Vector3(-1, 0, 0)
				}
			}
		},
		bike_2 = {
			max_angle = 20,
			steering_pos = {
				left = Vector3(-38, 28, 105),
				right = Vector3(38, 28, 105)
			},
			exit_pos = {
				driver = {
					position = Vector3(-70, 0, 120),
					direction = Vector3(-1, 0, 0)
				}
			}
		},
		box_truck_1 = {
			max_angle = 90,
			steering_pos = Vector3(-48, 250, 165),
			middle_pos = Vector3(-48, 232, 155),
			exit_pos = {
				driver = {
					position = Vector3(-82, 235, 130),
					direction = Vector3(0, 0, -1),
					up = Vector3(0, 1, 0)
				},
				passenger_front = {
					position = Vector3(82, 235, 130),
					direction = Vector3(0, 0, -1),
					up = Vector3(0, 1, 0)
				},
				passenger_back_right = {
					position = Vector3(82, -300, 150),
					direction = Vector3(1, 0, 0)
				},
				passenger_back_left = {
					position = Vector3(-82, -300, 150),
					direction = Vector3(-1, 0, 0)
				}
			}
		},
		blackhawk_1 = {
			exit_pos = {
				driver = {
					position = Vector3(-160, 10, 120),
					direction = Vector3(-1, 0, 0)
				},
				passenger_front = {
					position = Vector3(160, 10, 120),
					direction = Vector3(1, 0, 0)
				},
				passenger_back_right = {
					position = Vector3(160, -65, 120),
					direction = Vector3(1, 0, 0)
				},
				passenger_back_left = {
					position = Vector3(-160, -65, 120),
					direction = Vector3(-1, 0, 0)
				}
			}
		}
	}
	self.overlay_effects = {
		fade_in_rotate_player = {
			blend_mode = "normal",
			sustain = 0,
			play_paused = true,
			fade_in = 0,
			fade_out = 0.21,
			color = Color(1, 0, 0, 0),
			timer = TimerManager:main()
		}
	}
end

function TweakDataVR:is_locked(category, id, ...)
	local locked = self.locked[category] and self.locked[category][id]

	if type(locked) == "table" then
		local args = {
			...
		}

		for _, v in ipairs(args) do
			if not locked[v] then
				return false
			end

			locked = locked[v]
		end
	end

	return locked
end

function TweakDataVR:get_offset_by_id(id, ...)
	if id == "magazine" then
		return self:_get_magazine_offsets_by_id(...)
	end

	if tweak_data.blackmarket.melee_weapons[id] then
		return self:_get_melee_offset_by_id(id)
	elseif tweak_data.weapon[id] then
		return self:_get_weapon_offset_by_id(id)
	elseif tweak_data.blackmarket.masks[id] then
		return self:_get_mask_offsets_by_id(id)
	elseif tweak_data.blackmarket.projectiles[id] then
		return self:_get_throwable_offsets_by_id(id)
	end

	return {}
end

local function combine_offset(offset, new)
	for key, value in pairs(new) do
		offset[key] = offset[key] or value
	end
end

function TweakDataVR:_get_melee_offset_by_id(id)
	local offset = {}
	local tweak = tweak_data.blackmarket.melee_weapons[id]

	if self.melee_offsets.weapons[id] then
		combine_offset(offset, self.melee_offsets.weapons[id])
	end

	if tweak and self.melee_offsets.types[tweak.type] then
		combine_offset(offset, self.melee_offsets.types[tweak.type])
	end

	combine_offset(offset, self.melee_offsets.default)

	return offset
end

function TweakDataVR:_get_weapon_offset_by_id(id)
	local offset = {}

	if self.weapon_offsets.weapons[id] then
		combine_offset(offset, self.weapon_offsets.weapons[id])
	end

	combine_offset(offset, self.weapon_offsets.default)

	return offset
end

function TweakDataVR:_get_mask_offsets_by_id(id)
	local offset = {}

	combine_offset(offset, self.mask_offsets.default)

	return offset
end

function TweakDataVR:_get_throwable_offsets_by_id(id)
	local offset = {}

	if self.throwable_offsets[id] then
		combine_offset(offset, self.throwable_offsets[id])

		offset.grip = self.throwable_offsets[id].grip
	end

	combine_offset(offset, self.throwable_offsets.default)

	return offset
end

function TweakDataVR:_get_magazine_offsets_by_id(id)
	local offset = {}

	if self.magazine_offsets[id] then
		combine_offset(offset, self.magazine_offsets[id])
	end

	combine_offset(offset, self.magazine_offsets.default)

	return offset
end
