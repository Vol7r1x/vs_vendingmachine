RegisterServerEvent('buyItem')
AddEventHandler('buyItem', function(item, itemPrice, itemName)

    local player = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local PlayerMoney = xPlayer.getMoney()
    
    
    
    if PlayerMoney >= itemPrice then
        if xPlayer.canCarryItem(item, 1) then
            xPlayer.removeMoney(itemPrice)
            xPlayer.addInventoryItem(item, 1)
            xPlayer.showNotification('You bought a '..itemName)
        else
            xPlayer.showNotification('You dont have enough space in your inventory!')
        end 
    else
        xPlayer.showNotification('You dont have enough money!')
    end
    

end)