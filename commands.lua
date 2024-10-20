ESX.RegisterCommand('tp', 'superadmin', function(xPlayer, args, showError)
    xPlayer.setCoords({x = args.x, y = args.y, z = args.z})
end, false, {help = _U('command_setcoords'), validate = true, arguments = {
    {name = 'x', help = _U('command_setcoords_x'), type = 'number'},
    {name = 'y', help = _U('command_setcoords_y'), type = 'number'},
    {name = 'z', help = _U('command_setcoords_z'), type = 'number'}
}})

ESX.RegisterCommand('setcoords', 'admin', function(xPlayer, args, showError)
	xPlayer.setCoords({x = args.x, y = args.y, z = args.z})
end, false, {help = _U('command_setcoords'), validate = true, arguments = {
	{name = 'x', help = _U('command_setcoords_x'), type = 'number'},
	{name = 'y', help = _U('command_setcoords_y'), type = 'number'},
	{name = 'z', help = _U('command_setcoords_z'), type = 'number'}
}})

ESX.RegisterCommand('setjob', 'admin', function(xPlayer, args, showError)
	if ESX.DoesJobExist(args.job, args.grade) then
		args.playerId.setJob(args.job, args.grade)

		if xPlayer.source == args.playerId.source then
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' เปลี่ยนอาชีพให้ตนเอง เป็น ' .. args.job .. ' ระดับ ' .. args.grade .. ''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^2')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' เปลี่ยนอาชีพให้ตนเอง เป็น ' .. args.job .. ' ระดับ ' .. args.grade .. '```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				}) 
			end
		else
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' เปลี่ยนอาชีพให้ ' .. args.playerId.name ..' เป็น ' .. args.job .. ' ระดับ ' .. args.grade .. ''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^3')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' เปลี่ยนอาชีพให้ ' .. args.playerId.name ..' เป็น ' .. args.job .. ' ระดับ ' .. args.grade .. '```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				}) 
			end
		
			Citizen.Wait(100)
		
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. args.playerId.name .. ' ถูกเปลี่ยนอาชีพเป็น ' .. args.job .. ' ระดับ ' .. args.grade .. ' โดย ' .. xPlayer.name ..' '
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, args.playerId.source, '^2')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. args.playerId.name .. ' ถูกเปลี่ยนอาชีพเป็น ' .. args.job .. ' ระดับ ' .. args.grade .. ' โดย ' .. xPlayer.name ..'```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				}) 
			end
		end
	else
		showError(_U('command_setjob_invalid'))
	end
end, true, {help = _U('command_setjob'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'job', help = _U('command_setjob_job'), type = 'string'},
	{name = 'grade', help = _U('command_setjob_grade'), type = 'number'}
}})

ESX.RegisterCommand('car', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx:spawnVehicle', args.car)
end, false, {help = _U('command_car'), validate = false, arguments = {
	{name = 'car', help = _U('command_car_car'), type = 'any'}
}})

ESX.RegisterCommand({'cardel', 'dv'}, 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx:deleteVehicle', args.radius)
end, false, {help = _U('command_cardel'), validate = false, arguments = {
	{name = 'radius', help = _U('command_cardel_radius'), type = 'any'}
}})

ESX.RegisterCommand('setaccountmoney', 'admin', function(xPlayer, args, showError)
	if args.playerId.getAccount(args.account) then
		args.playerId.setAccountMoney(args.account, args.amount)

		if xPlayer.source == args.playerId.source then
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' กำหนด ' .. args.account .. ' ให้ตนเอง เป็น $' .. ESX.Math.GroupDigits(args.amount) .. ''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^2')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' กำหนด ' .. args.account .. ' ให้ตนเอง เป็น $' .. ESX.Math.GroupDigits(args.amount) .. '```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				}) 
			end
		else
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' กำหนด ' .. args.account .. ' ให้ '.. args.playerId.name .. ' เป็น $' .. ESX.Math.GroupDigits(args.amount) .. ''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^3')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' กำหนด ' .. args.account .. ' ให้ '.. args.playerId.name .. ' เป็น $' .. ESX.Math.GroupDigits(args.amount) .. '```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				}) 
			end
		
			Citizen.Wait(100)
		
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. args.playerId.name .. ' ถูกกำหนด ' .. args.account .. ' เป็น $' .. ESX.Math.GroupDigits(args.amount) .. ' โดย ' .. xPlayer.name ..''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, args.playerId.source, '^2')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. args.playerId.name .. ' ถูกกำหนด ' .. args.account .. ' เป็น $' .. ESX.Math.GroupDigits(args.amount) .. ' โดย ' .. xPlayer.name ..'```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				}) 
			end
		end
	else
		showError(_U('command_giveaccountmoney_invalid'))
	end
end, true, {help = _U('command_setaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_giveaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_setaccountmoney_amount'), type = 'number'}
}})

ESX.RegisterCommand('giveaccountmoney', 'admin', function(xPlayer, args, showError)
	if args.playerId.getAccount(args.account) then
		args.playerId.addAccountMoney(args.account, args.amount)

		if xPlayer.source == args.playerId.source then
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. args.account .. ' จำนวน $' .. ESX.Math.GroupDigits(args.amount) .. ' ให้ตนเอง'
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^2')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' เพิ่ม ' .. args.account .. ' จำนวน $' .. ESX.Math.GroupDigits(args.amount) .. ' ให้ตนเอง```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				})
			end
		else
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. args.account .. ' จำนวน $' .. ESX.Math.GroupDigits(args.amount) .. ' ให้ '.. args.playerId.name .. ''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^3')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' เพิ่ม ' .. args.account .. ' จำนวน $' .. ESX.Math.GroupDigits(args.amount) .. ' ให้ '.. args.playerId.name .. '```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				})
			end
		
			Citizen.Wait(100)

			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. args.playerId.name .. ' ได้รับ ' .. args.account .. ' จำนวน $' .. ESX.Math.GroupDigits(args.amount) .. ' โดย ' .. xPlayer.name ..''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, args.playerId.source, '^2')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. args.playerId.name .. ' ได้รับ ' .. args.account .. ' จำนวน $' .. ESX.Math.GroupDigits(args.amount) .. ' โดย ' .. xPlayer.name ..'```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				})
			end
		end
	else
		showError(_U('command_giveaccountmoney_invalid'))
	end
end, true, {help = _U('command_giveaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_giveaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_giveaccountmoney_amount'), type = 'number'}
}})

ESX.RegisterCommand('giveitem', 'admin', function(xPlayer, args, showError)
	args.playerId.addInventoryItem(args.item, args.count)

	if xPlayer.source == args.playerId.source then
		if Config.DiscordLog == 'AZ' then
			local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetItemLabel(args.item) .. ' จำนวน ' .. ESX.Math.GroupDigits(args.count) .. ' ให้ตนเอง'
			TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^2')
		elseif Config.DiscordLog == 'NC' then
			exports.nc_discordlogs:Discord({
				webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
				xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
				description = '```'.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetItemLabel(args.item) .. ' จำนวน ' .. ESX.Math.GroupDigits(args.count) .. ' ให้ตนเอง```',		-- คำอธิบายรายละเอียด (optional)
				color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
				screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
			})
		end
	else
		if Config.DiscordLog == 'AZ' then
			local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetItemLabel(args.item) .. ' จำนวน ' .. ESX.Math.GroupDigits(args.count) .. ' ให้ '.. args.playerId.name .. ' '
			TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^3')
		elseif Config.DiscordLog == 'NC' then
			exports.nc_discordlogs:Discord({
				webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
				xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
				description = '```'.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetItemLabel(args.item) .. ' จำนวน ' .. ESX.Math.GroupDigits(args.count) .. ' ให้ '.. args.playerId.name .. '```',		-- คำอธิบายรายละเอียด (optional)
				color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
				screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
			})
		end
	
		Citizen.Wait(100)
	
		if Config.DiscordLog == 'AZ' then
			local sendToDiscord = ''.. args.playerId.name .. ' ได้รับ ' .. ESX.GetItemLabel(args.item) .. ' จำนวน ' .. ESX.Math.GroupDigits(args.count) .. ' โดย ' .. xPlayer.name ..''
			TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, args.playerId.source, '^2')
		elseif Config.DiscordLog == 'NC' then
			exports.nc_discordlogs:Discord({
				webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
				xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
				description = '```'.. args.playerId.name .. ' ได้รับ ' .. ESX.GetItemLabel(args.item) .. ' จำนวน ' .. ESX.Math.GroupDigits(args.count) .. ' โดย ' .. xPlayer.name ..'```',		-- คำอธิบายรายละเอียด (optional)
				color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
				screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
			})
		end
	end
end, true, {help = _U('command_giveitem'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'item', help = _U('command_giveitem_item'), type = 'item'},
	{name = 'count', help = _U('command_giveitem_count'), type = 'number'}
}})

ESX.RegisterCommand('giveweapon', 'admin', function(xPlayer, args, showError)
	if args.playerId.hasWeapon(args.weapon) then
		showError(_U('command_giveweapon_hasalready'))
	else
		xPlayer.addWeapon(args.weapon, args.ammo)

		if xPlayer.source == args.playerId.source then
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetWeaponLabel(args.weapon) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(args.ammo) .. ' ให้ตนเอง'
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^2')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetWeaponLabel(args.weapon) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(args.ammo) .. ' ให้ตนเอง```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				})
			end
		else
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetWeaponLabel(args.weapon) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(args.ammo) .. ' ให้ '.. args.playerId.name .. ''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^3')
			elseif Config.DiscordLog == 'NC' then
				exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. xPlayer.name .. ' เพิ่ม ' .. ESX.GetWeaponLabel(args.weapon) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(args.ammo) .. ' ให้ '.. args.playerId.name .. '```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				})
			end
		
			Citizen.Wait(100)
		
			if Config.DiscordLog == 'AZ' then
				local sendToDiscord = ''.. args.playerId.name .. ' ได้รับ ' .. ESX.GetWeaponLabel(args.weapon) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(args.ammo) .. ' โดย ' .. xPlayer.name ..''
				TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, args.playerId.source, '^2')
			elseif Config.DiscordLog == 'NC' then
						exports.nc_discordlogs:Discord({
					webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
					xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
					description = '```'.. args.playerId.name .. ' ได้รับ ' .. ESX.GetWeaponLabel(args.weapon) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(args.ammo) .. ' โดย ' .. xPlayer.name ..'```',		-- คำอธิบายรายละเอียด (optional)
					color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
					screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
				})
			end
		end
	end
end, true, {help = _U('command_giveweapon'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'weapon', help = _U('command_giveweapon_weapon'), type = 'weapon'},
	{name = 'ammo', help = _U('command_giveweapon_ammo'), type = 'number'}
}})

ESX.RegisterCommand('giveweaponcomponent', 'admin', function(xPlayer, args, showError)
	if args.playerId.hasWeapon(args.weaponName) then
		local component = ESX.GetWeaponComponent(args.weaponName, args.componentName)

		if component then
			if xPlayer.hasWeaponComponent(args.weaponName, args.componentName) then
				showError(_U('command_giveweaponcomponent_hasalready'))
			else
				xPlayer.addWeaponComponent(args.weaponName, args.componentName)

				if xPlayer.source == args.playerId.source then
					if Config.DiscordLog == 'AZ' then
						local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. component.label .. ' ส่วนประกอบของ ' .. ESX.GetWeaponLabel(args.weaponName) .. ' ให้ตนเอง'
						TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^2')
					elseif Config.DiscordLog == 'NC' then
						exports.nc_discordlogs:Discord({
							webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
							xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
							description = '```'.. xPlayer.name .. ' เพิ่ม ' .. component.label .. ' ส่วนประกอบของ ' .. ESX.GetWeaponLabel(args.weaponName) .. ' ให้ตนเอง```',		-- คำอธิบายรายละเอียด (optional)
							color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
							screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
						})
					end
				else
					if Config.DiscordLog == 'AZ' then
						local sendToDiscord = ''.. xPlayer.name .. ' เพิ่ม ' .. component.label .. ' ส่วนประกอบของ ' .. ESX.GetWeaponLabel(args.weaponName) .. ' ให้ '.. args.playerId.name .. ''
						TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, xPlayer.source, '^3')
					elseif Config.DiscordLog == 'NC' then
						exports.nc_discordlogs:Discord({
							webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
							xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
							description = '```'.. xPlayer.name .. ' เพิ่ม ' .. component.label .. ' ส่วนประกอบของ ' .. ESX.GetWeaponLabel(args.weaponName) .. ' ให้ '.. args.playerId.name .. '```',		-- คำอธิบายรายละเอียด (optional)
							color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
							screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
						})
					end
				
					Citizen.Wait(100)
				
					if Config.DiscordLog == 'AZ' then
						local sendToDiscord = ''.. args.playerId.name .. ' ได้รับ ' .. component.label .. ' ส่วนประกอบของ ' .. ESX.GetWeaponLabel(args.weaponName) .. ' โดย ' .. xPlayer.name ..''
						TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'AdminCommands', sendToDiscord, args.playerId.source, '^2')
					elseif Config.DiscordLog == 'NC' then
						exports.nc_discordlogs:Discord({
							webhook = 'AdminCommands',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
							xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
							description = '```'.. args.playerId.name .. ' ได้รับ ' .. component.label .. ' ส่วนประกอบของ ' .. ESX.GetWeaponLabel(args.weaponName) .. ' โดย ' .. xPlayer.name ..'```',		-- คำอธิบายรายละเอียด (optional)
							color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
							screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
						})
					end
				end
			end
		else
			showError(_U('command_giveweaponcomponent_invalid'))
		end
	else
		showError(_U('command_giveweaponcomponent_missingweapon'))
	end
end, true, {help = _U('command_giveweaponcomponent'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'weaponName', help = _U('command_giveweapon_weapon'), type = 'weapon'},
	{name = 'componentName', help = _U('command_giveweaponcomponent_component'), type = 'string'}
}})

ESX.RegisterCommand({'clear', 'cls'}, 'user', function(xPlayer, args, showError)
	xPlayer.triggerEvent('chat:clear')
end, false, {help = _U('command_clear')})

ESX.RegisterCommand({'clearall', 'clsall'}, 'admin', function(xPlayer, args, showError)
	TriggerClientEvent('chat:clear', -1)
end, false, {help = _U('command_clearall')})

if not Config.OxInventory then
	ESX.RegisterCommand('clearinventory', 'admin', function(xPlayer, args, showError)
		for k,v in pairs(args.playerId.inventory) do
			if v > 0 then
				args.playerId.setInventoryItem(k, 0)
			end
		end
		TriggerEvent('esx:playerInventoryCleared',args.playerId)
	end, true, {help = _U('command_clearinventory'), validate = true, arguments = {
		{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
	}})

	ESX.RegisterCommand('clearloadout', 'admin', function(xPlayer, args, showError)
		for i=#args.playerId.loadout, 1, -1 do
			args.playerId.removeWeapon(args.playerId.loadout[i].name)
		end
		TriggerEvent('esx:playerLoadoutCleared',args.playerId)
	end, true, {help = _U('command_clearloadout'), validate = true, arguments = {
		{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
	}})
end

ESX.RegisterCommand('setgroup', 'admin', function(xPlayer, args, showError)
	if not args.playerId then args.playerId = xPlayer.source end
	if args.group == "superadmin" then args.group = "admin" end
	args.playerId.setGroup(args.group)
end, true, {help = _U('command_setgroup'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'group', help = _U('command_setgroup_group'), type = 'string'},
}})

ESX.RegisterCommand('save', 'admin', function(xPlayer, args, showError)
	Core.SavePlayer(args.playerId)
	print("[^2Info^0] Saved Player!")
end, true, {help = _U('command_save'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('FixBugID', 'admin', function(xPlayer, args, showError)
	local xPlayertarget = ESX.GetPlayerFromId(playerId)
    DropPlayer(args.playerId,'แก้ไขตัวค้างในเซิฟ')
	Wait(500)
	-- TriggerEvent('esx:playerDropped', args.playerId, "แก้ไขตัวค้างในเซิฟ")
	Core.SavePlayer(xPlayertarget, args.playerId, function()
		ESX.Players[args.playerId] = nil
	end)
	print("[^2Info^0] Saved Player Fix!")
end, true, {help = _U('command_save'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})



ESX.RegisterCommand('saveall', 'admin', function(xPlayer, args, showError)
	Core.SavePlayers()
end, true, {help = _U('command_saveall')})

ESX.RegisterCommand('group', {"user", "admin"}, function(xPlayer, args, showError)
	print(xPlayer.getName()..", You are currently: ^5".. xPlayer.getGroup() .. "^0")
end, true)

ESX.RegisterCommand('job', {"user", "admin"}, function(xPlayer, args, showError)
	print(xPlayer.getName()..", You are currently: ^5".. xPlayer.getJob().name.. "^0 - ^5".. xPlayer.getJob().grade_label .. "^0")
end, true)

ESX.RegisterCommand('info', {"user", "admin"}, function(xPlayer, args, showError)
	local job = xPlayer.getJob().name
	local jobgrade = xPlayer.getJob().grade_name
	print("^2ID : ^5"..xPlayer.source.." ^0| ^2Name:^5"..xPlayer.getName().." ^0 | ^2Group:^5"..xPlayer.getGroup().."^0 | ^2Job:^5".. job.."^0")
end, true)

ESX.RegisterCommand('coords', "admin", function(xPlayer, args, showError)
    local ped = GetPlayerPed(xPlayer.source)
	local coords = GetEntityCoords(ped, false)
	local heading = GetEntityHeading(ped)
	print("Coords - Vector3: ^5".. vector3(coords.x,coords.y,coords.z).. "^0")
	print("Coords - Vector4: ^5".. vector4(coords.x, coords.y, coords.z, heading) .. "^0")
end, true)

ESX.RegisterCommand('tpm', "admin", function(xPlayer, args, showError)
	xPlayer.triggerEvent("esx:tpm")
end, true)

ESX.RegisterCommand('goto', "admin", function(xPlayer, args, showError)
	local targetCoords = args.playerId.getCoords()
	xPlayer.setCoords(targetCoords)
end, true, {help = _U('command_goto'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('bring', "admin", function(xPlayer, args, showError)
	local playerCoords = xPlayer.getCoords()
	args.playerId.setCoords(playerCoords)
end, true, {help = _U('command_bring'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('kill', "admin", function(xPlayer, args, showError)
	args.playerId.triggerEvent("esx:killPlayer")
end, true, {help = _U('command_kill'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('freeze', "admin", function(xPlayer, args, showError)
	args.playerId.triggerEvent('esx:freezePlayer', "freeze")
end, true, {help = _U('command_freeze'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand('unfreeze', "admin", function(xPlayer, args, showError)
	args.playerId.triggerEvent('esx:freezePlayer', "unfreeze")
end, true, {help = _U('command_unfreeze'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

ESX.RegisterCommand("noclip", 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx:noclip')
end, false)

ESX.RegisterCommand('players', "admin", function(xPlayer, args, showError)
	local xPlayers = ESX.GetExtendedPlayers() -- Returns all xPlayers
	print("^5"..#xPlayers.." ^2online player(s)^0")
	for _, xPlayer in pairs(xPlayers) do
		print("^1[ ^2ID : ^5"..xPlayer.source.." ^0| ^2Name : ^5"..xPlayer.getName().." ^0 | ^2Group : ^5"..xPlayer.getGroup().." ^0 | ^2Identifier : ^5".. xPlayer.identifier .."^1]^0\n")
	end
end, true)
