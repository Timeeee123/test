SetMapName('San Andreas')
SetGameType('ESX Legacy')

local newPlayer = 'INSERT INTO `users` SET `accounts` = ?, `identifier` = ?, `group` = ?, `position` = ?'
local loadPlayer = 'SELECT `accounts`, `job`, `job_grade`, `group`, `position`, `inventory`, `skin`, `loadout`, `health`'
loadPlayer = loadPlayer .. ', `firstname`, `lastname`, `dateofbirth`, `sex`, `height`'
loadPlayer = loadPlayer .. ' FROM `users` WHERE identifier = ?'

function onPlayerJoined(playerId)
    local identifier = ESX.GetIdentifier(playerId)
    if identifier then
        if ESX.GetPlayerFromIdentifier(identifier) then
            DropPlayer(playerId,
                ('there was an error loading your character!\nError code: identifier-active-ingame\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same Rockstar account.\n\nYour Rockstar identifier: %s'):format(
                    identifier))
        else
            local result = MySQL.scalar.await('SELECT 1 FROM users WHERE identifier = ?', {identifier})
            if result then
                loadESXPlayer(identifier, playerId, false)
            else
                createESXPlayer(identifier, playerId)
            end
        end
    else
        DropPlayer(playerId,
            'there was an error loading your character!\nError code: identifier-missing-ingame\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
    end
end

function createESXPlayer(identifier, playerId, data)
    local accounts = {}

    for account, money in pairs(Config.StartingAccountMoney) do
        accounts[account] = money
    end

    if Core.IsPlayerAdmin(playerId) then
        print(('^2[INFO] ^0 Player ^5%s ^0Has been granted admin permissions via ^5Ace Perms.^7'):format(playerId))
        defaultGroup = "superadmin"
    else
        defaultGroup = "user"
    end
    local slect = math.random(1, #Config.FirstSpawn)
    local FirstSpawnCoords = {x = ESX.Math.Round(Config.FirstSpawn[slect].x, 1), y = ESX.Math.Round(Config.FirstSpawn[slect].y, 1), z = ESX.Math.Round(Config.FirstSpawn[slect].z, 1), heading = Config.FirstSpawn[slect].h}

        MySQL.prepare(newPlayer, {json.encode(accounts), identifier, defaultGroup, json.encode(FirstSpawnCoords)}, function()
            loadESXPlayer(identifier, playerId, true)
        end)
end

-- if not Config.Multichar then
--     AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
--         deferrals.defer()
--         local playerId = source
--         local identifier = ESX.GetIdentifier(playerId)

--         if identifier then
--             if ESX.GetPlayerFromIdentifier(identifier) then
--                 deferrals.done(
--                     ('There was an error loading your character!\nError code: identifier-active\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same account.\n\nYour identifier: %s'):format(
--                         identifier))
--             else
--                 deferrals.done()
--             end
--         else
--             deferrals.done(
--                 'There was an error loading your character!\nError code: identifier-missing\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
--         end
--     end)
-- end



function loadESXPlayer(identifier, playerId, isNew)
    local userData = {
        accounts = {},
        inventory = {},
        job = {},
        loadout = {},
        playerName = GetPlayerName(playerId),
        health = {},
        weight = 0
    }
    local result = MySQL.prepare.await(loadPlayer, {identifier})
    local job, grade, jobObject, gradeObject = result.job, tostring(result.job_grade)
    local foundAccounts, foundItems = {}, {}

    -- Accounts
    if result.accounts and result.accounts ~= '' then
        local accounts = json.decode(result.accounts)

        for account, money in pairs(accounts) do
            foundAccounts[account] = money
        end
    end

      -- Health
    if result.health and result.health ~= '' then
        local health = json.decode(result.health)
        for label, count in pairs(health) do
            if count > 200 then
                table.insert(userData.health, {
                    name = label,
                    value = 200
                })
                print(('[^3WARNING^7] Over limit health for %s'):format(identifier))
            else
                table.insert(userData.health, {
                    name = label,
                    value = count
                })
            end
        end
    end

    for account, label in pairs(Config.Accounts) do
        table.insert(userData.accounts, {
            name = account,
            money = foundAccounts[account] or Config.StartingAccountMoney[account] or 0,
            label = label
        })
    end

    -- Job
    if ESX.DoesJobExist(job, grade) then
        jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
    else
        print(('[^3WARNING^7] Ignoring invalid job for %s [job: %s, grade: %s]'):format(identifier, job, grade))
        job, grade = 'unemployed', '0'
        jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]
    end

    userData.job.id = jobObject.id
    userData.job.name = jobObject.name
    userData.job.label = jobObject.label

    userData.job.grade = tonumber(grade)
    userData.job.grade_name = gradeObject.name
    userData.job.grade_label = gradeObject.label
    userData.job.grade_salary = gradeObject.salary
    userData.job.onDuty = Config.OnDuty

    userData.job.skin_male = {}
    userData.job.skin_female = {}

    if gradeObject.skin_male then
        userData.job.skin_male = json.decode(gradeObject.skin_male)
    end
    if gradeObject.skin_female then
        userData.job.skin_female = json.decode(gradeObject.skin_female)
    end

    -- Inventory
    if result.inventory and result.inventory ~= '' then
        userData.inventory = json.decode(result.inventory)
    end

    for k, v in pairs(userData.inventory) do
        if ESX.Items[k] ~= nil then
            userData.weight = userData.weight + ((ESX.Items[k].weight or 0 ) * v)
        end
    end

    table.sort(userData.inventory, function(a, b)
        return a.label < b.label
    end)


    -- Group
    if result.group then
        -- if result.group == "admin" then
        --     userData.group = "superadmin"
        -- else
            userData.group = result.group
        -- end
    else
        userData.group = 'user'
    end

    -- Loadout
    if not Config.OxInventory then
        if result.loadout and result.loadout ~= '' then
            local loadout = json.decode(result.loadout)

            for name, weapon in pairs(loadout) do
                local label = ESX.GetWeaponLabel(name)

                if label then
                    if not weapon.components then
                        weapon.components = {}
                    end
                    if not weapon.tintIndex then
                        weapon.tintIndex = 0
                    end

                    table.insert(userData.loadout, {
                        name = name,
                        ammo = weapon.ammo,
                        label = label,
                        components = weapon.components,
                        tintIndex = weapon.tintIndex
                    })
                end
            end
        end
    end

    -- Position
    if result.position and result.position ~= '' then
        userData.coords = json.decode(result.position)
    else
        print('[^3WARNING^7] Column ^5"position"^0 in ^5"users"^0 table is missing required default value. Using backup coords, fix your database.')
        userData.coords = Config.CoordsCash
        print(userData.coords)
    end

    -- -- Skin
    if result.skin and result.skin ~= '' then
        userData.skin = json.decode(result.skin)
    else
        if userData.sex == 1 then
            userData.skin = {
                sex = 1
            }
        else
            userData.skin = {
                sex = 0
            }
        end
    end

    -- Identity
    if result.firstname and result.firstname ~= '' then
        userData.firstname = result.firstname
        userData.lastname = result.lastname
        userData.playerName = userData.firstname .. ' ' .. userData.lastname
        if result.dateofbirth then
            userData.dateofbirth = result.dateofbirth
        end
        if result.sex then
            userData.sex = result.sex
        end
        if result.height then
            userData.height = result.height
        end
    end

    local xPlayer = CreateExtendedPlayer(playerId, identifier, userData.group, userData.accounts, userData.inventory, userData.weight,
         userData.job, userData.loadout, userData.playerName, userData.coords)
    ESX.Players[playerId] = xPlayer
    Core.playersByIdentifier[identifier] = playerId

    if userData.firstname then
        xPlayer.set('firstName', userData.firstname)
        xPlayer.set('lastName', userData.lastname)
        if userData.dateofbirth then
            xPlayer.set('dateofbirth', userData.dateofbirth)
        end
        if userData.sex then
            xPlayer.set('sex', userData.sex)
        end
        if userData.height then
            xPlayer.set('height', userData.height)
        end
    end

    TriggerEvent('esx:playerLoaded', playerId, xPlayer, isNew)

    xPlayer.triggerEvent('Soorry:playerLoaded', {
        accounts = xPlayer.getAccounts(),
        coords = xPlayer.getCoords(),
        identifier = xPlayer.getIdentifier(),
        inventory = xPlayer.getInventory(true),
        maxWeight = xPlayer.getMaxWeight(),
        job = xPlayer.getJob(),
        loadout = xPlayer.getLoadout(),
        health = userData.health,
        money = xPlayer.getMoney(),
        itemdata = ESX.Items,
        dead = false
    }, isNew, userData.skin) --

    if not Config.OxInventory then
        xPlayer.triggerEvent('esx:createMissingPickups', Core.Pickups)
    else
        exports.ox_inventory:setPlayerInventory(xPlayer, userData.inventory)
    end

    xPlayer.triggerEvent('esx:registerSuggestions', Core.RegisteredCommands)
    print(('[^2INFO^0] Player ^5"%s" ^0has connected to the server. ID: ^5%s^7'):format(xPlayer.getName(), playerId))
end

AddEventHandler('chatMessage', function(playerId, author, message)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if message:sub(1, 1) == '/' and playerId > 0 then
        CancelEvent()
        local commandName = message:sub(1):gmatch("%w+")()
        xPlayer.showNotification(_U('commanderror_invalidcommand', commandName))
    end
end)

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer then
        TriggerEvent('esx:playerDropped', playerId, reason)

        Core.playersByIdentifier[xPlayer.identifier] = nil
        Core.SavePlayer(xPlayer, playerId, function()
            ESX.Players[playerId] = nil
        end)
    end
end)

AddEventHandler('esx:playerLogout', function(playerId, cb)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        TriggerEvent('esx:playerDropped', playerId)

        Core.playersByIdentifier[xPlayer.identifier] = nil
        Core.SavePlayer(xPlayer, playerId, function()
            ESX.Players[playerId] = nil
            if cb then
                cb()
            end
        end)
    end
    TriggerClientEvent("esx:onPlayerLogout", playerId)
end)

RegisterNetEvent('esx:updateCoords')
AddEventHandler('esx:updateCoords', function(coords)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        if coords ~= nil then
            xPlayer.updateCoords(coords)
        else
            local playerCoords = GetEntityCoords(GetPlayerPed(source))
            local playerHeading = ESX.Math.Round(GetPlayerPed(source), 1)
            local coordsv =  {x = ESX.Math.Round(playerCoords.x, 1), y = ESX.Math.Round(playerCoords.y, 1), z = ESX.Math.Round(playerCoords.z, 1), heading = playerHeading}
            xPlayer.updateCoords(coordsv)
        end
    end
end)

if not Config.OxInventory then
    RegisterNetEvent('esx:updateWeaponAmmo')
    AddEventHandler('esx:updateWeaponAmmo', function(weaponName, ammoCount)
        if weaponName and ammoCount then
            local xPlayer = ESX.GetPlayerFromId(source)

            if xPlayer then
                xPlayer.updateWeaponAmmo(weaponName, ammoCount)
            end
        end
    end)

    RegisterNetEvent('esx:giveInventoryItem')
    AddEventHandler('esx:giveInventoryItem', function(target, type, itemName, itemCount)
        local playerId = source
        local sourceXPlayer = ESX.GetPlayerFromId(playerId)
        local targetXPlayer = ESX.GetPlayerFromId(target)
    
        if type == 'item_standard' then
    
            local sourceItem    = sourceXPlayer.getInventoryItem(itemName)
            local targetItem    = targetXPlayer.getInventoryItem(itemName)
    
            if itemCount > 0 and sourceItem.count >= itemCount then
    
                if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = 'คุณ <strong class="red-text">' .. targetXPlayer.name ..'</strong> ไม่สามารถรับไอเทมจากคุณได้เนื่องจากไอเทมเกินขีดจำกัด',
                        type = "error",
                        timeout = 3000,
                        layout = "bottomCenter",
                        queue = "global"
                    })
                else
                    sourceXPlayer.removeInventoryItem(itemName, itemCount)
                    targetXPlayer.addInventoryItem(itemName, itemCount)
                    
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = 'ส่ง <strong class="amber-text">'.. ESX.Items[itemName].label ..'</strong> จำนวน ' .. itemCount,
                        type = "success",
                        timeout = 3000,
                        layout = "bottomCenter",
                        queue = "global"
                    })
                    TriggerClientEvent("pNotify:SendNotification", target, {
                        text = 'ได้รับ <strong class="amber-text">'.. ESX.Items[itemName].label ..'</strong> จำนวน ' .. itemCount,
                        type = "success",
                        timeout = 3000,
                        layout = "bottomCenter",
                        queue = "global"
                    })
                    if Config.Log == 'AZ' then
                        local sendToDiscord = ''.. sourceXPlayer.name .. ' ส่ง ' .. ESX.GetItemLabel(itemName) .. ' ให้กับ ' .. targetXPlayer.name .. ' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveItem', sendToDiscord, sourceXPlayer.source, '^1')

                        Citizen.Wait(100)
                                    
                        local sendToDiscord2 = ''.. targetXPlayer.name .. ' ได้รับ ' .. ESX.GetItemLabel(itemName) .. ' จาก ' .. sourceXPlayer.name .. ' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveItem', sendToDiscord2, targetXPlayer.source, '^2')
                    elseif Config.Log == 'NC' then
                        exports.nc_discordlogs:Discord({
                            webhook = 'GiveItem',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. sourceXPlayer.name .. ' ส่ง ' .. ESX.GetItemLabel(itemName) .. ' ให้กับ ' .. targetXPlayer.name .. ' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. '```',		-- คำอธิบายรายละเอียด (optional)
                            color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })

                        Citizen.Wait(100)

                        exports.nc_discordlogs:Discord({
                            webhook = 'GiveItem',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. targetXPlayer.name .. ' ได้รับ ' .. ESX.GetItemLabel(itemName) .. ' จาก ' .. sourceXPlayer.name .. ' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. '```',		-- คำอธิบายรายละเอียด (optional)
                            color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })
                    end
                end
    
            else
                TriggerClientEvent("pNotify:SendNotification", source, {
                    text = '<span class="red-text">ปริมาณที่ไม่ถูกต้อง</span>',
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "global"
                })
            end
        elseif type == 'item_account' then
            if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
                sourceXPlayer.removeAccountMoney(itemName, itemCount)
                targetXPlayer.addAccountMoney   (itemName, itemCount)
    
                TriggerClientEvent("pNotify:SendNotification", source, { --แจ้งเตือนเรา _source = owned
                    text = '<center><strong class="blue-text">ช่วยเหลือ</strong> ส่ง <strong class="amber-text">เงินสด</strong> จำนวน ' .. itemCount..'<center>',
                    type = "information",
                    timeout = 3000,
                    layout = "centerRight",
                    queue = "global"
                })
    
                TriggerClientEvent("pNotify:SendNotification", target, { --แจ้งเตือนเป้าหมาย target = Other players
                    text = '<center><strong class="blue-text">ช่วยเหลือ</strong> ได้รับ <strong class="amber-text">เงินสด</strong> จำนวน ' .. itemCount..'<center>',
                    type = "information",
                    timeout = 3000,
                    layout = "centerRight",
                    queue = "global"
                })
                    if Config.Log == 'AZ' then
                        local sendToDiscord = ''.. sourceXPlayer.name .. ' ส่ง '.. Config.Accounts[itemName] ..' ให้กับ ' .. targetXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. ''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveMoney', sendToDiscord, sourceXPlayer.source, '^1')	

                        Citizen.Wait(100)
                                    
                        local sendToDiscord2 = ''.. targetXPlayer.name .. ' ได้รับ '.. Config.Accounts[itemName] ..' จาก ' .. sourceXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. ''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveMoney', sendToDiscord2, targetXPlayer.source, '^2')
                    elseif Config.Log == 'NC' then
                        exports.nc_discordlogs:Discord({
                            webhook = 'GiveMoney',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. sourceXPlayer.name .. ' ส่ง '.. Config.Accounts[itemName] ..' ให้กับ ' .. targetXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. '```',		-- คำอธิบายรายละเอียด (optional)
                            color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })

                        Citizen.Wait(100)

                        exports.nc_discordlogs:Discord({
                            webhook = 'GiveMoney',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. targetXPlayer.name .. ' ได้รับ '.. Config.Accounts[itemName] ..' จาก ' .. sourceXPlayer.name .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. '```',		-- คำอธิบายรายละเอียด (optional)
                            color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })
                    end
                
            else
                TriggerClientEvent("pNotify:SendNotification", source, {
                    text = '<center><strong class="red-text">ล้มเหลว</strong> ปริมาณที่ไม่ถูกต้อง<center>',
                    type = "information",
                    timeout = 3000,
                    layout = "centerRight",
                    queue = "global"
                })
            end
        elseif type == 'item_weapon' then
            if sourceXPlayer.hasWeapon(itemName) then
                local weaponLabel = ESX.GetWeaponLabel(itemName)
    
                if not targetXPlayer.hasWeapon(itemName) then
                    local _, weapon = sourceXPlayer.getWeapon(itemName)
                    local _, weaponObject = ESX.GetWeapon(itemName)
                    itemCount = weapon.ammo
    
                    sourceXPlayer.removeWeapon(itemName)
                    targetXPlayer.addWeapon(itemName, itemCount)
    
                    if weaponObject.ammo and itemCount > 0 then
                        local ammoLabel = weaponObject.ammo.label
                        
                        TriggerClientEvent("pNotify:SendNotification", source, {
                            text = '<center><strong class="blue-text">ช่วยเหลือ</strong> ส่ง <strong class="amber-text">'.. weaponLabel ..'</strong> (กระสุน จำนวน ' .. itemCount ..') <center>',
                            type = "information",
                            timeout = 3000,
                            layout = "centerRight",
                            queue = "global"
                        })
                        TriggerClientEvent("pNotify:SendNotification", target, {
                            text = '<center><strong class="blue-text">ช่วยเหลือ</strong> ได้รับ <strong class="amber-text">'.. weaponLabel ..'</strong> (กระสุน จำนวน ' .. itemCount ..')  <center>',
                            type = "information",
                            timeout = 3000,
                            layout = "centerRight",
                            queue = "global"
                        })
                    else
                        
                        TriggerClientEvent("pNotify:SendNotification", source, {
                            text = '<center><strong class="blue-text">ช่วยเหลือ</strong> ส่ง <strong class="amber-text">'.. weaponLabel ..'</strong><center>',
                            type = "information",
                            timeout = 3000,
                            layout = "centerRight",
                            queue = "global"
                        })
                        TriggerClientEvent("pNotify:SendNotification", target, {
                            text = '<center><strong class="blue-text">ช่วยเหลือ</strong> ได้รับ <strong class="amber-text">'.. weaponLabel ..'</strong><center>',
                            type = "information",
                            timeout = 3000,
                            layout = "centerRight",
                            queue = "global"
                        })
                    end
    
                    if weaponObject.ammo and itemCount > 0 then
                        if Config.Log == 'AZ' then
                            local sendToDiscord = ''.. sourceXPlayer.name .. ' ส่ง '.. weaponLabel ..' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' ให้กับ ' .. targetXPlayer.name .. ''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveWeapon', sendToDiscord, sourceXPlayer.source, '^1')		
    
                            Citizen.Wait(100)
                                        
                            local sendToDiscord2 = ''.. targetXPlayer.name .. ' ได้รับ '.. weaponLabel ..' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' จาก ' .. sourceXPlayer.name .. ''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveWeapon', sendToDiscord2, targetXPlayer.source, '^2')
                        elseif Config.Log == 'NC' then
                            exports.nc_discordlogs:Discord({
                                webhook = 'GiveWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. sourceXPlayer.name .. ' ส่ง '.. weaponLabel ..' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' ให้กับ ' .. targetXPlayer.name .. '```',		-- คำอธิบายรายละเอียด (optional)
                                color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
    
                            Citizen.Wait(100)
    
                            exports.nc_discordlogs:Discord({
                                webhook = 'GiveWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. targetXPlayer.name .. ' ได้รับ '.. weaponLabel ..' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' จาก ' .. sourceXPlayer.name .. '```',		-- คำอธิบายรายละเอียด (optional)
                                color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                        end
                    else
                        if Config.Log == 'AZ' then
                            local sendToDiscord = ''.. sourceXPlayer.name .. ' ส่ง '.. weaponLabel ..' ให้กับ ' .. targetXPlayer.name .. ''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveWeapon', sendToDiscord, sourceXPlayer.source, '^1')		
    
                            Citizen.Wait(100)
                                        
                            local sendToDiscord2 = ''.. targetXPlayer.name .. ' ได้รับ '.. weaponLabel ..' จาก ' .. sourceXPlayer.name .. ''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveWeapon', sendToDiscord2, targetXPlayer.source, '^2')
                        elseif Config.Log == 'NC' then
                            exports.nc_discordlogs:Discord({
                                webhook = 'GiveWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. sourceXPlayer.name .. ' ส่ง '.. weaponLabel ..' ให้กับ ' .. targetXPlayer.name .. '```',		-- คำอธิบายรายละเอียด (optional)
                                color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                                
                            Citizen.Wait(100)
                                
                            
                            exports.nc_discordlogs:Discord({
                                webhook = 'GiveWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. targetXPlayer.name .. ' ได้รับ '.. weaponLabel ..' จาก ' .. sourceXPlayer.name .. '```',		-- คำอธิบายรายละเอียด (optional)
                                color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                        end
                        
                        
                    end
                else
                    
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = '<center><strong class="red-text">ล้มเหลว</strong> ผู้เล่นมีอาวุธอยู่แล้ว<center>',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
                    TriggerClientEvent("pNotify:SendNotification", target, {
                        text = '<center><strong class="red-text">ล้มเหลว</strong> คุณมีอาวุธอยู่แล้ว<center>',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
                end
            end
        elseif type == 'item_ammo' then
            if sourceXPlayer.hasWeapon(itemName) then
                local weaponNum, weapon = sourceXPlayer.getWeapon(itemName)
    
                if targetXPlayer.hasWeapon(itemName) then
                    local _, weaponObject = ESX.GetWeapon(itemName)
    
                    if weaponObject.ammo then
                        local ammoLabel = weaponObject.ammo.label
    
                        if weapon.ammo >= itemCount then
                            sourceXPlayer.removeWeaponAmmo(itemName, itemCount)
                            targetXPlayer.addWeaponAmmo(itemName, itemCount)
    
                            sourceXPlayer.showNotification(_U('gave_weapon_ammo', itemCount, ammoLabel, weapon.label, targetXPlayer.name))
                            targetXPlayer.showNotification(_U('received_weapon_ammo', itemCount, ammoLabel, weapon.label, sourceXPlayer.name))
                                if Config.Log == 'AZ' then
                                    local sendToDiscord = ''.. sourceXPlayer.name .. ' ส่ง กระสุน ของ '.. weapon.label ..' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' ให้กับ ' .. targetXPlayer.name .. ''
                                    TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveAmmo', sendToDiscord, sourceXPlayer.source, '^1')		
            
                                    Citizen.Wait(100)
                                                
                                    local sendToDiscord2 = ''.. targetXPlayer.name .. ' ได้รับ กระสุน ของ '.. weapon.label ..' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' จาก ' .. sourceXPlayer.name .. ''
                                    TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'GiveAmmo', sendToDiscord2, targetXPlayer.source, '^2')
                                elseif Config.Log == 'NC' then
                                    exports.nc_discordlogs:Discord({
                                        webhook = 'GiveAmmo',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                        xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                        description = '```'.. sourceXPlayer.name .. ' ส่ง กระสุน ของ '.. weapon.label ..' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' ให้กับ ' .. targetXPlayer.name .. '```',		-- คำอธิบายรายละเอียด (optional)
                                        color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                        screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                                    })	
                                    
                                    Citizen.Wait(100)
                                    
                                    
                                    exports.nc_discordlogs:Discord({
                                        webhook = 'GiveAmmo',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                        xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                        description = '```'.. targetXPlayer.name .. ' ได้รับ กระสุน ของ '.. weapon.label ..' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ' จาก ' .. sourceXPlayer.name .. '```',		-- คำอธิบายรายละเอียด (optional)
                                        color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                        screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                                    })
                                end
                           
                            
                        end
                    end
                else
                    sourceXPlayer.showNotification(_U('gave_weapon_noweapon', targetXPlayer.name))
                    targetXPlayer.showNotification(_U('received_weapon_noweapon', sourceXPlayer.name, weapon.label))
                end
            end
        end
    end)
    
    RegisterNetEvent('esx:removeInventoryItem')
    AddEventHandler('esx:removeInventoryItem', function(type, itemName, itemCount)
        local playerId = source
        local xPlayer = ESX.GetPlayerFromId(source)
    
        if type == 'item_standard' then
            if itemCount == nil or itemCount < 1 then
                
                TriggerClientEvent("pNotify:SendNotification", source, {
                    text = '<center><strong class="red-text">ล้มเหลว</strong> ปริมาณที่ไม่ถูกต้อง<center>',
                    type = "information",
                    timeout = 3000,
                    layout = "centerRight",
                    queue = "global"
                })
            else
                local xItem = xPlayer.getInventoryItem(itemName)
    
                if (itemCount > xItem.count or xItem.count < 1) then
                    
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = '<center><strong class="red-text">ล้มเหลว</strong> ปริมาณที่ไม่ถูกต้อง<center>',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
                else
                    xPlayer.removeInventoryItem(itemName, itemCount)
                    local pickupLabel = ('~y~%s~s~ [~b~%s~s~]'):format(xItem.label, itemCount)
                    
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = '<center>คุณโยน <strong class="red-text">'..xItem.label..' ['..itemCount..']</strong> ลงพื้น<center>',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
                        if Config.Log == 'AZ' then
                            local sendToDiscord = ''.. xPlayer.name .. ' ทิ้ง '.. xItem.label ..' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. ''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'RemoveItem', sendToDiscord, xPlayer.source, '^1')
                        elseif Config.Log == 'NC' then
                            exports.nc_discordlogs:Discord({
                                webhook = 'RemoveItem',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. xPlayer.name .. ' ทิ้ง '.. xItem.label ..' จำนวน ' .. ESX.Math.GroupDigits(itemCount) .. '```',		-- คำอธิบายรายละเอียด (optional)
                                color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                        end
                    
                   
                end
            end
        elseif type == 'item_account' then
            if itemCount == nil or itemCount < 1 then
                
                TriggerClientEvent("pNotify:SendNotification", source, {
                    text = '<center><strong class="red-text">ล้มเหลว</strong> ปริมาณที่ไม่ถูกต้อง<center>',
                    type = "information",
                    timeout = 3000,
                    layout = "centerRight",
                    queue = "global"
                })
            else
                local account = xPlayer.getAccount(itemName)
    
                if (itemCount > account.money or account.money < 1) then
                    
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = '<center><strong class="red-text">ล้มเหลว</strong> ปริมาณที่ไม่ถูกต้อง<center>',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
                else
                    xPlayer.removeAccountMoney(itemName, itemCount)
                    local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(account.label, _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
                    
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = '<center>คุณโยน <strong class="red-text">'..string.lower(account.label)..' ['..ESX.Math.GroupDigits(itemCount)..']</strong> ลงพื้น<center>',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
    
                    if Config.Log == 'AZ' then
                        local sendToDiscord = ''.. xPlayer.name .. ' ทิ้ง ' .. Config.Accounts[itemName] .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. ''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'RemoveMoney', sendToDiscord, xPlayer.source, '^1')
                    elseif Config.Log == 'NC' then
                        exports.nc_discordlogs:Discord({
                            webhook = 'RemoveMoney',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. xPlayer.name .. ' ทิ้ง ' .. Config.Accounts[itemName] .. ' จำนวน $' .. ESX.Math.GroupDigits(itemCount) .. '```',		-- คำอธิบายรายละเอียด (optional)
                            color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })
                    end
                end
            end
        elseif type == 'item_weapon' then
            itemName = string.upper(itemName)
    
            if xPlayer.hasWeapon(itemName) then
                local _, weapon = xPlayer.getWeapon(itemName)
                local _, weaponObject = ESX.GetWeapon(itemName)
                local components, pickupLabel = ESX.Table.Clone(weapon.components)
                xPlayer.removeWeapon(itemName)
    
                if weaponObject.ammo and weapon.ammo > 0 then
                    local ammoLabel = weaponObject.ammo.label
                    pickupLabel = ('~y~%s~s~ [~g~%s~s~ %s]'):format(weapon.label, weapon.ammo, ammoLabel)
                    xPlayer.showNotification(_U('threw_weapon_ammo', weapon.label, weapon.ammo, ammoLabel))
                else
                    pickupLabel = ('~y~%s~s~'):format(weapon.label)
                    xPlayer.showNotification(_U('threw_weapon', weapon.label))
                end
    
                if weaponObject.ammo and weapon.ammo > 0 then
                    if Config.Log == 'AZ' then
                        local sendToDiscord = ''.. xPlayer.name .. ' ทิ้ง ' .. weapon.label .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(weapon.ammo) .. ''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'RemoveWeapon', sendToDiscord, xPlayer.source, '^1')
                    elseif Config.Log == 'NC' then
                        exports.nc_discordlogs:Discord({
                            webhook = 'RemoveWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. xPlayer.name .. ' ทิ้ง ' .. weapon.label .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(weapon.ammo) .. '```',		-- คำอธิบายรายละเอียด (optional)
                            color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })
                    end
                else
                    if Config.Log == 'AZ' then
                        local sendToDiscord = ''.. xPlayer.name .. ' ทิ้ง ' .. weapon.label .. ''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'RemoveWeapon', sendToDiscord, xPlayer.source, '^1')
                    elseif Config.Log == 'NC' then
                        exports.nc_discordlogs:Discord({
                            webhook = 'RemoveWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. xPlayer.name .. ' ทิ้ง ' .. weapon.label .. '```',		-- คำอธิบายรายละเอียด (optional)
                            color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })
                    end
                end
            end
        end
    end)
    
    RegisterServerEvent('esx:useItem')
    AddEventHandler('esx:useItem', function(itemName)
        local xPlayer = ESX.GetPlayerFromId(source)
                if xPlayer then
                    local xItem = xPlayer.getInventoryItem(itemName)
                if xItem then
                    local count = xItem.count
                if count and count > 0 then
                    ESX.UseItem(source, itemName)
                        if Config.Log == 'AZ' then
                            local sendToDiscord = ''.. xPlayer.name .. ' ใช้ไอเทม ' .. xItem.label .. ' จำนวน 1'
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'UseItem', sendToDiscord, source, '^3')
                        elseif Config.Log == 'NC' then
                            exports.nc_discordlogs:Discord({
                                webhook = 'UseItem',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. xPlayer.name .. ' ใช้ไอเทม ' .. xItem.label .. ' จำนวน 1```',		-- คำอธิบายรายละเอียด (optional)
                                color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                        end
                else
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = '<strong class="red-text">การกระทำเป็นไปไม่ได้</strong>',
                        type = "error",
                        timeout = 3000,
                        layout = "bottomCenter",
                        queue = "global"
                    })
                end
            end
        end
    end)
    
    RegisterNetEvent('esx:onPickup')
    AddEventHandler('esx:onPickup', function(pickupId)
        local pickup, xPlayer, success = ESX.Pickups[pickupId], ESX.GetPlayerFromId(source)
        local _source = source
        if pickup then
            if pickup.type == 'item_standard' then
                if xPlayer.canCarryItem(pickup.name, pickup.count) then
                    xPlayer.addInventoryItem(pickup.name, pickup.count)
                    success = true
                        if Config.Log == 'AZ' then
                            local sendToDiscord = ''.. xPlayer.name .. ' เก็บ ' .. ESX.GetItemLabel(pickup.name) .. ' จำนวน ' .. ESX.Math.GroupDigits(pickup.count) ..''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'PickupItem', sendToDiscord, xPlayer.source, '^2')
                        elseif Config.Log == 'NC' then
                            exports.nc_discordlogs:Discord({
                                webhook = 'PickupItem',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. xPlayer.name .. ' เก็บ ' .. ESX.GetItemLabel(pickup.name) .. ' จำนวน ' .. ESX.Math.GroupDigits(pickup.count) ..'```',		-- คำอธิบายรายละเอียด (optional)
                                color = 'ff0000',					-- สีของ Embed (optional) เป็น Hex Code | Default: 'ffffff',
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                        end
                else
                    
                    TriggerClientEvent("pNotify:SendNotification", _source, {
                        text = '<center><strong class="red-text">ล้มเหลว</strong> คุณมีที่ว่างไม่เพียงพอในช่องเก็บของคุณ <strong class="amber-text">'..pickup.label..'</strong><center>',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
                end
            elseif pickup.type == 'item_account' then
                success = true
                xPlayer.addAccountMoney(pickup.name, pickup.count)
                    if Config.Log == 'AZ' then
                        local sendToDiscord = ''.. xPlayer.name .. ' เก็บ ' .. Config.Accounts[pickup.name] .. ' จำนวน $' .. ESX.Math.GroupDigits(pickup.count) ..''
                        TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'PickupMoney', sendToDiscord, xPlayer.source, '^2')
                    elseif Config.Log == 'NC' then
                        exports.nc_discordlogs:Discord({
                            webhook = 'PickupMoney',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                            xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                            description = '```'.. xPlayer.name .. ' เก็บ ' .. Config.Accounts[pickup.name] .. ' จำนวน $' .. ESX.Math.GroupDigits(pickup.count) ..'```',		-- คำอธิบายรายละเอียด (optional)
                            screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                        })
                    end
            elseif pickup.type == 'item_weapon' then
                if xPlayer.hasWeapon(pickup.name) then
                    
                    TriggerClientEvent("pNotify:SendNotification", _source, {
                        text = '<strong class="red-text">ล้มเหลว</strong> คุณพกอาวุธเดียวกันอยู่แล้ว',
                        type = "information",
                        timeout = 3000,
                        layout = "centerRight",
                        queue = "global"
                    })
                else
                    success = true
                    xPlayer.addWeapon(pickup.name, pickup.count)
                    xPlayer.setWeaponTint(pickup.name, pickup.tintIndex)
    
                    for k,v in ipairs(pickup.components) do
                        xPlayer.addWeaponComponent(pickup.name, v)
                    end
    
                    if pickup.count > 0 then
                        if Config.Log == 'AZ' then
                            local sendToDiscord = ''.. xPlayer.name .. ' เก็บ ' .. ESX.GetWeaponLabel(pickup.name) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(pickup.count) .. ''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'PickupWeapon', sendToDiscord, xPlayer.source, '^2')
                        elseif Config.Log == 'NC' then
                            exports.nc_discordlogs:Discord({
                                webhook = 'PickupWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. xPlayer.name .. ' เก็บ ' .. ESX.GetWeaponLabel(pickup.name) .. ' และ กระสุน จำนวน ' .. ESX.Math.GroupDigits(pickup.count) .. '```',		-- คำอธิบายรายละเอียด (optional)
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                        end
                    else
                        if Config.Log == 'AZ' then
                            local sendToDiscord = ''.. xPlayer.name .. ' เก็บ ' .. ESX.GetWeaponLabel(pickup.name) .. ''
                            TriggerEvent('azael_dc-serverlogs:sendToDiscord', 'PickupWeapon', sendToDiscord, xPlayer.source, '^2') 
                        elseif Config.Log == 'NC' then
                            exports.nc_discordlogs:Discord({
                                webhook = 'PickupWeapon',			-- ใส่ชื่อ webhook ที่ต้องการใน Config.Webhooks
                                xPlayer = xPlayer,					-- ในฝั่ง Server ต้องใส่ xPlayer ทุกครั้ง (ตัวอย่างการประกาศค่า xPlayer: local xPlayer = ESX.GetPlayerFromId(playerId))
                                description = '```'.. xPlayer.name .. ' เก็บ ' .. ESX.GetWeaponLabel(pickup.name) .. '```',		-- คำอธิบายรายละเอียด (optional)
                                screenshot = false					-- แสดง Screenshot ของผู้เล่น (สามารถใช้ได้แค่ฝั่ง Client เท่านั้น และต้องการ Resource: screenshot-basic)
                            })
                        end
                    end
                end
            end
    
            if success then
                ESX.Pickups[pickupId] = nil
                TriggerClientEvent('esx:removePickup', -1, pickupId)
            end
        end
    end)
end

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    cb({
        identifier = xPlayer.identifier,
        accounts = xPlayer.getAccounts(),
        inventory = xPlayer.getInventory(),
        job = xPlayer.getJob(),
        loadout = xPlayer.getLoadout(),
        money = xPlayer.getMoney()
    })
end)

ESX.RegisterServerCallback('esx:isUserAdmin', function(source, cb)
    cb(Core.IsPlayerAdmin(source))
end)

ESX.RegisterServerCallback('esx:getOtherPlayerData', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)

    cb({
        identifier = xPlayer.identifier,
        accounts = xPlayer.getAccounts(),
        inventory = xPlayer.getInventory(),
        job = xPlayer.getJob(),
        loadout = xPlayer.getLoadout(),
        money = xPlayer.getMoney()
    })
end)

ESX.RegisterServerCallback('esx:getPlayerNames', function(source, cb, players)
    players[source] = nil

    for playerId, v in pairs(players) do
        local xPlayer = ESX.GetPlayerFromId(playerId)

        if xPlayer then
            players[playerId] = xPlayer.getName()
        else
            players[playerId] = nil
        end
    end

    cb(players)
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        CreateThread(function()
            Wait(50000)
            Core.SavePlayers()
        end)
    end
end)

RegisterNetEvent('esx:setDuty')
AddEventHandler('esx:setDuty', function(bool)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.onDuty == bool then
        return
    end

    if bool then
        xPlayer.setDuty(true)
        xPlayer.triggerEvent('esx:showNotification', _U('started_duty'))
    else
        xPlayer.setDuty(false)
        xPlayer.triggerEvent('esx:showNotification', _U('stopped_duty'))
    end
    TriggerClientEvent('esx:setJob', xPlayer.source, xPlayer.job)
end)
