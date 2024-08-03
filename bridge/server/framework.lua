ESX = nil
QBCore = nil

if Framework == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

SS_Core = {

    Notification = function(src, data)
        if Config.Notification.enable then
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

    GetIdentifier = function(src)
        local Player = SS_Core.Player.GetFromId(tonumber(src))
        if Framework == 'ESX' then
            return Player.identifier
        elseif Framework == 'QB' then
            return Player.PlayerData.citizenid
        end
    end,

    GetCitizenName = function(src)
        local Player = SS_Core.Player.GetFromId(tonumber(src))
        if Framework == 'ESX' then
            return Player.name
        elseif Framework == 'QB' then
            return Player.PlayerData.charinfo.firstname.. " "..Player.PlayerData.charinfo.lastname
        end
    end,
    IsAdmin = function(src)
        local permissions = Config.AdminOptions.ranks
        TriggerEvent("ss-knowledge:server:debug", "^4Admin ranks able to use commands^0: ^3"..json.encode(permissions).."^0")
        for k,v in pairs(permissions) do
            if IsPlayerAceAllowed(src, v) then
                TriggerEvent("ss-knowledge:server:debug", "^4Admin Permission Granted To Player ^0[^3"..src.."^0] ^4Permission Level:^0 [^3"..v.."^0]")
                return true
            end
        end
        return false
    end,
}

SS_Core.RegisterCallback("ss-knowledge:server:fetchBranches", function(source, cb, otherID)
    local branches = {}
    if otherID == nil then
        branches = FetchDBBranches(source)
    else
        branches = FetchDBBranches(otherID)
    end
    TriggerEvent("ss-knowledge:server:debug", "^4Fetch Branches: ^3"..json.encode(branches, {indent = true}).."^0")
    cb(branches)
end)

SS_Core.RegisterCallback("ss-knowledge:server:CheckAdminCommands", function(source, cb)
    cb(SS_Core.Player.IsAdmin(source))
end)

SS_Core.RegisterCallback("ss-knowledge:server:getPlayerName", function(source, cb, oID)
    local name = nil
    if oID == nil then
        name = SS_Core.Player.GetCitizenName(source)
    else
        name = SS_Core.Player.GetCitizenName(oID)
    end
    cb(tostring(name.." ["..(oID or source).."]"))
end)