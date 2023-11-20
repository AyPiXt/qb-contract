QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('carcontract', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('qb-contract:useitem', source)
    end
end)

RegisterNetEvent('qb-contract:useitem')
AddEventHandler('qb-contract:useitem', function()
    local vehicle, distance = QBCore.Functions.GetClosestVehicle()
    local player, distancep = QBCore.Functions.GetClosestPlayer()

    if vehicle ~= -1 and distance < 3.5 and player ~= -1 and distancep < 3.5 then
        local plate = QBCore.Functions.GetPlate(vehicle)

        
        local ownedVehicle = QBCore.Functions.DoesPlayerOwnVehicle(plate)

        if ownedVehicle then
            local dialog = exports['qb-input']:ShowInput({
                header = "Fahrzeug verkaufen",
                submitText = "Verkaufen",
                inputs = {
                    {
                        type = 'number',
                        name = 'price',
                        text = 'Verkaufspreis',
                        isRequired = true,
                    },
                    {
                        text = 'Spieler ID',
                        name = 'playerid',
                        type = 'number',
                        isRequired = true
                    }
                }
            })

            if dialog.status == "OK" then
                local data = dialog.input
                TriggerServerEvent('qb-contract:writecontact', player, vehicle, data.price, data.playerid)
            end
        else
            QBCore.Functions.Notify('Du besitzt dieses Fahrzeug nicht!', 'error')
        end
    else
        QBCore.Functions.Notify('Es gibt keinen Spieler oder kein Fahrzeug in deiner Nähe!', 'error')
    end
end)

RegisterNetEvent('qb-contract:showAnim')
AddEventHandler('qb-contract:showAnim', function()
    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, true)
    Citizen.Wait(10000)
    ClearPedTasks(PlayerPedId())
end)

