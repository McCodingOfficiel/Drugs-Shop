Citizen.CreateThread(function()

    exports.ox_target:addBoxZone({
        coords = vector4(-494.1786, 36.00018, 43.74425, 86.06236),
        options = {
            {
                label = 'Ouvrir le Weed Shop',
                icon = 'fa-solid fa-cannabis',
                onSelect = function()
                    lib.showContext('cbd')
                end
            }
        }
    })
end)

lib.registerContext({
    id = 'cbd',
    title = 'WeedShop',
    options = {
        {
            title = "Acheter de la drogue douce",
            description = "Vous permet d'acheter de la drogue douce !",
            icon = 'fa-solid fa-angle-right',
            iconColor = '#0097FF',
            onSelect = function()
                OpenDouce()
            end
        },
        {
            title = ""
        },
        {
            title = "Acheter de la drogue dure",
            description = "Vous permet d'acheter de la drogue dur !",
            icon = 'fa-solid fa-angle-right',
            iconColor = '#0097FF',
            onSelect = function()
                OpenDur()
            end
        }
    }
})

function OpenDouce()

    local option = {}
    for k, v in pairs(Config.douce) do
        table.insert (option, {
            title = v.label,
            description = v.description .."  \n Prix : " ..v.price,
            icon = 'fa-solid fa-angle-right',
            iconColor = '#FFE400',
            onSelect = function()
                TriggerServerEvent("argentDouce", v.name, v.price, v.count)
            end
        })
    end
    lib.registerContext({
        id = "Douce",
        title = "Choix de la drogue douce",
        options = option
    })
    lib.showContext('Douce')
end

function OpenDur()

    local option = {}
    for k, v in pairs(Config.dur) do
        table.insert (option, {
            title = v.label,
            description = v.description .."  \n Prix : " ..v.price,
            icon = 'fa-solid fa-angle-right',
            iconColor = '#FFE400',
            onSelect = function()
                TriggerServerEvent("argentDouce", v.name, v.price, v.count)
            end
        })
    end
    lib.registerContext({
        id = "Dur",
        title = "Choix de la drogue douce",
        options = option
    })
    lib.showContext('Dur')
end

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_business_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_business_02", -494.1786, 36.00018, 43.74425, 86.06236, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

local pos = vector3(-495.5104, 35.95241, 44.7442)
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(pos)

	SetBlipSprite (blip, 496)
	SetBlipScale  (blip, 1.3)
	SetBlipColour (blip, 2)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('CBD Shop')
	EndTextCommandSetBlipName(blip)
end)