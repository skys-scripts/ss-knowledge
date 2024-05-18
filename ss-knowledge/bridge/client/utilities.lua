if Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

SS_Utils = {

    Notification = function(data)
		if Config.UseFrameworkNotification then
			SS_Core.Notification(data.message)
		else
			lib.notify({
				title = data.title,
				description = data.message,
				type = data.type,
				position = 'top-right',
			})
		end
	end,

}

RegisterNetEvent('ss-busjob:bridge:utilities:notification', function(msg)
    SS_Utils.Notification(msg)
end)