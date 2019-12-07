ESX                       = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end


AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = GetPlayerName(source)
		TriggerClientEvent("sendProximityMessage", -1, source, name, message)
    end
      CancelEvent()
end)


RegisterServerEvent('furchat:shareDisplay')
	AddEventHandler('furchat:shareDisplay', function(text)
		TriggerClientEvent('furchat:triggerDisplay', -1, text, source)
end)
	

------------ TWEET ------------------------------------------------------------------------------------------------------------------------------------------------
TriggerEvent('es:addCommand', 'twt', function(source, args, user)
    local name = getIdentity(source)
    TriggerClientEvent('nafing_chat:twt', -1, source, " " .. name.firstname .." ".. name.lastname .."", table.concat(args, " "))
end, {help = '/twt'})

TriggerEvent('es:addCommand', 'tweet', function(source, args, user)
    local name = getIdentity(source)
    TriggerClientEvent('nafing_chat:tweet', -1, source, " " .. name.firstname .." ".. name.lastname .."", table.concat(args, " "))
end, {help = '/tweet'})
------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------ NEWS ------------------------------------------------------------------------------------------------------------------------------------------------
TriggerEvent('es:addCommand', 'news', function(source, args, user)
    local name = getIdentity(source)
    TriggerClientEvent('nafing_chat:news', -1, source, " " .. name.firstname .." ".. name.lastname .."", table.concat(args, " "))
end, {help = '/news'})
------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------ DARKWEB ---------------------------------------------------------------------------------------------------------------------------------------------
TriggerEvent('es:addCommand', 'darkweb', function(source, args, user)
    local name = getIdentity(source)
    local amount = 2500

    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeAccountMoney('bank', amount)
    TriggerClientEvent('esx:showNotification', source, '~r~You paid ~g~2500$ ~r~for the message')

    TriggerClientEvent('nafing_chat:darkweb', -1, source, " " .. name.firstname .." ".. name.lastname .."", table.concat(args, " "))
end, {help = '/darkweb'})

TriggerEvent('es:addCommand', 'dw', function(source, args, user)
    local name = getIdentity(source)
    local amount = 2500

    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeAccountMoney('bank', amount)
    TriggerClientEvent('esx:showNotification', source, '~r~You paid ~g~2500$ ~r~for the message')

    TriggerClientEvent('nafing_chat:dw', -1, source, " " .. name.firstname .." ".. name.lastname .."", table.concat(args, " "))
end, {help = '/dw'})
------------------------------------------------------------------------------------------------------------------------------------------------------------------


RegisterServerEvent('3ddo:shareDisplay')
AddEventHandler('3ddo:shareDisplay', function(text)
	TriggerClientEvent('3ddo:triggerDisplay', -1, text, source)
end)

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text)
	TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
end)
