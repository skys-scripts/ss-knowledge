Config = {

	Triggers = {
		['ESX'] = { -- update your triggers or event-names here if you've changed them from default values:
			resource = 'es_extended', -- esx resource name
			obj = 'esx:getSharedObject',
			load = 'esx:playerLoaded',
			job = 'esx:setJob',
            playerdatabase = 'users' -- This is the table that is used for for your player's indentifier or citizenid 
		},
		['QB'] = { -- update your triggers or event-names here if you've changed them from default values
			resource = 'qb-core', -- qb-core resource name
			obj = 'QBCore:GetObject',
			load = 'QBCore:Client:OnPlayerLoaded',
			job = 'QBCore:Client:OnJobUpdate',
			uObjCL = 'QBCore:Client:UpdateObject',
			uObjSV = 'QBCore:Server:UpdateObject',
			dutyToggle = 'QBCore:ToggleDuty',
            playerdatabase = 'players' -- This is the table that is used for for your player's indentifier or citizenid 
		},
	},

    AdminOptions = {
        enable = true,-- This is used for allowing commands through admin perms to be run (set by ace permmissions)
        ranks = {"admin","superadmin","command","qbcore.god"}, -- Ace permission ranks allowed to use the admin commands for altering xp amounts of players.
        inputType = "command", -- only inputType == "command" available currently. It requires you to add command args (will require player indentifier (server/state id) used for character). 
        commands = {
            addxp = "addxp",
            removexp = "removexp",
            checkplayerbranch = "checkplayerbranch",
        },
    },

	Debug = false, -- For debug prints set to true.

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
            --[[customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },]]
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        drug_sales = {
            enable = true,
            title = 'Drug Sales',
            icon = 'fas fa-pills',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        heistreputation = {
            enable = true,
            title = 'Heist Reputation',
            icon = 'fas fa-pills',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        hacking = {
            enable = true,
            title = 'Hacking',
            icon = 'fas fa-laptop-code',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
                {title = 'Zeus\'d', minxp = 15001, maxxp = 150000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'email',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 18500, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 13500, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        fishing = {
            enable = true,
            title = 'Fishing',
            icon = 'fas fa-fish-fins',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        garbage = {
            enable = true,
            title = 'Garbage',
            icon = 'fas fa-trash-can',
            --[[customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },]]
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        weapon_crafting = {
            enable = true,
            title = 'Weapon Crafting',
            icon = 'fas fa-person-rifle',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        hotdog = {
            enable = true,
            title = 'Hotdog Vending',
            icon = 'fas fa-hotdog',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        lockpicking = {
            enable = true,
            title = 'Lockpicking and Hotwiring',
            icon = 'fas fa-location-pin-lock',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        robbing = {
            enable = true,
            title = 'Robbing [All types]',
            icon = 'fas fa-people-robbery',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        scrapping = {
            enable = true,
            title = 'Scrapping',
            icon = 'fas fa-screwdriver-wrench',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        street_rep = {
            enable = true,
            title = 'Street Cred',
            icon = 'fas fa-person-military-to-person',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" , sender = 'Sky', subject = 'Update to branch'},
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 100, message = "You start feeling better with that lockpick in your hand" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 200, message = "You're getting good with a lockpick" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 300, message = "You feel like you're nailing lockpicking now" , sender = 'Sky', subject = 'Update to branch'},
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" , sender = 'Sky', subject = 'Update to branch'},
                }
            }
        },
        taxi = {
            enable = true,
            title = 'Taxi Working',
            icon = 'fas fa-taxi',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch' },
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch' },
                }
            }
        },
        truck = {
            enable = true,
            title = 'Truck Driving',
            icon = 'fas fa-truck-ramp-box',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'notification',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch' },
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch' },
                }
            }
        },
        bus = {
            enable = true,
            title = 'Bus Driver',
            icon = 'fas fa-bus',
            customLevels = {
                {title = 'Noob', minxp = 00, maxxp = 200},
                {title = 'Crude', minxp = 201, maxxp = 400},
                {title = 'Junior', minxp = 401, maxxp = 800},
                {title = 'Senior', minxp = 801, maxxp = 1600},
                {title = 'Trainer', minxp = 1601, maxxp = 3200},
                {title = 'Leader', minxp = 3201, maxxp = 6400},
                {title = 'Professional', minxp = 6401, maxxp = 12800},
                {title = 'God Like', minxp = 12801, maxxp = 15000},
            },
            messages = { -- If enabled then if notify = 'notification' messages and subject (is used as title for compatible notify systems) are needed. if notify = 'email' then it will use subject,message and sender. change these to what you wish
                enable = true,
                notifytype = 'email',
                positive = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch' },
                },
                negative = {
                    { xp = 50, message = "You're not horrible with that lockpick anymore", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 100, message = "You start feeling better with that lockpick in your hand", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 200, message = "You're getting good with a lockpick", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 300, message = "You feel like you're nailing lockpicking now", sender = 'Sky', subject = 'Update to branch' },
                    { xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!", sender = 'Sky', subject = 'Update to branch' },
                }
            }
        },
    }
}

Framework = GetResourceState(Config.Triggers["QB"].resource):find('started') and 'QB' or GetResourceState(Config.Triggers["ESX"].resource):find('started') and 'ESX' -- Credit to t1ger for the framework config.