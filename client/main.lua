CurrentBranches = {}

local resourceName = GetCurrentResourceName()

local currentLine = "CLNT>MAIN #"

if Config.LoseBranchKnowledge.enable then
    RegisterNetEvent(Config.Triggers[Framework].load, function()
        CreateThread(function()
            while true do
                if LocalPlayer.state.isLoggedIn then
                    Wait(Config.LoseBranchKnowledge.update * 60000)
                    for branches, value in pairs(Config.Branches) do
                        SS_Log("debug","^4Branch:^0 ^3"..string.lower(branches), resourceName, true, currentLine.."14")
                        local nextKey, _ = next(Config.Branches, branches)
                        if not nextKey then
                            UpdateKnowledgeBranch(branches, (0 - (math.random(Config.LoseBranchKnowledge.min,Config.LoseBranchKnowledge.max))),true)
                        else
                            UpdateKnowledgeBranch(branches, (0 - (math.random(Config.LoseBranchKnowledge.min,Config.LoseBranchKnowledge.max))),false)
                        end
                    end
                    Wait(1000)
                else
                    Wait(5000)
                end
            end
        end)
    end)
end