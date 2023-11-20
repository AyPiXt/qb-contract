QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateCallback('qb-contract:getclosestplayername', function(source, cb, closestid)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local closestPlayer = QBCore.Functions.GetPlayer(closestid)

    local xName = xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname
    local closestName = closestPlayer.PlayerData.charinfo.firstname .. ' ' .. closestPlayer.PlayerData.charinfo.lastname

    cb(xName, closestName)
end)


QBCore.Functions.CreateUseableItem('carcontract', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('qb-contract:useitem', source)
    end
end)


RegisterNetEvent('qb-contract:writecontact', function(closestplayer, plate)
    local src = source
    local target = closestplayer
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local closestPlayer = QBCore.Functions.GetPlayer(target)

    local xCitizen = xPlayer.PlayerData.citizenid
    local tCitizen = closestPlayer.PlayerData.citizenid
    local tidentifier = closestPlayer.PlayerData.license

    TriggerClientEvent('qb-contract:showAnim', src)
    Wait(11000)
    TriggerClientEvent('qb-contract:showAnim', target)
    Wait(11000)

    MySQL.Async.fetchAll("SELECT * FROM player_vehicles WHERE plate = @plate AND citizenid = @citizen", {
        ["@plate"] = plate,
        ["@citizen"] = xCitizen
    }, function(result)
        if result[1] ~= nil then
            if xPlayer.Functions.RemoveItem(itemname, 1) then
            MySQL.Sync.execute('UPDATE `player_vehicles` SET license = @license, citizenid = @citizenid WHERE plate = @plate',
                {
                    ['@license'] = tidentifier,
                    ['@citizenid'] = tCitizen,
                    ['@plate'] = plate,
                })
                TriggerClientEvent("QBCore:Notify", src, "The vehicle with the license plate " .. plate .. " has been transferred to " .. closestName .. "!", "success")
                TriggerClientEvent("QBCore:Notify", target, "The vehicle with the license plate " .. plate .. " has been transferred to you by " .. xName .. "!", "success")
                TriggerClientEvent("vehiclekeys:client:SetOwner", target, plate)
            else
                TriggerClientEvent("QBCore:Notify", src, "Error removing the contract item.", "error")
            end
        else
            TriggerClientEvent("QBCore:Notify", src, "Error updating vehicle data.", "error")
        end
    end)
end)
