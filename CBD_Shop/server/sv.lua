RegisterNetEvent("argentDouce")
AddEventHandler ("argentDouce", function(name, price, count)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local money = exports.ox_inventory:GetItemCount(source, 'money')
    if money >= price then  
    exports.ox_inventory:RemoveItem(source, 'money', price)
    xPlayer.addInventoryItem(name, count)
    else 
        TriggerClientEvent("ox_lib:notify", _src, {
            title = "CBD Shop",
            description = "Vous n'avez pas asser d'argent",
            type = "error"
        })
    end
end)