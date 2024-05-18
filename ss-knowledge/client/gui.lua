--[[local function createSkillMenu()
    local KnowledgeList = {}
    KnowledgeList[#KnowledgeList + 1] = {
        isHeader = true,
        header = Config.KnowledgeTitle,
        isMenuHeader = true,
        icon = 'fas fa-chart-bar'
    }
    for k,currentValue in pairs(Config.Branches) do
        local skillData = Config.Branches[k]
        local label = Config.Branches[k].title or k

        if not skillData.enable then
            local level, levelData = GetKnowledgeBranch(currentValue, k)
            KnowledgeList[#KnowledgeList + 1] = {
                header = label .. ' (Level: ' .. level .. ')',
                txt = getXpText(currentValue, levelData.to),
                icon = skillData.icon or nil,
                params = {
                    args = {
                        v
                    }
                }
            }
        end
    end
    for k,v in pairs(Config.Branches) do
        local KnowledgeLevel = ''
        if v['Current'] <= 100 then
            KnowledgeLevel = 'Level 0 (Unskilled)'
        elseif v['Current'] > 100 and v['Current'] <= 200 then
            KnowledgeLevel = 'Level 1 (Beginner)'
        elseif v['Current'] > 200 and v['Current'] <= 400 then
            KnowledgeLevel = 'Level 2 (Amateur)'
        elseif v['Current'] > 400 and v['Current'] <= 800 then
            KnowledgeLevel = 'Level 3 (Intermediate)'
        elseif v['Current'] > 800 and v['Current'] <= 1600 then
            KnowledgeLevel = 'Level 4 (Competent)'
        elseif v['Current'] > 1600 and v['Current'] <= 3200 then
            KnowledgeLevel = 'Level 5 (Skilled)'
        elseif v['Current'] > 3200 and v['Current'] <= 6400 then
            KnowledgeLevel = 'Level 6 (Adept)'
        elseif v['Current'] > 6400 and v['Current'] <= 12800 then
            KnowledgeLevel = 'Level 7 (Master)'
        elseif v['Current'] > 12800 then
            KnowledgeLevel = 'Level 8 (Proficient)'
        else 
            KnowledgeLevel = 'Unknown'
        end
        KnowledgeList[#KnowledgeList + 1] = {
            header = ''.. k .. '',
            txt = '( '..KnowledgeLevel..' ) Total XP ( '..round1(v['Current'])..' )',
            icon = ''..v['icon']..'',
            params = {
                args = {
                    v
                }
            }
        }
    end
    exports['qb-menu']:openMenu(KnowledgeList)
end]]


CreateKnowledgeBranchList = function()
    local options = {}
    print(json.encode(CurrentBranches))
    for k,v in pairs(CurrentBranches) do
        local branchInfo = Config.Branches[k]
        local BranchXP
        if branchInfo.enable then
            print("CurrentBranches[branchInfo]:"..tostring(CurrentBranches[branchInfo]))
            print("branchInfo:"..branchInfo)
            BranchXP = GetKnowledgeBranch(CurrentBranches[branchInfo],branchInfo)
        end

        local Min = branchInfo.minxp
        local Max = branchInfo.maxxp
        local Current = CurrentBranches[branchInfo]

        local Range = Max - Min
        local Progress = Current - Min

        local percentage = math.floor(Progress / Range * 100)
        local desc = '[ '..BranchXP..' ] Total Knowledge: [ '..math.round(Current)..' ]'

        if Config.Menu.type == 'ox' and Config.Menu.ox.type ~= 'context' then
            desc = ''
        end

        options[#options + 1] = {
            label = branchInfo.title .. ' [' .. BranchXP .. ']',
            description = desc,
            icon = v.icon,
            args = {
                v
            },
            progress = percentage,
            colorScheme = Config.Menu.ox.colour,
        }
        --[[if Config.Menu.sort == 'alphabetically' then
            table.sort(options, function(a, b)
                return a.title < b.title
            end)
        elseif Config.Menu.sort == 'xp' then
            table.sort(options, function(a, b)
                return a.Current < b.Current
            end)
        end]]
    end
    print("Options: "..json.encode(options))
    if Config.Menu.type == 'ox' and Config.Menu.ox.type == 'menu' then
        lib.registerMenu({
            id = 'branches_list',
            title = Config.KnowledgeTitle,
            position = Config.Menu.ox.position,
            options = options
        })
        lib.showMenu('branches_list')
    elseif Config.Menu.type == 'ox' and Config.Menu.ox.type == 'context' then
        lib.registerContext({
            id = 'branches_list',
            title = Config.KnowledgeTitle,
            options = options
        })
        lib.showContext('branches_list')
    end
end

RegisterNetEvent("ss-knowledge:client:checkKnowledge", function()
    CreateKnowledgeBranchList()
end)
