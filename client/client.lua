local vendingMachineProps = { --Vending machine objects you want to use
    'prop_vend_snak_01_tu',
    'prop_vend_snak_01',
    'prop_vend_water_01',
    'prop_vend_coffe_01',
    'prop_vend_fridge01',
    'prop_vend_soda_02',
    'prop_vend_soda_01',
}

Citizen.CreateThread(function()
    Citizen.Wait(100) 
    while true do
        local sleep = 1000 

 
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for i = 1, #vendingMachineProps do
            local vendingMachine = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(vendingMachineProps[i]), false, false, false)
            if DoesEntityExist(vendingMachine) then
                sleep = 5 

                ESX.ShowHelpNotification('Press [E] to buy')
                
                if IsControlJustReleased(0, 38) then -- 'E' Key
                    OpenVendingMachineMenu()
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)


function OpenVendingMachineMenu()
    ESX.UI.Menu.CloseAll() 
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'vending_machine_menu',
        {
            title    = 'Vending Machine',
            align    = 'bottom-right',
            elements = {
                {label = 'Water ($15)', value = 'water', price = 15}, 
                {label = 'eCola ($25)', value = 'cola', price = 25}, 
                -- Weitere Artikel hinzufügen...
            }
        },
        function(data, menu)
            local item = data.current.value
            local itemPrice = data.current.price 
            local itemName = data.current.label
            TriggerServerEvent('buyItem', item, itemPrice, itemName) 
            menu.close() 
        end,
        function(data, menu)
            menu.close() 
        end
    )
end
