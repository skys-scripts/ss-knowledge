if Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

local resourceName = GetCurrentResourceName()

local currentLine = "BRDG>CLNT>UTIL #"


SS_Utils = {

    Notification = function(data)
		if Config.Notification.notifytype == 'ox' then
			lib.notify({
				title = data.title,
				description = data.message,
				type = data.type,
				position = 'top-right',
			})
		elseif Config.Notification.notifytype == 'okok' then
			exports['okokNotify']:Alert(data.title, data.message, 6000, data.type)
		elseif Config.Notification.notifytype == 't-notify' then
			exports['t-notify']:Custom({title = data.title, style = data.type, message = data.message, sound = true})
		end
	end,

	EmailNotification = function(id,data)
		if Config.Notification.email.type == "qb-phone" then
			TriggerServerEvent("qb-phone:server:sendNewMail", data,id)
		elseif Config.Notification.email.type == "qs-phone" then
			TriggerServerEvent('qs-smartphone:server:sendNewMail', data)
		elseif Config.Notification.email.type == "gks-phone" then
			exports["gksphone"]:SendNewMail(data)
		elseif Config.Notification.email.type == "lb-phone" then
			TriggerServerEvent("ss-knowledge:server:lb-phone:sendMail", data)
		end
	end,

	GetIdentification = function(data)
		SS_Log("debug","^4GetIdentification ^0[^3"..PlayerPedId().."^0]", resourceName, true, currentLine.."59")
		if Framework == "QB" then
			return QBCore.Functions.GetPlayerData().citizenid
		elseif Framework == "ESX" then
			return ESX.PlayerData.identifier
		end
	end
}

RegisterNetEvent('ss-knowledge:bridge:utilities:notification', function(msg)
    SS_Utils.Notification(msg)
end)