FetchDBBranches = function(source)
    local Player = SS_Core.Player.GetFromId(source)
    TriggerEvent("ss-knowledge:server:debug","^4Collecting branch info for player id: ^0[^3"..source.."^0]")
    local branches = MySQL.scalar.await('SELECT skills FROM '..Config.Triggers[Framework].playerdatabase..' WHERE citizenid = ?', {Player.PlayerData.citizenid})
    if branches ~= nil then
        return SortBranches(json.decode(branches))
    else
        branches = SetupBranches()
        UpdateDBBranches(source, json.encode(branches))
    end
end

SortBranches = function(data)
    local sortedBranches = {}
	for branch, v in pairs(Config.Branches) do
		if data and data[branch] and type(data[branch]) == 'table' then
			sortedBranches[branch] = sortedBranches[branch].Current or 0
		else
			sortedBranches[branch] = sortedBranches[branch] or 0
		end
	end
    return sortedBranches
end

SetupBranches = function()
    local sortedBranches = {}
	for branch, data in pairs(Config.Branches) do
		sortedBranches[branch] = 0
	end
	return sortedBranches
end

AddEventHandler('onResourceStart', function (resource)
	if resource == GetCurrentResourceName() then
		SS_Utils.VersionCheck("ss-knowledge","skys-scripts/ss-knowledge")
	end
end)

--[[RefreshBranches = function()
    for type, value in pairs(Config.Branches) do
        if Config.Debug then
            print(type .. ": " .. value['Current'])
        elseif Config.Debug and not Config.Branches[type] then
            print("something went wrong")
        end
        if value["Stat"] then
            StatSetInt(value["Stat"], round(value["Current"]), true)
        end
    end
end

CheckBranch = function(branch, val, hasbranch)
    if Config.Branches[branch] then
        if Config.Branches[branch]["Current"] >= tonumber(val) then
            hasbranch(true)
        else
            hasbranch(false)
        end
    else
        print("Branch " .. branch .. " doesn't exist")z
        hasbranch(false)
    end
end]]

RegisterServerEvent('ss-knowledge:server:updateBranches', function (data)
    UpdateDBBranches(source, data)
end)

UpdateDBBranches = function(source,data)
    local Player = SS_Core.Player.GetFromId(source)
    MySQL.query('UPDATE '..Config.Triggers[Framework].playerdatabase..' SET skills = @branches WHERE citizenid = @citizenid', { --It is set to a branch column to not cause conflictions with mz/ b1/ cw xp branch systems.
        ['@branches'] = tostring(data),
        ['@citizenid'] = Player.PlayerData.citizenid or Player.PlayerData.identifier
    })
end

RegisterNetEvent("ss-knowledge:server:debug", function(message)
    if Config.Debug then
        print(message)
    end
end)