ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)


RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
        TriggerEvent('chat:addMessage', {
            template = '<font color="ffffff">💭 {0}:</font> <font color="ffffff">{1}</font></div>',
            args = { name, message }
        })
    end
end)



--------------------- TWEET ---------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('nafing_chat:twt')
AddEventHandler('nafing_chat:twt', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
            TriggerEvent('chat:addMessage', {
            template = '<font color="#0468d4">🕊️^5{0}:</font> <font color="white">{1}</font></div>',
            args = { name, message }
        })
end)

RegisterNetEvent('nafing_chat:tweet')
AddEventHandler('nafing_chat:tweet', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
            TriggerEvent('chat:addMessage', {
            template = '<font color="#0468d4">🕊️^5{0}:</font> <font color="white">{1}</font></div>',
            args = { name, message }
        })
end)
-----------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------- NEWS --------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('nafing_chat:news')
AddEventHandler('nafing_chat:news', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
            TriggerEvent('chat:addMessage', {
            template = '<font color="#ed6f0e">&ensp;📱{0}:</font> <font color="white">{1}</font></div>',
            args = { name, message }
        })
end)
-----------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------- DARKWEB -----------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('nafing_chat:darkweb')
AddEventHandler('nafing_chat:darkweb', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
            TriggerEvent('chat:addMessage', {
            template = '<font color="#5c0505">💻 </font> <font color="white">{1}</font></div>',
            args = { name, message }
        })
end)

RegisterNetEvent('nafing_chat:dw')
AddEventHandler('nafing_chat:dw', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
            TriggerEvent('chat:addMessage', {
            template = '<font color="#5c0505">💻 </font> <font color="white">{1}</font></div>',
            args = { name, message }
        })
end)
-----------------------------------------------------------------------------------------------------------------------------------------------------------


RegisterCommand('do', function(source, args)
    local text = ''
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ''
    TriggerServerEvent('3ddo:shareDisplay', text)
end)

local chatMessage = true
local dropShadow = true



function DisplayDO(mePlayer, text, offset, name)
    local displaying = true

    if chatMessage then
        local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
        local coords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist2(coordsMe, coords)
		local source = PlayerId()
	    local target = GetPlayerFromServerId(id)
		local id = GetPlayerServerId(id)

		
        if target == source then
            TriggerEvent('chat:addMessage', {
                template = '<b><font color="#ab51c4">Citizen[{0}] </font></b><b><font color="#ab51c4">{1}</font></b></div>',
                args = { id, text }
            })
        elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(source)), GetEntityCoords(GetPlayerPed(target)), true) < 19 then
            TriggerEvent('chat:addMessage', {
                template = '<b><font color="#ab51c4">Citizen[{0}] </font></b><b><font color="#ab51c4">{1}</font></b></div>',
                args = { id, text }
            })
            end
        end

    Citizen.CreateThread(function()
        Wait(2000)
        displaying = false
    end)
    Citizen.CreateThread(function()
        test = 1 + 1
        print(1)
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 2500 then
                DrawText3DDO(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset, text)
            end
        end
        test = 1 - 1
    end)
end

RegisterNetEvent('3ddo:triggerDisplay')
AddEventHandler('3ddo:triggerDisplay', function(text, source)
    local offset = 1 + (1*0.11)
    DisplayDO(GetPlayerFromServerId(source), text, offset)
end)


function DrawText3DDO(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100

    if onScreen then

        -- Formalize the text
        SetTextColour(171, 81, 196, 255)
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(20, 100, 200, 200, 155)
        end

        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55*scale, 0)
        local width = EndTextCommandGetWidth(0)

        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
        DrawRect(_x, _y+scale/45, width, height, 171, 81, 196 , 80)
    end
end

--------------------------------------------------

RegisterCommand('me', function(source, args)
    local text = '' -- edit here if you want to change the language : EN: the person / FR: la personne
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ''
    TriggerServerEvent('3dme:shareDisplay', text)
end)

local chatMessage = true
local dropShadow = true

function DisplayME(mePlayer, text, offset, name)
    local displaying = true

    -- Chat message
    if chatMessage then
        local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
        local coords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist2(coordsMe, coords)
		local source = PlayerId()
	    local target = GetPlayerFromServerId(id)
		local id = GetPlayerServerId(id)

		
        if target == source then
            TriggerEvent('chat:addMessage', {
                template = '<b><font color="#e3aacc">Citizen[{0}] </font></b><b><font color="#e3aacc">{1}</font></b></div>',
                args = { id, text }
            })
        elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(source)), GetEntityCoords(GetPlayerPed(target)), true) < 19 then
            TriggerEvent('chat:addMessage', {
                template = '<b><font color="#e3aacc">Citizen[{0}] </font></b><b><font color="#e3aacc">{1}</font></b></div>',
                args = { id, text }
            })
            end
        end

    Citizen.CreateThread(function()
        Wait(2000)
        displaying = false
    end)
    Citizen.CreateThread(function()
        test = 1 + 1
        print(1)
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 2500 then
                DrawText3DME(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset, text)
            end
        end
        test = 1 - 1
    end)
end

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offset = 1 + (1*0.11)
    DisplayME(GetPlayerFromServerId(source), text, offset)
end)


function DrawText3DME(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100

    if onScreen then

        -- Formalize the text
        SetTextColour(227, 170, 204, 255)
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(20, 100, 200, 200, 155)
        end

        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55*scale, 0)
        local width = EndTextCommandGetWidth(0)

        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
        DrawRect(_x, _y+scale/45, width, height, 227, 170, 204, 80)
    end
end



--------------------- TO 
RegisterNetEvent('PokazNaCzacie')
AddEventHandler('PokazNaCzacie',function (mePlayer, text)
      local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
      local coords = GetEntityCoords(PlayerPedId(), false)
      local dist = Vdist2(coordsMe, coords)
      local source = PlayerId()
      local target = GetPlayerFromServerId(id)
      local id = GetPlayerServerId(id)
              if target == source then
                  TriggerEvent('chat:addMessage', {
                      template = '<b><font color="#e3aacc">Citizen[{0}] </font></b><b><font color="#e3aacc">{1}</font></b></div>',
                      args = { id, text }
                  })
              elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(source)), GetEntityCoords(GetPlayerPed(target)), true) < 19 then
                  TriggerEvent('chat:addMessage', {
                      template = '<b><font color="#e3aacc">Citizen[{0}] </font></b><b><font color="#e3aacc">{1}</font></b></div>',
                      args = { id, text }
                  })
              end
end)


RegisterNetEvent('Chat3d')
AddEventHandler('Chat3d', function(text, source)
    local offset = 1 + (1*0.14)
    Display3DCHAT(GetPlayerFromServerId(source), text, offset)
end)

function Display3DCHAT(mePlayer, text, offset)
    local displaying = true

    -- Chat message
   

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = 1 + 1
        print(1)
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 2500 then
                Draw3DCHAT(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset, text)
            end
        end
        nbrDisplaying = 1 - 1
    end)
end

function Draw3DCHAT(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100

    if onScreen then

        -- Formalize the text
        SetTextColour(227, 170, 204, 255)
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextCentre(true)
        SetTextDropshadow(20, 100, 200, 200, 155)


        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55*scale, 0)
        local width = EndTextCommandGetWidth(0)

        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
        DrawRect(_x, _y+scale/45, width, height, 227, 170, 204, 80)

    end
end
