ESX = {}
ESX.Players = {}
ESX.Jobs = {}
ESX.Items = {}
Core = {}
Core.UsableItemsCallbacks = {}
Core.ServerCallbacks = {}
Core.TimeoutCount = -1
Core.CancelledTimeouts = {}
Core.RegisteredCommands = {}
Core.Pickups = {}
Core.PickupId = 0
Core.PlayerFunctionOverrides = {}
Core.playersByIdentifier = {}

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

exports('getSharedObject', function()
	return ESX
end)


local function StartDBSync()
	if not Config.SaveAllClient then 
		CreateThread(function()
			while true do
				Wait(10 * 60 * 1000)
				Core.SavePlayers()
			end
		end)
	end
end

RegisterNetEvent('Sorry:saveplayer')
AddEventHandler('Sorry:saveplayer', function() --esx:saveplayer
	local xPlayer = ESX.GetPlayerFromId(source)
	Core.SavePlayer(xPlayer, xPlayer.source, function()
	end)
end)

MySQL.ready(function()
		--[[ local items = MySQL.query.await('SELECT * FROM items')
		for k, v in ipairs(items) do
			ESX.Items[v.name] = {
				label = v.label,
				limit = v.limit,
				-- weight = v.weight,
				rare = v.rare,
				canRemove = v.can_remove
			}
		end ]]

	local Jobs = {}
	local jobs = MySQL.query.await('SELECT * FROM jobs')

	for _, v in ipairs(jobs) do
		Jobs[v.name] = v
		Jobs[v.name].grades = {}
	end

	local jobGrades = MySQL.query.await('SELECT * FROM job_grades')

	for _, v in ipairs(jobGrades) do
		if Jobs[v.job_name] then
			Jobs[v.job_name].grades[tostring(v.grade)] = v
		else
			print(('[^3WARNING^7] Ignoring job grades for ^5"%s"^0 due to missing job'):format(v.job_name))
		end
	end

	for _, v in pairs(Jobs) do
		if ESX.Table.SizeOf(v.grades) == 0 then
			Jobs[v.name] = nil
			print(('[^3WARNING^7] Ignoring job ^5"%s"^0 due to no job grades found'):format(v.name))
		end
	end

	if not Jobs then
		-- Fallback data, if no jobs exist
		ESX.Jobs['unemployed'] = {
			label = 'Unemployed',
			grades = {
				['0'] = {
					grade = 0,
					label = 'Unemployed',
					salary = 0,
                    onDuty = false,
					skin_male = {},
					skin_female = {}
				}
			}
		}
	else
		ESX.Jobs = Jobs
	end

	print('[^2INFO^7] ESX ^5Legacy^0 initialized')
	StartDBSync()
	StartPayCheck()
	StartPayCheckItem()
end)

RegisterServerEvent('esx:clientLog')
AddEventHandler('esx:clientLog', function(msg)
	if Config.EnableDebug then
		print(('[^2TRACE^7] %s^7'):format(msg))
	end
end)

RegisterServerEvent('esx:triggerServerCallback')
AddEventHandler('esx:triggerServerCallback', function(name, requestId, ...)
	local playerId = source

	ESX.TriggerServerCallback(name, requestId, playerId, function(...)
		-- print("CheckCallback:"..name.." requestId:"..requestId.." playerId:"..playerId.."" )
		TriggerClientEvent('esx:serverCallback', playerId, requestId, ...)
	end, ...)
end)
