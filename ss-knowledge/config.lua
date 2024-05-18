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

	Debug = true, -- For debug prints set to true. if you don't want debug prints set to false.

    Notification = {
        enable = true, -- If enabled you can send nofitications when xp is added, removed/spent.
        notifytype = "qb",  --'qb', 'ox', 'okok', 'esx' 
        email = {
            enable = true, -- If enabled emails will be triggered when you level up a skill. 
            type = 'qb-phone', -- 'lb-phone', 'qb-phone', 'qs-phone'. if a phone is used it will send an email else if 'nil' it will be a standard Notification
        },
    },

    DefaultLevels = { -- Level system to check xp amount modify to change xp per level.
        {title = Lang['default_level_1'], minxp = 100, maxxp = 200},
        {title = Lang['default_level_2'], minxp = 200, maxxp = 400},
        {title = Lang['default_level_3'], minxp = 400, maxxp = 800},
        {title = Lang['default_level_4'], minxp = 800, maxxp = 1600},
        {title = Lang['default_level_5'], minxp = 1600, maxxp = 3200},
        {title = Lang['default_level_6'], minxp = 3200, maxxp = 6400},
        {title = Lang['default_level_7'], minxp = 6400, maxxp = 12800},
        {title = Lang['default_level_8'], minxp = 12800, maxxp = 15000},
    },

    LoseBranchKnowledge = {
    enable = true, -- if set to true over time you will loose a little of your branches xp.
    update = 1, --Update every x minutes to database.    
    min = 1, -- Minimum lost when enabled.
    max = 10, -- Maximum lost when enabled.
    },

    Menu = {
        type = 'ox', -- menu options are: 'ox' using ox_lib's menu and 'qb' using qb-menu
        sort = 'alphabetically', -- 'alphabetically' makes the list alphabetical. If you want it sorted by total xp then 'xp'
        ox = { -- Only affects ox_lib users.
            type = 'context', -- choose 'context' or 'menu' for different styling of ox options
            colour = 'blue', -- This is for the colour of the progress bar
            position = 'bottom-right', -- This is for the position of the generated list using 'context' type 'top-center','bottom-center','top-left','bottom-left','top-right','bottom-right'
        },
    },

    KnowledgeTitle = Lang['knowledge_title'], -- Easiest place to change this is in language.lua. all locale 

    ChatCommand = { -- when enabled this will allow a slash chat commmand
        enable = true,
        commandname = "knowledge"
    },

    Radial = { -- when enabled this will allow a slash chat commmand
        enable = false,
        type = "ox" -- options by default 'ox', 'qb'
    },

    Branches = {
        crafting = {
            enable = true,
            title = 'Crafting',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        drug_sales = {
            enable = true,
            title = 'Drug Sales',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        fishing = {
            enable = true,
            title = 'Fishing',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        garbage = {
            enable = true,
            title = 'Garbage',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        weapon_crafting = {
            enable = true,
            title = 'Weapon Crafting',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        hotdog = {
            enable = true,
            title = 'Hotdog Vending',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        lockpicking = {
            enable = true,
            title = 'Lockpicking and Hotwiring',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        robbing = {
            enable = true,
            title = 'Robbing [All types]',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        scrapping = {
            enable = true,
            title = 'Scrapping',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        street_rep = {
            enable = true,
            title = 'Street Cred',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        taxi = {
            enable = true,
            title = 'Taxi Working',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        truck = {
            enable = true,
            title = 'Truck Driving',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
        bus = {
            enable = true,
            title = 'Bus Driver',
            icon = '',
            customLevels = {
                {title = 'Noob', minxp = 250, maxxp = 500},
                {title = 'Crude', minxp = 250, maxxp = 500},
                {title = 'Junior', minxp = 250, maxxp = 500},
                {title = 'Senior', minxp = 250, maxxp = 500},
                {title = 'Trainer', minxp = 250, maxxp = 500},
                {title = 'Leader', minxp = 250, maxxp = 500},
                {title = 'Professional', minxp = 250, maxxp = 500},
                {title = 'God Like', minxp = 250, maxxp = 500},
            },
            messages = { -- If enabled then if notify = 'notification' xp are message are needed if notify = 'email' when please a [email = 'sender name'] and [subject = 'Yo Booty']
                { enable = true, notify = 'notification', xp = 50, message = "You're not horrible with that lockpick anymore" },
                { enable = true, notify = 'notification', xp = 100, message = "You start feeling better with that lockpick in your hand" },
                { enable = true, notify = 'notification', xp = 200, message = "You're getting good with a lockpick" },
                { enable = true, notify = 'notification', xp = 300, message = "You feel like you're nailing lockpicking now" },
                { enable = true, notify = 'notification', xp = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
            }
        },
    }
}

Framework = GetResourceState(Config.Triggers["QB"].resource):find('started') and 'QB' or GetResourceState(Config.Triggers["ESX"].resource):find('started') and 'ESX' -- Credit to t1ger for the framework config.