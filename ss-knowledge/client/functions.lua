GetKnowledgeBranch = function(currentBranch, branch)
    local level = 0
    print("Current branch: "..currentBranch)
    print("Branch: "..branch)
    print(json.encode(Config.Branches[branch].customLevels))
    print(json.encode(Config.DefaultLevels))
    if  Config.Branches[branch] == nil then
        print("[^4Sky's Scripts^0] ^1Branch is missing from config's branch list. Missing branch: ^0[^3"..tostring(branch).."^0]")
    end
    print(json.encode(Config.Branches[branch].customLevels))
    print(json.encode(Config.DefaultLevels))
    local levels =  Config.Branches[branch].customLevels or Config.DefaultLevels
    local levelLimits = levels[1]
    for _, branchData in ipairs(levels) do
        if currentBranch > branchData.minxp and currentBranch <= branchData.maxxp then
            if branchData.title then
                return branchData.title, branchData
            end
            return level, branchData
        end
        if currentBranch > branchData.maxxp then
            level = level+1
            levelLimits = branchData
        end
    end
    if #levels == level then
        level = #levels
    end
    if levelLimits.title then
        return levelLimits.title, levelLimits
    end
    return level, levelLimits
end
exports('GetKnowledgeBranch', GetKnowledgeBranch)

GetCurrentKnowledgeBranch = function(branch)
    if  Config.Branches[branch] then
        if CurrentBranches[branch] then
            return GetKnowledgeBranch(CurrentBranches[branch],branch)
        else
            print("[^4Sky's Scripts^0] ^1User missing branch from config's branch list. Missing branch: ^0[^3"..tostring(branch).."^0]")
        end
    else
        print("[^4Sky's Scripts^0] ^1User has no level on a branch not found in config. Missing branch: ^0[^3"..tostring(branch).."^0]")
        return 0
    end
end
exports('GetCurrentKnowledgeBranch', GetCurrentKnowledgeBranch)

FetchKnowledgeBranch = function()
    SS_Core.TriggerCallback("ss-knowledge:server:fetchBranches", function(data)
        TriggerEvent('ss-knowledge:client:debug','Knowledge Branches:'..json.encode(data, {indent=true}))
		CurrentBranches = data
    end)
end 
exports('FetchKnowledgeBranch', FetchKnowledgeBranch)

UpdateKnowledgeBranch = function(branch, amount, LoseBranchKnowledge)
    if not CurrentBranches[branch] then
        print("[^4Sky's Scripts^0]"..Lang['branch_doesnt_exist']:format(branch))
        return
    end
    local BranchXP = CurrentBranches[branch]
    if BranchXP + tonumber(amount) < 0 then
        CurrentBranches[branch] = 0
    elseif Config.Branches[branch].customLevels ~= {} or nil then
        if BranchXP + tonumber(amount) > Config.Branches[branch].customLevels[#Config.Branches[branch].customLevels] then
            if Config.Notification.enable then
                SS_Core.Notification({title = Lang["notification_max_knowledge_title"], message = Lang["notification_max_knowledge_message"]:format(branch)})
            end
        end
    elseif BranchXP + tonumber(amount) > Config.DefaultLevels[#Config.DefaultLevels].maxxp then
        if Config.Notification.enable then
            SS_Core.Notification({title = Lang["notification_max_knowledge_title"], message = Lang["notification_max_knowledge_message"]:format(branch)})
        end
    else
        CurrentBranches[branch] = BranchXP + tonumber(amount)
    end
    if Config.Notification.enable and tonumber(amount) > 0 then
        local title = Lang["notification_add_knowledge_title"]
        local message = Lang["notification_add_knowledge_to_branch"]:format(amount, branch)
        SS_Core.Notification({title = title, message = message})
    elseif Config.Notification.enable and tonumber(amount) < 0 and BranchXP ~= 0 and (LoseBranchKnowledge == nil or LoseBranchKnowledge == false) then
        local title = Lang["notification_remove_knowledge_title"]
        local message = Lang["notification_remove_knowledge_to_branch"]:format(amount, branch)
        SS_Core.Notification({title = title, message = message})
    elseif Config.Notification.enable and tonumber(amount) < 0 and BranchXP ~= 0 and LoseBranchKnowledge then
        local title = Lang["notification_remove_knowledge_title"]
        local message = Lang["notification_remove_knowledge_from_all_branches"]:format(amount, branch)
        SS_Core.Notification({title = title, message = message})
    end
	TriggerServerEvent("ss-knowledge:server:updateBranches", json.encode(CurrentBranches))
end
exports('UpdateKnowledgeBranch', UpdateKnowledgeBranch)

CheckKnowledgeBranch = function(skill, value)
    if CurrentBranches[skill] then
        if CurrentBranches[skill] >= tonumber(value) then
            return true
        else
            return false
        end
    else
        print(Lang['branch_doesnt_exist']:format(skill))
        return false
    end
end
exports('CheckKnowledgeBranch', CheckKnowledgeBranch)

-- mz/ b1 skill system bridge maybe cw too?
GetCurrentSkill = function(skill)
    return { Current = GetCurrentKnowledgeBranch(skill) }
end

UpdateSkill = function(skill, amount)
    return UpdateKnowledgeBranch(skill, amount)
end

CheckSkill = function(skill, value, cb)
    return cb(CheckKnowledgeBranch(skill, value))
end

local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_mz-skills_%s'):format(exportName) or ('__cfx_export_b1-skill_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler('GetCurrentSkill', function(skill)
    return { Current = GetCurrentKnowledgeBranch(skill) }
end)

exportHandler('UpdateSkill', function(skill, amount)
    UpdateKnowledgeBranch(skill, amount)
end)

exportHandler('CheckSkill', function(skill, value, cb)
    return cb(CheckKnowledgeBranch(skill, value))
end)

RegisterNetEvent('ss-knowledge:client:debug', function(message)
	if Config.Debug then
		print(message)
	end
end)

RegisterNetEvent(Config.Triggers[Framework].load, function()
    Wait(2000)
    if Config.Debug then print(Lang['loading_player_skills']) end
    FetchKnowledgeBranch()
end)

