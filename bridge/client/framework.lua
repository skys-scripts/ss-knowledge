ESX = nil
QBCore = nil

if Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

local resourceName = GetCurrentResourceName()

local currentLine = "BRDG>CLNT>FRAME #"

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
        SS_Log("debug","^4SpawnVehicle "..tostring(model), resourceName, true, currentLine.."42")
	end,

    DeleteVehicle = function(vehicle)
        if Framework == 'ESX' then
            ESX.Game.DeleteVehicle(vehicle)
        elseif Framework == 'QB' then
            QBCore.Functions.DeleteVehicle(vehicle)
        end
        SS_Log("debug","^4DeleteVehicle "..tostring(vehicle), resourceName, true, currentLine.."42")
    end,

    TriggerCallback = function(name, cb, ...)
        SS_Log("debug","^4TriggerCallback ^0[^3"..name.."^0]", resourceName, true, currentLine.."53")
        if Framework == 'ESX' then
            ESX.TriggerServerCallback(name, cb, ...)
        elseif Framework == 'QB' then
            QBCore.Functions.TriggerCallback(name, cb, ...)
        end
        SS_Log("debug","^4TriggerCallback Finished ^0[^3"..name.."^0]", resourceName, true, currentLine.."59")
    end,

    SetPlayerJob = function()
        local table = {}
        while not SS_Core.PlayerData.job do
            Wait(200)
        end
        if Framework == 'ESX' then
            table.name = SS_Core.PlayerData.job.name
            table.label = SS_Core.PlayerData.job.label
            table.grade = SS_Core.PlayerData.job.grade
            table.gradeLabel = SS_Core.PlayerData.job.grade_label
            table.onDuty  = "N/A"
            --table.isPolice = Config.PoliceJobs[SS_Core.PlayerData.job.name] or false
        elseif Framework == 'QB' then
            table.name  = SS_Core.PlayerData.job.name
            table.label = SS_Core.PlayerData.job.label
            table.grade  = SS_Core.PlayerData.job.grade.level
            table.rank  = SS_Core.PlayerData.job.grade.name
            table.onDuty  = SS_Core.PlayerData.job.onduty or false
            --table.isPolice = Config.PoliceJobs[SS_Core.PlayerData.job.name] or false
        end
        --TriggerEvent('ss-bridge:onJobUpdate', SS_Core.PlayerJob)
        SS_Log("debug","^4Your Job: [^0"..table.label.."^4] Title: [^0"..table.name.."^4] Duty: [^0"..tostring(table.onDuty).."^4] Grade: [^0"..table.grade.."^4]^0", resourceName, true, currentLine.."83")
        SS_Core.PlayerJob = table
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
        if Config.Notification.enable then
            if Config.Notification.notifytype == 'qb' or Config.Notification.notifytype == 'esx' then
                if ESX ~= nil then
                    ESX.ShowNotification(data.message, false, true, nil)
                elseif QBCore ~= nil then
                    QBCore.Functions.Notify(data.message)
                end
            elseif Config.Notification.notifytype == 'ox' then
                SS_Utils.Notification(data)
            elseif Config.Notification.notifytype == 'okok' then
                SS_Utils.Notification(data)
            end
        end
    end,
}

RegisterNetEvent(Config.Triggers[Framework].job)
AddEventHandler(Config.Triggers[Framework].job, function(job)
    SS_Core.PlayerData.job = job
    SS_Core.SetPlayerJob()
end)