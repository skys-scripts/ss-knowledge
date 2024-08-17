local resourceName = GetCurrentResourceName()

local currentLine = "CLNT>COMMS #"

if Config.AdminOptions.enable then
    RegisterNetEvent(Config.Triggers[Framework].load, function()
        SS_Core.TriggerCallback("ss-knowledge:server:CheckAdminCommands", function(results)
            TriggerEvent("ss-knowledge:client:debug", "^4Admin permission results: ^0 ^3"..tostring(results))
            if results then
                GiveAdminCommands()
            end
        end)
    end)
end

if Config.ChatCommand.enable then
    RegisterCommand(Config.ChatCommand.commandname, function()
        CreateKnowledgeBranchList()
    end, false)
    TriggerEvent("chat:addSuggestion", "/"..Config.ChatCommand.commandname, Lang['commandname_desc'])
end

GiveAdminCommands = function()
    RegisterCommand(Config.AdminOptions.commands.addxp, function(source,args,rawCommand)
        if args[1] == nil or args[2] == nil or args[3] == nil then
            return SS_Core.Notification({title = Lang['missing_args_title'], message = Lang['missing_args_message']:format(Config.AdminOptions.commands.addxp)})
        end
        SS_Core.TriggerCallback("ss-knowledge:server:fetchBranches", function(data)
            local PlayerBranches = data
            SS_Log("debug","^4Before adding xp: ^3"..PlayerBranches[args[2]], resourceName, true, currentLine.."30")
            PlayerBranches[args[2]] = PlayerBranches[args[2]] + args[3]
            local Levels = Config.Branches[args[2]].customLevels or Config.DefaultLevels
            if PlayerBranches[args[2]] < 0 then
                PlayerBranches[args[2]] = 0
            end
            if PlayerBranches[args[2]] > Levels[#Levels].maxxp then
                PlayerBranches[args[2]] = Levels[#Levels].maxxp
            end
            SS_Log("debug","^4After adding xp: ^3"..PlayerBranches[args[2]], resourceName, true, currentLine.."39")
            TriggerServerEvent("ss-knowledge:server:updateBranches", json.encode(PlayerBranches), args[1])
        end, args[1])
    end)
    TriggerEvent("chat:addSuggestion", "/"..Config.AdminOptions.commands.addxp, Lang['addxp_help_arg_1'],{{ name = Lang['addxp_name_arg_2'], help = Lang['addxp_help_arg_2'] }, { name = Lang['addxp_name_arg_3'], help = Lang['addxp_help_arg_3'] }, { name = Lang['addxp_name_arg_4'], help = Lang['addxp_help_arg_4']}})

    RegisterCommand(Config.AdminOptions.commands.removexp, function(source,args,rawCommand)
        if args[1] == nil or args[2] == nil or args[3] == nil then
            return SS_Core.Notification({title = Lang['missing_args_title'], message = Lang['missing_args_message']:format(Config.AdminOptions.commands.removexp)})
        end
        SS_Core.TriggerCallback("ss-knowledge:server:fetchBranches", function(data)
            local PlayerBranches = data
            SS_Log("debug","^4Before removing xp: ^3"..PlayerBranches[args[2]], resourceName, true, currentLine.."51")
            PlayerBranches[args[2]] = PlayerBranches[args[2]] - args[3]
            local Levels = Config.Branches[args[2]].customLevels or Config.DefaultLevels
            if PlayerBranches[args[2]] < 0 then
                PlayerBranches[args[2]] = 0
            end
            if PlayerBranches[args[2]] > Levels[#Levels].maxxp then
                PlayerBranches[args[2]] = Levels[#Levels].maxxp
            end
            SS_Log("debug","^4After removing xp: ^3"..PlayerBranches[args[2]], resourceName, true, currentLine.."60")
            TriggerServerEvent("ss-knowledge:server:updateBranches", json.encode(PlayerBranches), args[1])
        end, args[1])
    end)
    TriggerEvent("chat:addSuggestion", "/"..Config.AdminOptions.commands.removexp, Lang['removexp_help_arg_1'],{{ name = Lang['removexp_name_arg_2'], help = Lang['removexp_help_arg_2'] }, { name = Lang['removexp_name_arg_3'], help = Lang['removexp_help_arg_3'] }, { name = Lang['removexp_name_arg_4'], help = Lang['removexp_help_arg_4']}})

    RegisterCommand(Config.AdminOptions.commands.checkplayerbranch, function(source,args,rawCommand)
        if args[1] == nil or args[2] == nil then
            return SS_Core.Notification({title = Lang['missing_args_title'], message = Lang['missing_args_message']:format(Config.AdminOptions.commands.checkplayerbranch)})
        end
        SS_Core.TriggerCallback("ss-knowledge:server:fetchBranches", function(data)
            local PlayerBranches = data
            SS_Core.TriggerCallback("ss-knowledge:server:getPlayerName", function(name)
                SS_Core.Notification({title = Lang['check_player_branch_title'], message = name.." "..Lang['check_player_branch_message']:format(PlayerBranches[args[2]],args[2])})
            end, tonumber(args[1]))
        end, tonumber(args[1]))
    end)
    TriggerEvent("chat:addSuggestion", "/"..Config.AdminOptions.commands.checkplayerbranch, Lang['checkxp_help_arg_1'],{{ name = Lang['checkxp_name_arg_2'], help = Lang['checkxp_help_arg_2'] }, { name = Lang['checkxp_name_arg_3'], help = Lang['checkxp_help_arg_3'] }})
end