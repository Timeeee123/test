Config.DefaultWeaponTints = {
	[0] = _U('tint_default'),
	[1] = _U('tint_green'),
	[2] = _U('tint_gold'),
	[3] = _U('tint_pink'),
	[4] = _U('tint_army'),
	[5] = _U('tint_lspd'),
	[6] = _U('tint_orange'),
	[7] = _U('tint_platinum')
}

Config.Weapons = {
	-- Melee
	{name = 'WEAPON_DAGGER', label = _U('weapon_dagger'), components = {}},
	{name = 'WEAPON_BAT', label = _U('weapon_bat'), components = {}},
	{name = 'WEAPON_BATV1', label = _U('weapon_batv1'), components = {}},
	{name = 'WEAPON_BATV2', label = _U('weapon_batv2'), components = {}},
	{name = 'WEAPON_BATTLEAXE', label = _U('weapon_battleaxe'), components = {}},
	{
		name = 'WEAPON_KNUCKLE',
		label = _U('weapon_knuckle'),
		components = {
			{name = 'knuckle_base', label = _U('component_knuckle_base'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_BASE")},
			{name = 'knuckle_pimp', label = _U('component_knuckle_pimp'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_PIMP")},
			{name = 'knuckle_ballas', label = _U('component_knuckle_ballas'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_BALLAS")},
			{name = 'knuckle_dollar', label = _U('component_knuckle_dollar'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_DOLLAR")},
			{name = 'knuckle_diamond', label = _U('component_knuckle_diamond'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_DIAMOND")},
			{name = 'knuckle_hate', label = _U('component_knuckle_hate'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_HATE")},
			{name = 'knuckle_love', label = _U('component_knuckle_love'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_LOVE")},
			{name = 'knuckle_player', label = _U('component_knuckle_player'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_PLAYER")},
			{name = 'knuckle_king', label = _U('component_knuckle_king'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_KING")},
			{name = 'knuckle_vagos', label = _U('component_knuckle_vagos'), hash = GetHashKey("COMPONENT_KNUCKLE_VARMOD_VAGOS")}
		}
	},
	{name = 'WEAPON_BOTTLE', label = _U('weapon_bottle'), components = {}},
	{name = 'WEAPON_BOTTLE2', label = _U('weapon_bottle2'), components = {}},
	{name = 'WEAPON_CROWBAR', label = _U('weapon_crowbar'), components = {}},
	{name = 'WEAPON_FLASHLIGHT', label = _U('weapon_flashlight'), components = {}},
	{name = 'WEAPON_GOLFCLUB', label = _U('weapon_golfclub'), components = {}},
	{name = 'WEAPON_HAMMER', label = _U('weapon_hammer'), components = {}},
	{name = 'WEAPON_HATCHET', label = _U('weapon_hatchet'), components = {}},
	{name = 'WEAPON_KNIFE', label = _U('weapon_knife'), components = {}},
	{name = 'WEAPON_MACHETE', label = _U('weapon_machete'), components = {}},
	{name = 'WEAPON_NIGHTSTICK', label = _U('weapon_nightstick'), components = {}},
	{name = 'WEAPON_WRENCH', label = _U('weapon_wrench'), components = {}},
	{name = 'WEAPON_POOLCUE', label = _U('weapon_poolcue'), components = {}},
	{name = 'WEAPON_STONE_HATCHET', label = _U('weapon_stone_hatchet'), components = {}},


	{
		name = 'WEAPON_SWITCHBLADE',
		label = _U('weapon_switchblade'),
		components = {
			{name = 'handle_default', label = _U('component_handle_default'), hash = GetHashKey("COMPONENT_SWITCHBLADE_VARMOD_BASE")},
			{name = 'handle_vip', label = _U('component_handle_vip'), hash = GetHashKey("COMPONENT_SWITCHBLADE_VARMOD_VAR1")},
			{name = 'handle_bodyguard', label = _U('component_handle_bodyguard'), hash = GetHashKey("COMPONENT_SWITCHBLADE_VARMOD_VAR2")}
		}
	},
	-- Handguns
	{
		name = 'WEAPON_APPISTOL',
		label = _U('weapon_appistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_APPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_APPISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE")}
		}
	},
	{name = 'WEAPON_CERAMICPISTOL', label = _U('weapon_ceramicpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{
		name = 'WEAPON_COMBATPISTOL',
		label = _U('weapon_combatpistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER")}
		}
	},
	{name = 'WEAPON_DOUBLEACTION', label = _U('weapon_doubleaction'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{name = 'WEAPON_NAVYREVOLVER', label = _U('weapon_navyrevolver'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{name = 'WEAPON_FLAREGUN', label = _U('weapon_flaregun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_flaregun'), hash = GetHashKey("AMMO_FLAREGUN")}},
	{name = 'WEAPON_GADGETPISTOL', label = _U('weapon_gadgetpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{
		name = 'WEAPON_HEAVYPISTOL',
		label = _U('weapon_heavypistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_REVOLVER',
		label = _U('weapon_revolver'),
		ammo = {label = _U('ammo_rounds'),hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_REVOLVER_CLIP_01")},
			{name = 'vip_finish', label = _U('component_vip_finish'), hash = GetHashKey("COMPONENT_REVOLVER_VARMOD_BOSS")},
			{name = 'bodyguard_finish', label = _U('component_bodyguard_finish'), hash = GetHashKey("COMPONENT_REVOLVER_VARMOD_GOON")}
		}
	},
	{
		name = 'WEAPON_REVOLVER_MK2',
		label = _U('weapon_revolver_mk2'),
		ammo = {label = _U('ammo_rounds'),hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_01")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_FMJ")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'compensator', label = _U('component_compensator'), hash = GetHashKey("COMPONENT_AT_PI_COMP_03")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_IND_01")}
		}
	},
	{name = 'WEAPON_MARKSMANPISTOL', label = _U('weapon_marksmanpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")}},
	{
		name = 'WEAPON_PISTOL',
		label = _U('weapon_pistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_PISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_PISTOL_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_PISTOL_MK2',
		label = _U('weapon_pistol_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_PI_RAIL")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{name = 'compensator', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_COMP")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01")},
			{name = 'camo_slide_finish', label = _U('component_camo_slide_finish'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_SLIDE")},
			{name = 'camo_slide_finish2', label = _U('component_camo_slide_finish2'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_02_SLIDE")},
			{name = 'camo_slide_finish3', label = _U('component_camo_slide_finish3'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_03_SLIDE")},
			{name = 'camo_slide_finish4', label = _U('component_camo_slide_finish4'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_04_SLIDE")},
			{name = 'camo_slide_finish5', label = _U('component_camo_slide_finish5'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_05_SLIDE")},
			{name = 'camo_slide_finish6', label = _U('component_camo_slide_finish6'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06_SLIDE")},
			{name = 'camo_slide_finish7', label = _U('component_camo_slide_finish7'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_07_SLIDE")},
			{name = 'camo_slide_finish8', label = _U('component_camo_slide_finish8'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_08_SLIDE")},
			{name = 'camo_slide_finish9', label = _U('component_camo_slide_finish9'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_09_SLIDE")},
			{name = 'camo_slide_finish10', label = _U('component_camo_slide_finish10'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_10_SLIDE")},
			{name = 'camo_slide_finish11', label = _U('component_camo_slide_finish11'), hash = GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE")}
		}
	},
	{
		name = 'WEAPON_PISTOL50',
		label = _U('weapon_pistol50'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_PISTOL50_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_PISTOL50_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_SNSPISTOL',
		label = _U('weapon_snspistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SNSPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SNSPISTOL_CLIP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SNSPISTOL_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_SNSPISTOL_MK2',
		label = _U('weapon_snspistol_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_FMJ")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_PI_RAIL_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH_03")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP_02")},
			{name = 'compensator', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_COMP_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_IND_01")},
			{name = 'camo_slide_finish', label = _U('component_camo_slide_finish'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE")},
			{name = 'camo_slide_finish2', label = _U('component_camo_slide_finish2'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE")},
			{name = 'camo_slide_finish3', label = _U('component_camo_slide_finish3'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE")},
			{name = 'camo_slide_finish4', label = _U('component_camo_slide_finish4'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE")},
			{name = 'camo_slide_finish5', label = _U('component_camo_slide_finish5'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE")},
			{name = 'camo_slide_finish6', label = _U('component_camo_slide_finish6'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE")},
			{name = 'camo_slide_finish7', label = _U('component_camo_slide_finish7'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE")},
			{name = 'camo_slide_finish8', label = _U('component_camo_slide_finish8'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE")},
			{name = 'camo_slide_finish9', label = _U('component_camo_slide_finish9'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE")},
			{name = 'camo_slide_finish10', label = _U('component_camo_slide_finish10'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE")},
			{name = 'camo_slide_finish11', label = _U('component_camo_slide_finish11'), hash = GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE")}
		}
	},
	{name = 'WEAPON_STUNGUN', label = _U('weapon_stungun'), tints = Config.DefaultWeaponTints, components = {}},
	{name = 'WEAPON_RAYPISTOL', label = _U('weapon_raypistol'), tints = Config.DefaultWeaponTints, components = {}},
	{
		name = 'WEAPON_VINTAGEPISTOL',
		label = _U('weapon_vintagepistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")}
		}
	},
	-- Shotguns
	{
		name = 'WEAPON_ASSAULTSHOTGUN',
		label = _U('weapon_assaultshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")}
		}
	},
	{name = 'WEAPON_AUTOSHOTGUN', label = _U('weapon_autoshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")}},
	{
		name = 'WEAPON_BULLPUPSHOTGUN',
		label = _U('weapon_bullpupshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")}
		}
	},
	{
		name = 'WEAPON_COMBATSHOTGUN',
		label = _U('weapon_combatshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")}
		}
	},
	{name = 'WEAPON_DBSHOTGUN', label = _U('weapon_dbshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")}},
	{
		name = 'WEAPON_HEAVYSHOTGUN',
		label = _U('weapon_heavyshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")}
		}
	},
	{name = 'WEAPON_MUSKET', label = _U('weapon_musket'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SHOTGUN")}},
	{
		name = 'WEAPON_PUMPSHOTGUN',
		label = _U('weapon_pumpshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_SR_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_PUMPSHOTGUN_MK2',
		label = _U('weapon_pumpshotgun_mk2'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'shells_default', label = _U('component_shells_default'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_01")},
			{name = 'shells_incendiary', label = _U('component_shells_incendiary'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY")},
			{name = 'shells_armor', label = _U('component_shells_armor'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING")},
			{name = 'shells_hollowpoint', label = _U('component_shells_hollowpoint'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT")},
			{name = 'shells_explosive', label = _U('component_shells_explosive'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_SR_SUPP_03")},
			{name = 'muzzle_squared', label = _U('component_muzzle_squared'), hash = GetHashKey("COMPONENT_AT_MUZZLE_08")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_SAWNOFFSHOTGUN',
		label = _U('weapon_sawnoffshotgun'),
		ammo = {label = _U('ammo_shells'), hash = GetHashKey("AMMO_SHOTGUN")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE")}
		}
	},
	-- SMG & LMG
	{
		name = 'WEAPON_ASSAULTSMG',
		label = _U('weapon_assaultsmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTSMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_COMBATMG',
		label = _U('weapon_combatmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATMG_CLIP_02")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_COMBATMG_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_COMBATMG_MK2',
		label = _U('weapon_combatmg_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_MG_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_MG_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_COMBATPDW',
		label = _U('weapon_combatpdw'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_COMBATPDW_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")}
		}
	},
	{
		name = 'WEAPON_GUSENBERG',
		label = _U('weapon_gusenberg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_GUSENBERG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_GUSENBERG_CLIP_02")}
		}
	},
	{
		name = 'WEAPON_MACHINEPISTOL',
		label = _U('weapon_machinepistol'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_PISTOL")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_03")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")}
		}
	},
	{
		name = 'WEAPON_MG',
		label = _U('weapon_mg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MG_CLIP_02")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_MG_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_MICROSMG',
		label = _U('weapon_microsmg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MICROSMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MICROSMG_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_PI_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_MINISMG',
		label = _U('weapon_minismg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MINISMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MINISMG_CLIP_02")}
		}
	},
	{
		name = 'WEAPON_SMG',
		label = _U('weapon_smg'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SMG_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SMG_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_SMG_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SMG_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_SMG_MK2',
		label = _U('weapon_smg_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_hollowpoint', label = _U('component_ammo_hollowpoint'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS_SMG")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_SMG_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_PI_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_SB_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_SB_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_SMG_MK2_CAMO_IND_01")}
		}
	},
	{name = 'WEAPON_RAYCARBINE', label = _U('weapon_raycarbine'), ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SMG")}, tints = Config.DefaultWeaponTints, components = {}},
	-- Rifles
	{
		name = 'WEAPON_ADVANCEDRIFLE',
		label = _U('weapon_advancedrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE',
		label = _U('weapon_assaultrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_ASSAULTRIFLE_MK2',
		label = _U('weapon_assaultrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_AR_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_AR_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE',
		label = _U('weapon_bullpuprifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_VARMOD_LOW")}
		}
	},
	{
		name = 'WEAPON_BULLPUPRIFLE_MK2',
		label = _U('weapon_bullpuprifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_MK2")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_BP_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_BP_BARREL_02")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE',
		label = _U('weapon_carbinerifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02")},
			{name = 'clip_box', label = _U('component_clip_box'), hash = GetHashKey("COMPONENT_CARBINERIFLE_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_CARBINERIFLE_MK2',
		label = _U('weapon_carbinerifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_medium', label = _U('component_scope_medium'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_CR_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_CR_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_COMPACTRIFLE',
		label = _U('weapon_compactrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_03")}
		}
	},
	{
		name = 'WEAPON_MILITARYRIFLE',
		label = _U('weapon_militaryrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MILITARYRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MILITARYRIFLE_CLIP_02")},
			{name = 'ironsights', label = _U('component_ironsights'), hash = GetHashKey("COMPONENT_MILITARYRIFLE_SIGHT_01")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_SMALL")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")}
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE',
		label = _U('weapon_specialcarbine'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02")},
			{name = 'clip_drum', label = _U('component_clip_drum'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_03")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER")}
		}
	},
	{
		name = 'WEAPON_SPECIALCARBINE_MK2',
		label = _U('weapon_specialcarbine_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RIFLE")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_small', label = _U('component_scope_small'), hash = GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_SC_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_SC_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01")}
		}
	},
	-- Sniper
	{
		name = 'WEAPON_HEAVYSNIPER',
		label = _U('weapon_heavysniper'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE")},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")}
		}
	},
	{
		name = 'WEAPON_HEAVYSNIPER_MK2',
		label = _U('weapon_heavysniper_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_02")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ")},
			{name = 'ammo_explosive', label = _U('component_ammo_explosive'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE")},
			{name = 'scope_zoom', label = _U('component_scope_zoom'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_MK2")},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")},
			{name = 'scope_nightvision', label = _U('component_scope_nightvision'), hash = GetHashKey("COMPONENT_AT_SCOPE_NV")},
			{name = 'scope_thermal', label = _U('component_scope_thermal'), hash = GetHashKey("COMPONENT_AT_SCOPE_THERMAL")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_SR_SUPP_03")},
			{name = 'muzzle_squared', label = _U('component_muzzle_squared'), hash = GetHashKey("COMPONENT_AT_MUZZLE_08")},
			{name = 'muzzle_bell', label = _U('component_muzzle_bell'), hash = GetHashKey("COMPONENT_AT_MUZZLE_09")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_SR_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_SR_BARREL_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE',
		label = _U('weapon_marksmanrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_02")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_VARMOD_LUXE")}
		}
	},
	{
		name = 'WEAPON_MARKSMANRIFLE_MK2',
		label = _U('weapon_marksmanrifle_mk2'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'clip_default', label = _U('component_clip_default'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_01")},
			{name = 'clip_extended', label = _U('component_clip_extended'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_02")},
			{name = 'ammo_tracer', label = _U('component_ammo_tracer'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER")},
			{name = 'ammo_incendiary', label = _U('component_ammo_incendiary'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY")},
			{name = 'ammo_armor', label = _U('component_ammo_armor'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING")},
			{name = 'ammo_fmj', label = _U('component_ammo_fmj'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ")},
			{name = 'scope_holo', label = _U('component_scope_holo'), hash = GetHashKey("COMPONENT_AT_SIGHTS")},
			{name = 'scope_large', label = _U('component_scope_large'), hash = GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2")},
			{name = 'scope_zoom', label = _U('component_scope_zoom'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2")},
			{name = 'flashlight', label = _U('component_flashlight'), hash = GetHashKey("COMPONENT_AT_AR_FLSH")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP")},
			{name = 'muzzle_flat', label = _U('component_muzzle_flat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_01")},
			{name = 'muzzle_tactical', label = _U('component_muzzle_tactical'), hash = GetHashKey("COMPONENT_AT_MUZZLE_02")},
			{name = 'muzzle_fat', label = _U('component_muzzle_fat'), hash = GetHashKey("COMPONENT_AT_MUZZLE_03")},
			{name = 'muzzle_precision', label = _U('component_muzzle_precision'), hash = GetHashKey("COMPONENT_AT_MUZZLE_04")},
			{name = 'muzzle_heavy', label = _U('component_muzzle_heavy'), hash = GetHashKey("COMPONENT_AT_MUZZLE_05")},
			{name = 'muzzle_slanted', label = _U('component_muzzle_slanted'), hash = GetHashKey("COMPONENT_AT_MUZZLE_06")},
			{name = 'muzzle_split', label = _U('component_muzzle_split'), hash = GetHashKey("COMPONENT_AT_MUZZLE_07")},
			{name = 'barrel_default', label = _U('component_barrel_default'), hash = GetHashKey("COMPONENT_AT_MRFL_BARREL_01")},
			{name = 'barrel_heavy', label = _U('component_barrel_heavy'), hash = GetHashKey("COMPONENT_AT_MRFL_BARREL_02")},
			{name = 'grip', label = _U('component_grip'), hash = GetHashKey("COMPONENT_AT_AR_AFGRIP_02")},
			{name = 'camo_finish', label = _U('component_camo_finish'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO")},
			{name = 'camo_finish2', label = _U('component_camo_finish2'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_02")},
			{name = 'camo_finish3', label = _U('component_camo_finish3'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_03")},
			{name = 'camo_finish4', label = _U('component_camo_finish4'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_04")},
			{name = 'camo_finish5', label = _U('component_camo_finish5'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_05")},
			{name = 'camo_finish6', label = _U('component_camo_finish6'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_06")},
			{name = 'camo_finish7', label = _U('component_camo_finish7'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_07")},
			{name = 'camo_finish8', label = _U('component_camo_finish8'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_08")},
			{name = 'camo_finish9', label = _U('component_camo_finish9'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_09")},
			{name = 'camo_finish10', label = _U('component_camo_finish10'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_10")},
			{name = 'camo_finish11', label = _U('component_camo_finish11'), hash = GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01")}
		}
	},
	{
		name = 'WEAPON_SNIPERRIFLE',
		label = _U('weapon_sniperrifle'),
		ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_SNIPER")},
		tints = Config.DefaultWeaponTints,
		components = {
			{name = 'scope', label = _U('component_scope'), hash = GetHashKey("COMPONENT_AT_SCOPE_LARGE")},
			{name = 'scope_advanced', label = _U('component_scope_advanced'), hash = GetHashKey("COMPONENT_AT_SCOPE_MAX")},
			{name = 'suppressor', label = _U('component_suppressor'), hash = GetHashKey("COMPONENT_AT_AR_SUPP_02")},
			{name = 'luxary_finish', label = _U('component_luxary_finish'), hash = GetHashKey("COMPONENT_SNIPERRIFLE_VARMOD_LUXE")}
		}
	},
	-- Heavy / Launchers
	{name = 'WEAPON_COMPACTLAUNCHER', label = _U('weapon_compactlauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = GetHashKey("AMMO_GRENADELAUNCHER")}},
	{name = 'WEAPON_FIREWORK', label = _U('weapon_firework'), components = {}, ammo = {label = _U('ammo_firework'), hash = GetHashKey("AMMO_FIREWORK")}},
	{name = 'WEAPON_GRENADELAUNCHER', label = _U('weapon_grenadelauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_grenadelauncher'), hash = GetHashKey("AMMO_GRENADELAUNCHER")}},
	{name = 'WEAPON_HOMINGLAUNCHER', label = _U('weapon_hominglauncher'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = GetHashKey("AMMO_HOMINGLAUNCHER")}},
	{name = 'WEAPON_MINIGUN', label = _U('weapon_minigun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MINIGUN")}},
	{name = 'WEAPON_RAILGUN', label = _U('weapon_railgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_RAILGUN")}},
	{name = 'WEAPON_RPG', label = _U('weapon_rpg'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rockets'), hash = GetHashKey("AMMO_RPG")}},
	{name = 'WEAPON_RAYMINIGUN', label = _U('weapon_rayminigun'), tints = Config.DefaultWeaponTints, components = {}, ammo = {label = _U('ammo_rounds'), hash = GetHashKey("AMMO_MINIGUN")}},
	-- Thrown
	{name = 'WEAPON_BALL', label = _U('weapon_ball'), components = {}, ammo = {label = _U('ammo_ball'), hash = GetHashKey("AMMO_BALL")}},
	{name = 'WEAPON_BZGAS', label = _U('weapon_bzgas'), components = {}, ammo = {label = _U('ammo_bzgas'), hash = GetHashKey("AMMO_BZGAS")}},
	{name = 'WEAPON_FLARE', label = _U('weapon_flare'), components = {}, ammo = {label = _U('ammo_flare'), hash = GetHashKey("AMMO_FLARE")}},
	{name = 'WEAPON_GRENADE', label = _U('weapon_grenade'), components = {}, ammo = {label = _U('ammo_grenade'), hash = GetHashKey("AMMO_GRENADE")}},
	{name = 'WEAPON_PETROLCAN', label = _U('weapon_petrolcan'), components = {}, ammo = {label = _U('ammo_petrol'), hash = GetHashKey("AMMO_PETROLCAN")}},
	{name = 'WEAPON_HAZARDCAN', label = _U('weapon_hazardcan'), components = {}, ammo = {label = _U('ammo_petrol'), hash = GetHashKey("AMMO_PETROLCAN")}},
	{name = 'WEAPON_MOLOTOV', label = _U('weapon_molotov'), components = {}, ammo = {label = _U('ammo_molotov'), hash = GetHashKey("AMMO_MOLOTOV")}},
	{name = 'WEAPON_PROXMINE', label = _U('weapon_proxmine'), components = {}, ammo = {label = _U('ammo_proxmine'), hash = GetHashKey("AMMO_PROXMINE")}},
	{name = 'WEAPON_PIPEBOMB', label = _U('weapon_pipebomb'), components = {}, ammo = {label = _U('ammo_pipebomb'), hash = GetHashKey("AMMO_PIPEBOMB")}},
	{name = 'WEAPON_SNOWBALL', label = _U('weapon_snowball'), components = {}, ammo = {label = _U('ammo_snowball'), hash = GetHashKey("AMMO_SNOWBALL")}},
	{name = 'WEAPON_STICKYBOMB', label = _U('weapon_stickybomb'), components = {}, ammo = {label = _U('ammo_stickybomb'), hash = GetHashKey("AMMO_STICKYBOMB")}},
	{name = 'WEAPON_SMOKEGRENADE', label = _U('weapon_smokegrenade'), components = {}, ammo = {label = _U('ammo_smokebomb'), hash = GetHashKey("AMMO_SMOKEGRENADE")}},
	-- Tools
	{name = 'WEAPON_FIREEXTINGUISHER', label = _U('weapon_fireextinguisher'), components = {}, ammo = {label = _U('ammo_charge'), hash = GetHashKey("AMMO_FIREEXTINGUISHER")}},
	{name = 'WEAPON_DIGISCANNER', label = _U('weapon_digiscanner'), components = {}},
	{name = 'GADGET_PARACHUTE', label = _U('gadget_parachute'), components = {}},
	{name = 'WEAPON_BATLV1',label = _U('weapon_batlv1'),components = {}},
	{name = 'WEAPON_BATLV2',label = _U('weapon_batlv2'),components = {}},
	{name = 'WEAPON_BATLV3',label = _U('weapon_batlv3'),components = {}},
	{name = 'WEAPON_BATLV4',label = _U('weapon_batlv4'),components = {}},
	{name = 'WEAPON_BATLV5',label = _U('weapon_batlv5'),components = {}},
	{name = 'WEAPON_BATLV6',label = _U('weapon_batlv6'),components = {}},
	{name = 'WEAPON_BATLV7',label = _U('weapon_batlv7'),components = {}},
	{name = 'WEAPON_BATLVJOB',label = _U('weapon_batlvJOB'),components = {}},
	{name = 'WEAPON_GOLFCLUBLV1',label = _U('weapon_golfclublv1'),components = {}},
	{name = 'WEAPON_GOLFCLUBLV2',label = _U('weapon_golfclublv2'),components = {}},
	{name = 'WEAPON_GOLFCLUBLV3',label = _U('weapon_golfclublv3'),components = {}},
	{name = 'WEAPON_GOLFCLUBLV4',label = _U('weapon_golfclublv4'),components = {}},
	{name = 'WEAPON_GOLFCLUBLV5',label = _U('weapon_golfclublv5'),components = {}},
	{name = 'WEAPON_GOLFCLUBLV6',label = _U('weapon_golfclublv6'),components = {}},
	{name = 'WEAPON_GOLFCLUBLV7',label = _U('weapon_golfclublv7'),components = {}},
	{name = 'WEAPON_HAMMERLV1',label = _U('weapon_hammerlv1'),components = {}},
	{name = 'WEAPON_HAMMERLV2',label = _U('weapon_hammerlv2'),components = {}},
	{name = 'WEAPON_HAMMERLV3',label = _U('weapon_hammerlv3'),components = {}},
	{name = 'WEAPON_HAMMERLV4',label = _U('weapon_hammerlv4'),components = {}},
	{name = 'WEAPON_HAMMERLV5',label = _U('weapon_hammerlv5'),components = {}},
	{name = 'WEAPON_POOLCUELV1',label = _U('weapon_poolcuelv1'),components = {}},
	{name = 'WEAPON_POOLCUELV2',label = _U('weapon_poolcuelv2'),components = {}},
	{name = 'WEAPON_POOLCUELV3',label = _U('weapon_poolcuelv3'),components = {}},
	{name = 'WEAPON_POOLCUELV4',label = _U('weapon_poolcuelv4'),components = {}},
	{name = 'WEAPON_POOLCUELV5',label = _U('weapon_poolcuelv5'),components = {}},
	{name = 'WEAPON_POOLCUE+1',label = _U('weapon_poolcuelv1'),components = {}},
	{name = 'WEAPON_POOLCUE+2',label = _U('weapon_poolcuelv2'),components = {}},
	{name = 'WEAPON_POOLCUE+3',label = _U('weapon_poolcuelv3'),components = {}},
	{name = 'WEAPON_POOLCUE+4',label = _U('weapon_poolcuelv4'),components = {}},
	{name = 'WEAPON_POOLCUE+5',label = _U('weapon_poolcuelv5'),components = {}},
	{name = 'WEAPON_POOLCUEJOB',label = _U('weapon_poolcuelvJOB'),components = {}},
	{name = 'WEAPON_SWITCHBLADEBLACKLIGHT', label = 'Switchbladelv2', components = {}},
	{name = 'WEAPON_KNIFE+1',label = _U('weapon_knife+1'),components = {}},
	{name = 'WEAPON_BOTTLE+1',label = _U('weapon_bottlelv1'),components = {}},
	
	{
		name = 'WEAPON_BLACKMONDAY',
		label = _U('weapon_blackmonday'),
		components = {}
	},
	{
		name = 'WEAPON_BLACKMONDAYF',
		label = _U('weapon_blackmondayf'),
		components = {}
	},
	{
		name = 'WEAPON_BULLETBLUE',
		label = _U('weapon_bulietblue'),
		components = {}
	},
	{
		name = 'WEAPON_CANDYLOVE',
		label = _U('weapon_candylove'),
		components = {}
	},
	{
		name = 'WEAPON_CATBURGLAR',
		label = _U('weapon_catburglar'),
		components = {}
	},
	{
		name = 'WEAPON_CODSQUADPLAID',
		label = _U('weapon_codsquadplaid'),
		components = {}
	},
	{
		name = 'WEAPON_CRANIUM',
		label = _U('weapon_cranium'),
		components = {}
	},
	{
		name = 'WEAPON_CUDDLEDARK',
		label = _U('weapon_cuddledark'),
		components = {}
	},
	{
		name = 'WEAPON_CUTEDUO',
		label = _U('weapon_cuteduo'),
		components = {}
	},
	{
		name = 'WEAPON_DARKELF',
		label = _U('weapon_darkelf'),
		components = {}
	},
	{
		name = 'WEAPON_FORESTDWELLER',
		label = _U('weapon_forestdweller'),
		components = {}
	},
	{
		name = 'WEAPON_FUTUREBIKER',
		label = _U('weapon_futurebiker'),
		components = {}
	},
	{
		name = 'WEAPON_GOATROBE',
		label = _U('weapon_goatrobe'),
		components = {}
	},
	{
		name = 'WEAPON_HIPHARE',
		label = _U('weapon_hiphare'),
		components = {}
	},
	{
		name = 'WEAPON_JONESYCUBE',
		label = _U('weapon_jonesycube'),
		components = {}
	},
	{
		name = 'WEAPON_JUMPSTART',
		label = _U('weapon_jumpstart'),
		components = {}
	},
	{
		name = 'WEAPON_LOLLIPOP',
		label = _U('weapon_lollipop'),
		components = {}
	},
	{
		name = 'WEAPON_MASTERMIND',
		label = _U('weapon_mastermind'),
		components = {}
	},
	{
		name = 'WEAPON_NEONFASHION',
		label = _U('weapon_neonfashion'),
		components = {}
	},
	{
		name = 'WEAPON_REDRIDING',
		label = _U('weapon_redriding'),
		components = {}
	},
	{
		name = 'WEAPON_SKELETON',
		label = _U('weapon_skeleton'),
		components = {}
	},
	{
		name = 'WEAPON_SLEEPYTIME',
		label = _U('weapon_sleepytime'),
		components = {}
	},
	{
		name = 'WEAPON_SPOOKYNEON',
		label = _U('weapon_spookyneon'),
		components = {}
	},
	{
		name = 'WEAPON_STARWALKER',
		label = _U('weapon_starwalker'),
		components = {}
	},
	{
		name = 'WEAPON_STREETURCHIN',
		label = _U('weapon_streeturchin'),
		components = {}
	},
	{
		name = 'WEAPON_TERIYAK',
		label = _U('weapon_teriyak'),
		components = {}
	},
	{
		name = 'WEAPON_THEGOLDEN',
		label = _U('weapon_thegolden'),
		components = {}
	},
	{
		name = 'WEAPON_TOWERSENTINEL',
		label = _U('weapon_towersentinel'),
		components = {}
	},
	{
		name = 'WEAPON_TROOPER',
		label = _U('weapon_trooper'),
		components = {}
	},
	{
		name = 'WEAPON_VIPER',
		label = _U('weapon_viper'),
		components = {}
	},
	{
		name = 'WEAPON_WINGEDFURY',
		label = _U('weapon_wingedfury'),
		components = {}
	},
	{
		name = 'WEAPON_AGENTACE',
		label = _U('weapon_agentace'),
		components = {}
	},
	{
		name = 'WEAPON_CAVALRYBANDIT',
		label = _U('weapon_cavalrybandit'),
		components = {}
	},
	{
		name = 'WEAPON_DOWNPOUR',
		label = _U('weapon_downpour'),
		components = {}
	},
	{
		name = 'WEAPON_FROGMAN',
		label = _U('weapon_frogman'),
		components = {}
	},
	{
		name = 'WEAPON_NOSHHUNTER',
		label = _U('weapon_noshhunter'),
		components = {}
	},
	{
		name = 'WEAPON_TACTICALRED',
		label = _U('weapon_tacticalred'),
		components = {}
	},
    {
		name = 'WEAPON_AGENTROGUE',
		label = _U('weapon_agentrogue'),
		components = {}
	},
	{
		name = 'WEAPON_BUFFCAT',
		label = _U('weapon_buffcat'),
		components = {}
	},
	{
		name = 'WEAPON_CRAZYEIGHT',
		label = _U('weapon_crazyeight'),
		components = {}
	},
	{
		name = 'WEAPON_CUPID',
		label = _U('weapon_cupid'),
		components = {}
	},
	{
		name = 'WEAPON_DEVILROCK',
		label = _U('weapon_devilrock'),
		components = {}
	},
	{
		name = 'WEAPON_SHEATH',
		label = _U('weapon_sheath'),
		components = {}
	},
	{
		name = 'WEAPON_VIRTUAL',
		label = _U('weapon_virtual'),
		components = {}
	},
	{
		name = 'WEAPON_WOODLAND',
		label = _U('weapon_woodland'),
		components = {}
	},
    {
		name = 'WEAPON_ALPINE',
		label = _U('weapon_alpine'),
		components = {}
	},
	{
		name = 'WEAPON_ANGE',
		label = _U('weapon_ange'),
		components = {}
	},
	{
		name = 'WEAPON_BRIGHTGUNNER',
		label = _U('weapon_brightgunner'),
		components = {}
	},
	{
		name = 'WEAPON_DARKDINO',
		label = _U('weapon_darkdino'),
		components = {}
	},
	{
		name = 'WEAPON_DARKEAGLEFIRE',
		label = _U('weapon_darkeaglefire'),
		components = {}
	},
	{
		name = 'WEAPON_DINOHUNTER',
		label = _U('weapon_dinohunter'),
		components = {}
	},
	{
		name = 'WEAPON_FISHERMAN',
		label = _U('weapon_fisherman'),
		components = {}
	},
	{
		name = 'WEAPON_KANE',
		label = _U('weapon_kane'),
		components = {}
	},
	{
		name = 'WEAPON_ROCKCLIMBER',
		label = _U('weapon_rockclimber'),
		components = {}
	},
	{
		name = 'WEAPON_ROCKERPUNK',
		label = _U('weapon_rockerpunk'),
		components = {}
	},
	{
		name = 'WEAPON_TACTICALFISHE',
		label = _U('weapon_tacticalfishe'),
		components = {}
	},
	{
		name = 'WEAPON_TOXICKITTY',
		label = _U('weapon_toxickitty'),
		components = {}
	},
    {
		name = 'WEAPON_HULK',
		label = _U('weapon_hulk'),
		components = {}
	},
    {
		name = 'WEAPON_SPARTANFUTURE',
		label = _U('weapon_spartanfuture'),
		components = {}
	},
	{
		name = 'WEAPON_TRISTAR',
		label = _U('weapon_tristar'),
		components = {}
	},
	{
		name = 'WEAPON_TRIDENT',
		label = _U('weapon_trident'),
		components = {}
	},	
	{
		name = 'WEAPON_NOTZSAKURA',
		label = _U('weapon_notzsakura'),
		components = {}
	},	
	{
		name = 'WEAPON_BLACKPINK',
		label = _U('weapon_blackpink'),
		components = {}
	},	
	{
		name = 'WEAPON_FANHAND',
		label = _U('weapon_fanhand'),
		components = {}
	},	
	{
		name = 'WEAPON_HAMMERTHOR',
		label = _U('weapon_hammerthor'),
		components = {}
	},	
	{
		name = 'WEAPON_MACHETELV+1',
		label = _U('weapon_machetelv+1'),
		components = {}
	},	
	{
		name = 'WEAPON_KNIFELV+1',
		label = _U('weapon_knifelv+1'),
		components = {}
	},	
	{
		name = 'WEAPON_GOLFCLUBLV+1',
		label = _U('weapon_golfclublv+1'),
		components = {}
	},	
	{
		name = 'WEAPON_BOTTLELV+1',
		label = _U('weapon_bottlelv+1'),
		components = {}
	},	
	{
		name = 'WEAPON_BATLV+1',
		label = _U('weapon_batlv+1'),
		components = {}
	},	
	{
		name = 'WEAPON_POOLCUELV+1',
		label = _U('weapon_poolcuelv+1'),
		components = {}
	},
	{
		name = 'WEAPON_DARKBEAR',
		label = _U('DARKBEAR'),
		components = {}
	},
	{
		name = 'WEAPON_PINKBEAR',
		label = _U('PINKBEAR'),
		components = {}
	},
	{
		name = 'WEAPON_VOIDSWORDBAT',
		label = _U('WEAPON_VOIDSWORDBAT'),
		components = {}
	},
	{
		name = 'WEAPON_GOLFLOTUS',
		label = _U('GOLFLOTUS'),
		components = {}
	},
	{
		name = 'WEAPON_LOTUSBOTTLE',
		label = _U('LOTUSBOTTLE'),
		components = {}
	},
	{
		name = 'WEAPON_POOLLOTUS',
		label = _U('POOLLOTUS'),
		components = {}
	},
		
	{name = 'WEAPON_BATTLEAXE+1', label = 'battleaxelv2', components = {}},
	{name = 'WEAPON_BATTLEAXE+2', label = 'battleaxelv99', components = {}},
	{name = 'WEAPON_BATTLEAXE+3', label = 'battleaxelv3', components = {}},
	{name = 'WEAPON_BATTLEAXE+4', label = 'battle axe +4', components = {}},
	{name = 'WEAPON_BATTLEAXE+5', label = 'battle axe +5', components = {}},
	{name = 'WEAPON_CANDYSKY', label = 'WEAPON CANDYSKY', components = {}},
	{name = 'WEAPON_MJOLNIR', label = 'MJOLNIR', components = {}},
	{name = 'WEAPON_SYRINGE', label = 'SYRINGE', components = {}},
	{name = 'WEAPON_REVOLVER+1', label = 'REVOLVERLV1', components = {}},
	{name = 'WEAPON_REVOLVER+2', label = 'REVOLVERLV2', components = {}},
	{name = 'WEAPON_REVOLVER+3', label = 'REVOLVERLV3', components = {}},
	{name = 'WEAPON_REVOLVER+4', label = 'REVOLVERLV4', components = {}},
	{name = 'WEAPON_REVOLVER+5', label = 'REVOLVERLV5', components = {}},
	{name = 'WEAPON_REVOLVER+6', label = 'REVOLVERJOB', components = {}},
	{name = 'WEAPON_SWBRL', label = 'SwitchbladeLV2', components = {}},
	{name = 'WEAPON_SWBBL', label = 'SwitchbladeLV3', components = {}},
	{name = 'WEAPON_SWBWL', label = 'SwitchbladeLV1', components = {}},
	{name = 'WEAPON_HAMMER+1', label = 'HAMMERGOD', components = {}},
	{name = 'WEAPON_KNUCKLECSZ1', label = 'KNUCKLELV1', components = {}},
	{name = 'WEAPON_KNUCKLECSZ2', label = 'KNUCKLELV2', components = {}},
	{name = 'WEAPON_KNUCKLECSZ3', label = 'KNUCKLELV3', components = {}},
	{name = 'WEAPON_WATERGUN', label = 'WATERGUN', components = {}},
	{name = 'WEAPON_MACHETE1', label = 'MACHETELV1', components = {}},
	{name = 'WEAPON_MACHETE2', label = 'MACHETELV2', components = {}},
	{name = 'WEAPON_MACHETE3', label = 'MACHETELV3', components = {}},
	{name = 'WEAPON_MACHETE4', label = 'MACHETELV4', components = {}},
	{name = 'WEAPON_MACHETE5', label = 'MACHETELV5', components = {}},
}
