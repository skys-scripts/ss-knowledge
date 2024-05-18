CurrentBranches = {}

if Config.LoseBranchKnowledge then
    RegisterNetEvent(Config.Triggers[Framework].load, function()
        CreateThread(function()
            while true do
                if LocalPlayer.state.isLoggedIn then
                    Wait(Config.LoseBranchKnowledge.update * 60000)
                    for skill, value in pairs(Config.Branches) do
                        print("Skill :"..skill)
                        UpdateKnowledgeBranch(skill, (0 - (math.random(Config.LoseBranchKnowledge.min,Config.LoseBranchKnowledge.max))),true)
                    end
                    TriggerServerEvent("ss-knowledge:server:updateBranches", json.encode(CurrentBranches),true)
                else
                    Wait(5000)
                end
            end
        end)
    end)
end

RegisterNetEvent('ss-knowledge:client:updateBranches', function(skill, amount)
    UpdateKnowledgeBranch(skill, amount)
end)

if Config.ChatCommand.enable then
    RegisterCommand(Config.ChatCommand.commandname, function()
        CreateKnowledgeBranchList()
    end, false)
end