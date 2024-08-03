Config = {
    -- Any Lang options can be found in the language.lua file as what is in the square brackets i.e [example] = "test this later",
	Triggers = {
		['ESX'] = { -- update your triggers or event-names here if you've changed them from default values:
			resource = 'es_extended', -- esx resource name
			obj = 'esx:getSharedObject',
			load = 'esx:playerLoaded',
			job = 'esx:setJob',
            playerdatabase = 'users', -- This is the table that is used for for your player's indentifier or citizenid 
            playerid = 'identifier'
		},
		['QB'] = { -- update your triggers or event-names here if you've changed them from default values
			resource = 'qb-core', -- qb-core resource name
			obj = 'QBCore:GetObject',
			load = 'QBCore:Client:OnPlayerLoaded',
			job = 'QBCore:Client:OnJobUpdate',
			uObjCL = 'QBCore:Client:UpdateObject',
			uObjSV = 'QBCore:Server:UpdateObject',
			dutyToggle = 'QBCore:ToggleDuty',
            playerdatabase = 'players', -- This is the table that is used for for your player's indentifier or citizenid 
            playerid = 'citizenid'
		},
	},

    AdminOptions = {
        enable = true,-- This is used for allowing commands through admin perms to be run (set by ace permmissions)
        ranks = {"admin","superadmin","command","group.admin","qbcore.god"}, -- Ace permission ranks allowed to use the admin commands for altering xp amounts of players.
        inputType = "command", -- only inputType == "command" available currently. It requires you to add command args (will require player indentifier (server/state id) used for character). 
        commands = {
            addxp = "addxp",
            removexp = "removexp",
            checkplayerbranch = "checkplayerbranch",
        },
    },

	Debug = true, -- For debug prints set to true.

    DefaultLevels = { -- Level system to check xp amount modify to change xp per level.
        {title = Lang['default_level_1'], minxp = 00, maxxp = 200},
        {title = Lang['default_level_2'], minxp = 201, maxxp = 400},
        {title = Lang['default_level_3'], minxp = 401, maxxp = 800},
        {title = Lang['default_level_4'], minxp = 801, maxxp = 1600},
        {title = Lang['default_level_5'], minxp = 1601, maxxp = 3200},
        {title = Lang['default_level_6'], minxp = 3201, maxxp = 6400},
        {title = Lang['default_level_7'], minxp = 6401, maxxp = 12800},
        {title = Lang['default_level_8'], minxp = 12801, maxxp = 25000},
    },

    LoseBranchKnowledge = {
        enable = true,-- if set to true over time you will loose a little of your branches xp.
        notification = true, -- if set to true and enabled is true players will get a notification telling them they lost some xp
        update = 15, --Update every x minutes to database.    
        min = 1, -- Minimum lost when enabled.
        max = 10, -- Maximum lost when enabled.
    },

    Menu = {
        type = 'ox', -- menu options are: 'ox' using ox_lib's menu and 'qb' using qb-menu
        sort = 'alphabetically', -- 'alphabetically' makes the list alphabetical. If you want it sorted by total xp then 'xp'
        defaulticon = 'fas fa-book', -- Default icon when no icon is used in a branch.
        ox = { -- Only affects ox_lib users.
            type = 'menu', -- choose 'context' or 'menu' for different styling of ox options
            colour = 'cyan', -- This is for the colour of the progress bar
            position = 'bottom-right', -- This is for the position of the generated list using 'context' type 'top-center','bottom-center','top-left','bottom-left','top-right','bottom-right'
            branchxpinfo = true, -- If type is 'menu' and branchxpinfo is true you will get more data shown above the menu.
        },
    },

    KnowledgeTitle = "Knowledge Branches", -- Title label for the menu/list of branches.

    ChatCommand = { -- when enabled this will allow a slash chat commmand
        enable = true,
        commandname = "branches"
    },


    Notification = {
        enable = true,-- If enabled you can send nofitications when xp is added, removed/spent.
        notifytype = "qb",  --'qb', 'ox', 'okok', 'esx' 
        email = { -- If enabled emails will be triggered when you level up or down a skill.
            enable = true,
            type = 'qb-phone', -- 'lb-phone', 'qb-phone', 'qs-phone'. if a phone is used it will send an email else if 'nil' it will be a standard Notification
        },
    },

    Branches = {
        crafting = {
            enable = true,
            title = 'Crafting',
            icon = '',
            --[[customLevels = { -- This is how you disable custom levels and use default levels
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },]]
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your crafting ability.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle crafting with more ease.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your crafting ability.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at crafting now.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a crafting legend!", sender = 'Arthur', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your crafting ability.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle crafting with more difficulty.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when crafting.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at crafting now.", sender = 'Arthur', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with crafting reciepes you know. You're becoming less adept with your crafting skill.", sender = 'Arthur', subject = 'Update to branch'},
                }
            }
        },
        drug_sales = {
            enable = true,
            title = 'Drug Sales',
            icon = 'fas fa-pills',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your sales ability.", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle drug selling with more ease.", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your drug selling ability.", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at selling now.", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a superb drug seller!", sender = 'Escocar', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your drug selling ability", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle 'customers' with more difficulty.", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when drug selling.", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at peddling drugs now.", sender = 'Escocar', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with selling in your areas. You're becoming less adept with your selling skill.", sender = 'Escocar', subject = 'Update to branch'},
                }
            }
        },
        heistreputation = {
            enable = true,
            title = 'Heist Reputation',
            icon = 'fas fa-pills',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your heisting ability.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle heisting with more ease.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your heisting rep on the rise.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at heists now.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're like a heisting legend!", sender = 'Jesse', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your heist skill.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle heisting with more difficulty.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with heisting.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling with heisting now.", sender = 'Jesse', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with heisting skills you know. You're becoming less adept with your heisting ability.", sender = 'Jesse', subject = 'Update to branch'},
                }
            }
        },
        hacking = {
            enable = true,
            title = 'Hacking',
            icon = 'fas fa-laptop-code',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'email',
                positive = {
                    { xp = 50, message = "You've really improved with your hacking ability.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle hacks with more ease.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your hacking knowledge.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at hacking now.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a hacking god!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your hacking ability.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle hacking with more difficulty.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands during hacking sessions.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at hacking now.", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with craking software. You're becoming less adept with your hacking skill.", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        fishing = {
            enable = true,
            title = 'Fishing',
            icon = 'fas fa-fish-fins',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your fishing ability.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle your fishing rod with more ease.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with catching fish.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at being a fisher now.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile rod. You're becoming a fishing legend!", sender = 'Michael', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your fishing rod.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting handling your fishing rod with more difficulty.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when fishing.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at fishing now.", sender = 'Michael', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with fishing techniques you know. You're becoming less adept with your fishing skill.", sender = 'Michael', subject = 'Update to branch'},
                }
            }
        },
        garbage = {
            enable = true,
            title = 'Garbage',
            icon = 'fas fa-trash-can',
            --[[customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },]]
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your garbage ability.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle garbage runs with more ease.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with the garbage you grab.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at garbage collection now.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming the best garbage collector around!", sender = 'Derf', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your garbage ability.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle garbage with more difficulty.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when garbage collecting.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at garbage collection now.", sender = 'Derf', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with garbage your known to be able to handle. You're becoming less adept with your garbage skill.", sender = 'Derf', subject = 'Update to branch'},
                }
            }
        },
        weapon_crafting = {
            enable = true,
            title = 'Weapon Crafting',
            icon = 'fas fa-person-rifle',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your weapon smithing ability.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle weapon smithing with more ease.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your weapon crafting ability.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at weapon making now.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a weapon smithing god!", sender = 'Masamune', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your weapon crafting ability.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle weapons with more difficulty.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when weapon smithing.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at weapon crafting now.", sender = 'Masamune', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with weapon smithing reciepes you know. You're becoming less adept with your weapon smithing skill.", sender = 'Masamune', subject = 'Update to branch'},
                }
            }
        },
        hotdog = {
            enable = true,
            title = 'Hotdog Vending',
            icon = 'fas fa-hotdog',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your hotdog selling ability.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle hotdog selling with more ease.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your hotdog selling ability.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at hotdog selling now.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a famous hotdog seller!", sender = 'Beztu ', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your hotdog selling ability.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle hotdogs with more difficulty.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure about your hotdog selling skills.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at hotdog selling now.", sender = 'Beztu ', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with the hotdog reciepes you know. You're becoming less known for your hotdog selling.", sender = 'Beztu ', subject = 'Update to branch'},
                }
            }
        },
        lockpicking = {
            enable = true,
            title = 'Lockpicking and Hotwiring',
            icon = 'fas fa-location-pin-lock',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your lockpicking ability.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle lockpicking with more ease.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your lockpicking ability.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at unlocking some of the most difficult tumblers now.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your agile hands. You're becoming a lockpicking legend!", sender = 'Loius', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your lockpicking ability.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle tumblers with more difficulty.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when lockpicking.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at lockpicking now.", sender = 'Loius', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with lockpicking of tumblers you know. You're becoming less adept with your lockpicking skill.", sender = 'Loius', subject = 'Update to branch'},
                }
            }
        },
        robbing = {
            enable = true,
            title = 'Robbing [All types]',
            icon = 'fas fa-people-robbery',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your robbing ability.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle robbing with more ease.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your robbing ability.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at robbing now.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a robbing legend!", sender = 'Squizzy', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your robbing ability.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle robbing with more difficulty.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when robbing.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at robbing now.", sender = 'Squizzy', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with robbing reciepes you know. You're becoming less adept with your robbing skill.", sender = 'Squizzy', subject = 'Update to branch'},
                }
            }
        },
        scrapping = {
            enable = true,
            title = 'Scrapping',
            icon = 'fas fa-screwdriver-wrench',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your scrapping ability.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle scrapping with more ease.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your scrapping ability.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at scrapping now.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a scrapping legend!", sender = 'Charles', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your scrapping ability.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle scrapping with more difficulty.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when scrapping.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at scrapping now.", sender = 'Charles', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with scrapping reciepes you know. You're becoming less adept with your scrapping skill.", sender = 'Charles', subject = 'Update to branch'},
                }
            }
        },
        street_rep = {
            enable = true,
            title = 'Street Rep',
            icon = 'fas fa-person-military-to-person',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved your street rep.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle being more populuar from gaining street rep.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your street rep populuarity.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at street rep based tasks now.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a known name on the streets!", sender = 'Paul', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch your street rep.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 100, message = "You’re handling losing street rep with more difficulty.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with the lose of your street rep.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at keeping your current street rep now.", sender = 'Paul', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with keeping your street rep. You're becoming less adept within your street rep community.", sender = 'Paul', subject = 'Update to branch'},
                }
            }
        },
        taxi = {
            enable = true,
            title = 'Taxi Working',
            icon = 'fas fa-taxi',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your taxi ability.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle taxi with more ease.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your taxi ability.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at taxi now.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming known in the taxi ranks!", sender = 'Arnold', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your taxi ability.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle taxing with more difficulty.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when taxing.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at taxing now.", sender = 'Arnold', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering with customers when taxing now. You're becoming less adept with your taxi skills.", sender = 'Arnold', subject = 'Update to branch'},
                }
            }
        },
        truck = {
            enable = true,
            title = 'Truck Driving',
            icon = 'fas fa-truck-ramp-box',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You've really improved with your truck driving ability.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle truck driving with more ease.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your truck driving ability.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at truck driving now.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a truck legend!", sender = 'Elvis', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your truck driving ability.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle trucks with more difficulty.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when truck driving.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at truck driving now.", sender = 'Elvis', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering when truck driving. You're becoming less adept with your truck driving skill.", sender = 'Elvis', subject = 'Update to branch'},
                }
            }
        },
        bus = {
            enable = true,
            title = 'Bus Driver',
            icon = 'fas fa-bus',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'email',
                positive = {
                    { xp = 50, message = "You've really improved with your bus driving ability.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle buses with more ease.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your bus driving ability.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at bus driving now.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a bus driving legend!", sender = 'Dave', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your bus driving ability.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle buses with more difficulty.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when in control of the bus.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at bus driving now.", sender = 'Dave', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering round the roads when driving the bus. You're becoming less adept with your bus driving skill.", sender = 'Dave', subject = 'Update to branch'},
                }
            }
        },
        mining = {
            enable = true,
            title = 'Miner',
            icon = 'fas fa-person-digging',
            customLevels = {
                {title = 'Beginner', minxp = 00, maxxp = 200},
                {title = 'Unpolished', minxp = 201, maxxp = 400},
                {title = 'Trainee', minxp = 401, maxxp = 800},
                {title = 'Advanced', minxp = 801, maxxp = 1600},
                {title = 'Instructor', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Specialist', minxp = 6401, maxxp = 12800},
                {title = 'Mythical', minxp = 12801, maxxp = 15000},
            },
            messages = {  -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. 
                        --if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'email',
                positive = {
                    { xp = 50, message = "You've really improved with your mining ability.", sender = 'George', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle mining with more ease.", sender = 'George', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more assured with your mining ability.", sender = 'George', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're excelling at mining now.", sender = 'George', subject = 'Update to branch'},
                    { xp = 350, message = "You're unstoppable with your versitile hands. You're becoming a mining legend!", sender = 'George', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You've loosing your touch with your mining ability.", sender = 'George', subject = 'Update to branch'},
                    { xp = 100, message = "You’re starting to handle pickaxes with more difficulty.", sender = 'George', subject = 'Update to branch'},
                    { xp = 200, message = "You’re feeling more insecure with your hands when in control of a pickaxe.", sender = 'George', subject = 'Update to branch'},
                    { xp = 300, message = "You sense that you're struggling at mining now.", sender = 'George', subject = 'Update to branch'},
                    { xp = 350, message = "You're floundering round the caves when mining. You're becoming less adept with your mining skill.", sender = 'George', subject = 'Update to branch'},
                }
            }
        },
    }
}

Framework = GetResourceState(Config.Triggers["QB"].resource):find('started') and 'QB' or GetResourceState(Config.Triggers["ESX"].resource):find('started') and 'ESX' -- Credit to t1ger for the framework config.