ESX = nil
QBCore = nil

if Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

SS_Core = {

    Notification = function(src, data)
        if Config.UseFrameworkNotification then
            if Framework == 'ESX' then
                TriggerClientEvent('esx:showNotification', src, data.message)
            elseif Framework == 'QB' then
                TriggerClientEvent('QBCore:Notify', src, data.message)
            end
        else
            TriggerClientEvent('ss-knowledge:bridge:utilities:notification', src, data)
        end
    end,

    RegisterCallback = function(name, cb)
        TriggerEvent('ss-knowledge:server:debug',"^4Server Side - RegisterCallback ^0[^3"..name.."^0]")
        if Framework == 'ESX' then 
            ESX.RegisterServerCallback(name, cb)
        elseif Framework == 'QB' then
            QBCore.Functions.CreateCallback(name, cb)
        end
    end,
}

SS_Core.Player = {

    GetSource = function(src)
        local xPlayer = SS_Core.Player.GetFromId(tonumber(src))
        while xPlayer == nil do
            Wait(500)
            xPlayer = SS_Core.Player.GetFromId(tonumber(src))
        end
        if Framework == 'ESX' then 
            return xPlayer.source
        elseif Framework == 'QB' then
            return xPlayer.PlayerData.source
        end
    end,

    GetFromId = function(src)
        if Framework == 'ESX' then 
            return ESX.GetPlayerFromId(src)
        elseif Framework == 'QB' then
            return QBCore.Functions.GetPlayer(src)
        end
    end,
}

SS_Core.RegisterCallback("ss-knowledge:server:fetchBranches", function(source, cb)
    local branches = FetchDBBranches(source) 
    TriggerEvent("ss-knowledge:server:debug", json.encode(branches))
    cb(branches)
end)