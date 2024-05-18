ESX = nil
QBCore = nil

if Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

SS_Core = {

    PlayerData = {},
    PlayerJob = {},

    FrameworkReady = function()
        if Framework == 'ESX' then
            while not ESX do Wait(500); end 
            while ESX.GetPlayerData().job == nil do
                Wait(500)
            end
            SS_Core.PlayerData = SS_Core.GetPlayerData()
            return true
        elseif Framework == 'QB' then
            while not QBCore do Wait(500); end
            while not QBCore.Functions.GetPlayerData().job do Wait(500); end
            SS_Core.PlayerData = SS_Core.GetPlayerData()
            return true
        end
        return true
    end,

    SpawnVehicle = function(model, coords, heading, cb, networked)
        if Framework == 'ESX' then
            ESX.Game.SpawnVehicle(model, coords, heading, cb, networked)
        elseif Framework == 'QB' then
            QBCore.Functions.SpawnVehicle(model, cb, coords, networked)
        end
	end,

    DeleteVehicle = function(vehicle)
        if Framework == 'ESX' then
            ESX.Game.DeleteVehicle(vehicle)
        elseif Framework == 'QB' then
            QBCore.Functions.DeleteVehicle(vehicle)
        end
    end,

    TriggerCallback = function(name, cb)
        if Framework == 'ESX' then
            TriggerEvent('ss-busjob:client:debug',"ESX TriggerCallback - Client")
            ESX.TriggerServerCallback(name, cb)
            TriggerEvent('ss-busjob:client:debug',"ESX TriggerCallback Finished - Client")
        elseif Framework == 'QB' then
            TriggerEvent('ss-busjob:client:debug',"QB TriggerCallback - Client")
            QBCore.Functions.TriggerCallback(name, cb)
            TriggerEvent('ss-busjob:client:debug',"QB TriggerCallback Finished - Client")
        end
    end,

    GetPlayerData = function()
        if Framework == 'ESX' then
            SS_Core.PlayerData = ESX.GetPlayerData()
            SS_Core.SetPlayerJob()
            return ESX.GetPlayerData()
        elseif Framework == 'QB' then
            SS_Core.PlayerData = QBCore.Functions.GetPlayerData()
            SS_Core.SetPlayerJob()
            return QBCore.Functions.GetPlayerData()
        end
    end,

    GetJob = function()
        return SS_Core.PlayerJob
    end,

    Notification = function(data)
        if Config.Notification.enable and (Config.Notification.notifytype == 'qb' or Config.Notification.notifytype == 'esx') then
            if ESX ~= nil then
                ESX.ShowNotification(data.message, false, true, nil)
            elseif QBCore ~= nil then
                QBCore.Functions.Notify(data.message)
            end
        elseif Config.Notification.enable and Config.Notification.notifytype == 'ox' then
            SS_Utils.Notification(data)
        elseif Config.Notification.enable and Config.Notification.notifytype == 'okok' then
            SS_Utils.Notification(data)
        end
    end,
}

RegisterNetEvent(Config.Triggers[Framework].job)
AddEventHandler(Config.Triggers[Framework].job, function(job)
    SS_Core.PlayerData.job = job
    SS_Core.SetPlayerJob()
end)