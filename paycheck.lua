function StartPayCheck()
	CreateThread(function()
		while true do
			Wait(Config.PaycheckInterval)
			local xPlayers = ESX.GetExtendedPlayers()
			for _, xPlayer in pairs(xPlayers) do
				local job     = xPlayer.job.grade_name
				local jobname     = xPlayer.job.name
                local onDuty  = xPlayer.job.onDuty
				local salary  = xPlayer.job.grade_salary
				if salary > 0 then
					if job == 'unemployed' then -- unemployed
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_help', salary), 'CHAR_BANK_MAZE', 9)
					elseif Config.EnableSocietyPayouts and onDuty then -- possibly a society
						TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
							if society ~= nil then -- verified society
								TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
									if account.money >= salary then -- does the society money to pay its employees?
										xPlayer.addAccountMoney('bank', salary)
										account.removeMoney(salary)

										TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
									else
										TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), '', _U('company_nomoney'), 'CHAR_BANK_MAZE', 1)
									end
								end)
							else -- not a society
								xPlayer.addAccountMoney('bank', salary)
								TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
							end
						end)
					elseif onDuty then -- งานทั่วไป
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), _U('received_paycheck'), _U('received_salary', salary), 'CHAR_BANK_MAZE', 9)
					end
				end
			end
		end
	end)
end
function StartPayCheckItem()
	CreateThread(function()
		while true do
			Wait(Config.PaycheckIntervalItem)
			local xPlayers = ESX.GetExtendedPlayers()
			local currentHour = tonumber(os.date("%H")) -- ดึงชั่วโมงปัจจุบัน (0-23)

			for _, xPlayer in pairs(xPlayers) do
				local jobname = xPlayer.job.name

				-- ช่วงเวลา 00:01 - 17:59
				if currentHour >= 0 and currentHour < 18 then
					if jobname == 'police' then
						xPlayer.addInventoryItem('police_coins', 1)
					elseif jobname == 'BlackTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					elseif jobname == 'ambulance' then
						xPlayer.addInventoryItem('ifmdcoin', 1)
					elseif jobname == 'BlueTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					elseif jobname == 'RedTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					elseif jobname == 'WhiteTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					end
				-- ช่วงเวลา 18:00 - 23:59
				elseif currentHour >= 18 and currentHour < 24 then
					if jobname == 'police' then
						xPlayer.addInventoryItem('police_coins', 1)
					elseif jobname == 'BlackTEAM' then
						xPlayer.addInventoryItem('bandage', 100)
						xPlayer.addInventoryItem('bandage1', 30)
					elseif jobname == 'ambulance' then
						xPlayer.addInventoryItem('ifmdcoin', 1)
					elseif jobname == 'BlueTEAM' then
						xPlayer.addInventoryItem('bandage', 100)
						xPlayer.addInventoryItem('bandage1', 30)
					elseif jobname == 'RedTEAM' then
						xPlayer.addInventoryItem('bandage', 100)
						xPlayer.addInventoryItem('bandage1', 30)
					elseif jobname == 'WhiteTEAM' then
						xPlayer.addInventoryItem('bandage', 100)
						xPlayer.addInventoryItem('bandage1', 30)
					end
				else
					-- กรณีอื่นๆ
					if jobname == 'police' then
						xPlayer.addInventoryItem('police_coins', 1)
					elseif jobname == 'BlackTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					elseif jobname == 'ambulance' then
						xPlayer.addInventoryItem('ifmdcoin', 1)
					elseif jobname == 'BlueTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					elseif jobname == 'RedTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					elseif jobname == 'WhiteTEAM' then
						xPlayer.addInventoryItem('bandage', 50)
						xPlayer.addInventoryItem('bandage1', 20)
					end
				end
			end
		end
	end)
end


