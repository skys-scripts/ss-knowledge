FetchDBBranches = function(source)
    local Player = SS_Core.Player.GetFromId(tonumber(source))
    print(json.encode(Player))
    TriggerEvent("ss-knowledge:server:debug","^4Collecting branch info for player id: ^0[^3"..source.."^0]")
    if Player ~= nil then
        local id = SS_Core.Player.GetIdentifier(source)
        print("id: "..id)
        local branches = MySQL.scalar.await('SELECT skills FROM '..Config.Triggers[Framework].playerdatabase..' WHERE '..Config.Triggers[Framework].playerid..' = ?', {id})
        print(json.encode(branches))
        if branches ~= nil then
            if string.len(branches) > 3 then
                return SortBranches(json.decode(branches))
            end
        else
            branches = SetupBranches()
            UpdateDBBranches(source, json.encode(branches))
            return SortBranches(json.decode(branches))
        end
    end
end

SortBranches = function(data)
    local sortedBranches = {}
    if data ~= nil then
        for branch, value in pairs(data) do
            local str = string.lower(branch)
            str = str:gsub("%s+", "")
            TriggerEvent('ss-knowledge:server:debug',"^4SortBranch's current branch name:^0^3 "..str)
            if Config.Branches[str] ~= nil then
                if Config.Branches[str].enable then
                    local xp = value or value.Current
                    TriggerEvent('ss-knowledge:server:debug',"^4SortBranch's value:^0^3 "..json.encode(xp))
                    sortedBranches[str] = xp
                end
            else
                TriggerEvent('ss-knowledge:server:debug',"Removing branch: " .. branch)
            end
        end
        for branch, data in pairs(Config.Branches) do
            if sortedBranches[branch] == nil and Config.Branches[branch].enable then
                sortedBranches[branch] = 0
            end
        end
    end
    return sortedBranches
end

SetupBranches = function()
    local sortedBranches = {}
	for branch, data in pairs(Config.Branches) do
		sortedBranches[branch] = 0
	end
    TriggerEvent('ss-knowledge:server:debug',"^4sortedBranches table in SetupBranches:^0^3 "..json.encode(sortedBranches))
	return sortedBranches
end


AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		SS_Utils.VersionCheck("ss-knowledge","skys-scripts/ss-knowledge",false)
	end
end)

UpdateDBBranches = function(source,data,otherID)
    local PID = nil
    if otherID == nil then
        PID = SS_Core.Player.GetIdentifier(source)
    elseif type(otherID) == "number" then -- This is used to check the type of variable "otherID" is
        PID = SS_Core.Player.GetIdentifier(otherID)
    end
    MySQL.query('UPDATE '..Config.Triggers[Framework].playerdatabase..' SET skills = @branches WHERE '..Config.Triggers[Framework].playerid..' = @id', { --It is set to a branch column to not cause conflictions with mz/ b1/ cw xp branch systems.
        ['@branches'] = data,
        ['@id'] = PID
    })
end

RegisterNetEvent("ss-knowledge:server:debug", function(message)
    if Config.Debug then
        print(message)
    end
end)

RegisterServerEvent('ss-knowledge:server:updateBranches', function (data, otherID)
    if otherID == nil then
        UpdateDBBranches(source, tostring(data))
    else
        UpdateDBBranches(source, tostring(data), tonumber(otherID))
        TriggerClientEvent("ss-knowledge:client:updateBranchesCommand", otherID)
    end
end)

RegisterServerEvent("ss-knowledge:server:lb-phone:sendMail", function(data)
    local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(source) -- phonenumber from source

    local playerMail = exports["lb-phone"]:GetEmailAddress(phoneNumber) -- mail from phonenumber
    -- data: table
    -- data.to: string, the email address to send the mail to, or "all" to send to all players
    -- data.sender: string, the email address of the sender
    -- data.subject: string, the subject of the email
    -- data.message: string, the message of the email
    -- data.attachments: table, the attachments of the email (optional)
    -- data.actions: table, buttons to add to the email (optional)
    -- returns: boolean (true if mail was sent, false if mail was not sent) and string (the id of the mail or the error message)
    local success, id = exports["lb-phone"]:SendMail({
        to = playerMail,
        subject = data.subject,
        message = data.message,
        attachments = {
        },
        actions = {
        }
    })
end)