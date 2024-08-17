local resourceName = GetCurrentResourceName()

local currentLine = "CLNT>FUNC #"


GetKnowledgeBranch = function(currentBranch, branch)
    local tier = 0
    SS_Log("debug","^4Branch:^0 [^3"..branch.. "^0] ^4Current xp:^0 [^3"..currentBranch.."^0]", resourceName, true, currentLine.."8")
    if  Config.Branches[branch] == nil then
        SS_Log("warn","^1Branch is missing from config's branch list. Missing branch: ^0[^3"..tostring(branch).."^0]", resourceName, true, currentLine.."10")
    end
    local tiers =  Config.Branches[branch].customLevels or Config.DefaultLevels
    local tierLimits = tiers[1]
    for _, branchData in ipairs(tiers) do
        if currentBranch > branchData.minxp and currentBranch <= branchData.maxxp then
            if branchData.title then
                return branchData.title, branchData
            end
            return tier, branchData
        end
        if currentBranch > branchData.maxxp then
            tier = tier+1
            tierLimits = branchData
        end
    end
    if #tiers == tier then
        tier = #tiers
    end
    if tierLimits.title then
        return tierLimits.title, tierLimits
    end
    return tier, tierLimits
end
exports('GetKnowledgeBranch', GetKnowledgeBranch)

GetBranchTier = function(currentBranch, branch)
    local tier = 1
    local tiers =  Config.Branches[branch].customLevels or Config.DefaultLevels
    for Tier, branchData in ipairs(tiers) do
        if currentBranch >= branchData.minxp and currentBranch < branchData.maxxp then
            return Tier
        end
        if currentBranch > branchData.maxxp then
            tier = tier+1
        end
        if #tiers == tier then
            tier = #tiers
            return tier
        end
    end
end
exports('GetBranchTier', GetBranchTier)

GetCurrentKnowledgeBranch = function(branch)
    if Config.Branches[branch] then
        if CurrentBranches[branch] then
            return GetKnowledgeBranch(CurrentBranches[branch],branch)
        else
            SS_Log("warn","^1User missing branch from config list. Missing branch: ^0[^3"..tostring(branch).."^0]", resourceName, true, currentLine.."59")
        end
    else
        SS_Log("warn","^1User has no level on a branch not found in config. Missing branch: ^0[^3"..tostring(branch).."^0]", resourceName, true, currentLine.."62")
        return 0
    end
end
exports('GetCurrentKnowledgeBranch', GetCurrentKnowledgeBranch)

FetchKnowledgeBranch = function()
    SS_Core.TriggerCallback("ss-knowledge:server:fetchBranches", function(data)
        SS_Log("debug",'^4Knowledge Branches:^0 '..json.encode(data, {indent=true}).."^0", resourceName, true, currentLine.."70")
		CurrentBranches = data
    end)
end

UpdateKnowledgeBranch = function(branch, amount, LoseBranchKnowledge)
    if not CurrentBranches[branch] then
        SS_Log("warn","^4"..Lang['branch_doesnt_exist']:format(branch).."^0", resourceName, true, currentLine.."70")
        return
    end
    local id = SS_Utils.GetIdentification()
    local BranchXP = CurrentBranches[branch]
    local Tier = 0
    if type(BranchXP) == "table" then
        BranchXP = BranchXP.Current
        Tier = GetBranchTier(BranchXP,branch)
    else
        Tier = GetBranchTier(BranchXP,branch)
    end
    local Levels = Config.Branches[branch].customLevels or Config.DefaultLevels
    if BranchXP + tonumber(amount) < 0 then
        CurrentBranches[branch] = 0
    elseif Levels ~= {} or nil then
        if BranchXP + tonumber(amount) > Levels[#Levels].maxxp then
            CurrentBranches[branch] = Levels[#Levels].maxxp
            if Config.Notification.enable then
                SS_Core.Notification({title = Lang["notification_max_knowledge_title"], message = Lang["notification_max_knowledge_message"]:format(branch)})
            end
        else
            CurrentBranches[branch] = CurrentBranches[branch] + amount
        end
    elseif BranchXP + tonumber(amount) > Levels[#Levels].maxxp then
        CurrentBranches[branch] = Levels[#Levels].maxxp
        if Config.Notification.enable then
            SS_Core.Notification({title = Lang["notification_max_knowledge_title"], message = Lang["notification_max_knowledge_message"]:format(branch)})
        end
    else
        CurrentBranches[branch] = CurrentBranches[branch] + amount
    end
    if Config.Branches[branch].messages.enable then
        if tonumber(amount) > 0 then
            for k, v in pairs(Config.Branches[branch].messages.positive) do
                if CurrentBranches[branch] > v.xp and BranchXP < v.xp then
                    if Config.Branches[branch].messages.notifytype == "notification" then
                        SS_Core.Notification({title = v.subject, message = v.message})
                    elseif Config.Branches[branch].messages.notifytype == "email" then
                        SS_Utils.EmailNotification(id,{message = v.message, sender = v.sender, subject = v.subject})
                    end
                end
            end
        elseif tonumber(amount) < 0 then
            for k, v in pairs(Config.Branches[branch].messages.negative) do
                if CurrentBranches[branch] < v.xp and BranchXP > v.xp then
                    if Config.Branches[branch].messages.notifytype == "notification" then
                        SS_Core.Notification({title = v.subject, message = v.message})
                    elseif Config.Branches[branch].messages.notifytype == "email" then
                        SS_Utils.EmailNotification(id,{message = v.message, sender = v.sender, subject = v.subject})
                    end
                end
            end
        elseif tonumber(amount) == 0 then
        end
    end
    if Config.Notification.enable and tonumber(amount) > 0 then
        SS_Core.Notification({title = Lang["notification_add_knowledge_title"], message = Lang["notification_add_knowledge_to_branch"]:format(amount, branch)})
        if Config.Notification.email.enable and (Levels ~= {} or nil) then
            if Levels[tonumber(Tier+1)] ~= nil then
                if CurrentBranches[branch] > Levels[Tier].maxxp and BranchXP < Levels[tonumber(Tier+1)].minxp then
                    SS_Utils.EmailNotification(id,{message = Lang['level_up_email_message']:format(branch, tonumber(Tier+1)), sender = Lang['level_up_email_sender'], subject = Lang['level_up_email_subject']})
                end
            end
        end
    elseif Config.Notification.enable and tonumber(amount) < 0 and BranchXP ~= 0 and LoseBranchKnowledge and Config.LoseBranchKnowledge.notification then
        SS_Core.Notification({title = Lang["notification_remove_knowledge_title"], message = Lang["notification_remove_knowledge_from_all_branches"]:format(amount, branch)})
    elseif Config.Notification.enable and tonumber(amount) < 0 and BranchXP ~= 0 and (LoseBranchKnowledge == false or nil) then
    elseif Config.Notification.enable and tonumber(amount) < 0 and BranchXP ~= 0 then
        SS_Core.Notification({title = Lang["notification_remove_knowledge_title"], message = Lang["notification_remove_knowledge_to_branch"]:format(amount, branch)})
    end
	TriggerServerEvent("ss-knowledge:server:updateBranches", json.encode(CurrentBranches))
end
exports('UpdateKnowledgeBranch', UpdateKnowledgeBranch)

CheckKnowledgeBranch = function(branch, value)
    if CurrentBranches[branch] then
        if CurrentBranches[branch] >= tonumber(value) then
            return true
        else
            return false
        end
    else
        SS_Log("warn","^4"..Lang['branch_doesnt_exist']:format(branch).."^0", resourceName, true, currentLine.."160")
        return false
    end
end
exports('CheckKnowledgeBranch', CheckKnowledgeBranch)

CheckKnowledgeTier = function(branch, value)
    if CurrentBranches[branch] then
        if GetBranchTier(CurrentBranches[branch],branch) >= value then
            return true
        else
            return false
        end
    else
        SS_Log("warn","^4"..Lang['branch_doesnt_exist']:format(branch).."^0", resourceName, true, currentLine.."174")
        return false
    end
end
exports('CheckKnowledgeTier', CheckKnowledgeTier)

GetCurrentSkill = function(skill)
    local branch, branchInfo = GetCurrentKnowledgeBranch(skill)
    if branchInfo ~= nil then
        return {Name = branchInfo.title, Max = branchInfo.maxxp, Min = branchInfo.minxp, Current = tonumber(CurrentBranches[branch])}
    else
        SS_Log("warn","^4GetCurrentSkill is causing errors for branchInfo. Please turn on debug^0", resourceName, true, currentLine.."185", branch, branchInfo)
    end
end
exports('GetCurrentSkill',GetCurrentSkill)

UpdateSkill = function(skill, amount)
    return UpdateKnowledgeBranch(skill, amount)
end
exports('UpdateSkill',UpdateSkill)

CheckSkill = function(skill, value, cb)
    return cb(CheckKnowledgeBranch(skill, value))
end
exports('CheckSkill',CheckSkill)

-- mz skill system bridge maybe b1 skills too?

local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_mz-skills_%s'):format(exportName) or ('__cfx_export_b1-skill_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler('GetCurrentSkill', function(branch)
    local branchName, branchInfo = GetCurrentKnowledgeBranch(string.lower(branch))
    local current = 0 or CurrentBranches[branchName]
    if branchInfo ~= nil then
        return {Name = branchInfo.title, Max = branchInfo.maxxp, Min = branchInfo.minxp, Current = current}
    else
        SS_Log("warn","^4GetCurrentSkill is causing errors for branchInfo^0", resourceName, true, currentLine.."214")
    end
end)

exportHandler('UpdateSkill', function(branch, amount)
    SS_Log("debug","^4UpdateSkill [branch = ^3"..string.lower(branch).."^4amount = ^3"..tonumber(amount).."^0", resourceName, true, currentLine.."219")
    UpdateKnowledgeBranch(string.lower(branch), amount)
end)

exportHandler('CheckSkill', function(branch, value, cb)
    return cb(CheckKnowledgeBranch(string.lower(branch), value))
end)

RegisterNetEvent('ss-knowledge:client:debug', function(message)
	if Config.Debug then
		print(message)
	end
end)

AddEventHandler(Config.Triggers[Framework].load, function()
    Wait(2000)
    SS_Log("debug",Lang['loading_player_branches'], resourceName, true, currentLine.."235")
    FetchKnowledgeBranch()
end)

AddEventHandler('onResourceStart', function (resource)
	if resource == GetCurrentResourceName() then
		FetchKnowledgeBranch()
	end
end)

RegisterNetEvent('ss-knowledge:client:updateBranches', function(skill, amount)
    UpdateKnowledgeBranch(skill, amount)
end)

RegisterNetEvent('ss-knowledge:client:updateBranchesCommand', function()
    FetchKnowledgeBranch()
end)