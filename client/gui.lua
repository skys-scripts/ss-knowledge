CreateKnowledgeBranchList = function()
    local options = {}
    if Config.Menu.type == 'qb'then
        options[#options + 1] = {
            title = '.',
            isHeader = true,
            header = Config.KnowledgeTitle,
            isMenuHeader = true,
            args = {
                "header"
            },
            icon = 'fas fa-chart-simple'
        }
    end
    for k,v in pairs(CurrentBranches) do
        local branchInfo = Config.Branches[k]
        local branchTierTitle, branchXP = nil, {}
        if branchInfo.enable then
            branchTierTitle, branchXP = GetKnowledgeBranch(v,k)
            local min = branchXP.minxp
            local max = branchXP.maxxp
            local current = CurrentBranches[k] or 0

            local range = max - min
            local progress = current - min

            local percentage = math.floor(progress / range * 100)

            local desc = Lang['knowledge_branch_desc']:format(branchTierTitle,math.ceil(current))

            if Config.Menu.type == 'ox' and Config.Menu.ox.type ~= 'context' then
                if not Config.Menu.ox.branchxpinfo then
                    desc = ''
                else
                    desc = Lang['knowledge_branch_desc_total_info']:format(math.ceil(current))
                end
            end
            
            local currentIcon = Config.Menu.defaulticon
            if branchInfo.icon == '' or branchInfo.icon == nil then
                currentIcon = Config.Menu.defaulticon
            else
                currentIcon = branchInfo.icon
            end

            local head = Config.KnowledgeTitle
            if Config.Menu.type == 'qb' then
                head = branchInfo.title
            end
            options[#options + 1] = {
                title = branchInfo.title,
                label = Lang['knowledge_branch_label']:format(branchInfo.title, branchTierTitle),
                header = head,
                txt = desc,
                description = desc,
                icon = currentIcon,
                args = {
                    v
                },
                progress = percentage,
                colorScheme = Config.Menu.ox.colour,
            }
        end
    end

    if Config.Menu.sort == 'alphabetically' then
        table.sort(options, function(a, b)
            return a.title < b.title
        end)
    elseif Config.Menu.sort == 'xp' then
        table.sort(options, function(a, b)
            if type(b.args[1]) == "string" then
                return false
            elseif a.args[1] == 0 and b.args[1] ~= 0 then
                return false
            elseif a.args[1] ~= 0 and b.args[1] == 0 then
                return true
            elseif a.args[1] < b.args[1] then
                return false
            elseif a.args[1] > b.args[1] then
                return true
            else
                return a.title < b.title
            end
        end)
    end

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
    elseif Config.Menu.type == 'qb'then
        exports['qb-menu']:openMenu(options)
    end
end

RegisterNetEvent("ss-knowledge:client:checkKnowledge", function()
    CreateKnowledgeBranchList()
end)