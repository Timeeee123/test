Config = {}
Config.Locale = 'en'

Config.Accounts = {
	bank = _U('account_bank'),
	black_money = _U('account_black_money'),
	money = _U('account_money')
}

Config.StartingAccountMoney 	= {money = 500000, bank = 500000}

Config.FirstSpawn = {
	{ x = -283.19, y = -1048.11, z = 1030.52, h = 313.72 },
} 

Config.CoordsCash = {x = -269.40, y = -955.69, z = 31.22, heading = 205.23}

Config.EnableSocietyPayouts 	= true -- pay from the society account that the player is employed at? Requirement: esx_society
Config.EnableHud            	= false -- enable the default hud? Display current job and accounts (black, bank & cash)
Config.MaxWeight            	= 9999999   -- the max inventory weight without backpack
Config.PaycheckInterval         = 60 * 60000 -- how often to recieve pay checks in milliseconds
Config.PaycheckIntervalItem 	= 5 * 60000
Config.EnableDebug              = false -- Use Debug options?
Config.EnableDefaultInventory   = false -- Display the default Inventory ( F2 )
Config.EnableWantedLevel    	= false -- Use Normal GTA wanted Level?
Config.EnablePVP                = true -- Allow Player to player combat
Config.NativeNotify             = false -- true = old esx notification

Config.Multichar                = false -- Enable support for esx_multicharacter
Config.Identity                 = true -- Select a characters identity data before they have loaded in (this happens by default with multichar)
Config.DistanceGive 			= 4.0 -- Max distance when giving items, weapons etc.
Config.OnDuty                   = true -- Default state of the on duty system
Config.DiscordLog               = 'AZ'

----------  UPDATE COORDS TYPE -------------------------------------]
Config.UpdateCoordsServer		= true                            --]
Config.UpdateCoordsTime			= {min = 5000, max = 10000}       --]
--------------------------------------------------------------------]
------------  SAVE PLAYER TYPE -------------------------------------]
Config.SaveAllClient 			= false
Config.SaveAllClientTime		= {min = 600000, max = 900000}
--------------------------------------------------------------------]