Lang = { -- PLEASE NOTE %s is used for added varaibles from the script itself. This can range from the name of the branch to the amount of xp added.
    -- Default level names
    ['default_level_1'] = 'Initiate',
    ['default_level_2'] = 'Hobbyist',
    ['default_level_3'] = 'Mediocre',
    ['default_level_4'] = 'Qualified',
    ['default_level_5'] = 'Accomplished',
    ['default_level_6'] = 'Versatile',
    ['default_level_7'] = 'Sage',
    ['default_level_8'] = 'Maestro',

    --Debug options
    ['branch_doesnt_exist'] = "^1This branch doesn't exist in your current list. Missing branch: ^0[^3 %s ^0]", -- Branch name
    ['loading_player_branches'] = '^4Grabbing player knowledge branches^0',

    -- Notification languages
    ["notification_add_knowledge_title"] = 'Knowledge Collected',
    ["notification_add_knowledge_to_branch"] = 'You have gained %s XP in your %s knowledge branch', -- 1. amount of xp 2.Branch name
    ["notification_remove_knowledge_title"] = 'Knowledge Used',
    ["notification_remove_knowledge_to_branch"] = 'You have lost %s XP in your %s knowledge branch', -- 1. amount of xp 2.Branch name
    ["notification_max_knowledge_title"] = "Maxed Knowledge Branch",
    ["notification_max_knowledge_message"] = "You have maxed out your %s branch",-- 1. Branch name
    ["notification_remove_knowledge_from_all_branches"] = 'You have lost some XP in your known knowledge branches',

    --menu stuffs
    ['knowledge_branch_label'] = "%s - [ %s ]", -- 1. Branch name 2. Branch level
    ['knowledge_branch_desc'] = '[ %s ] - Total Knowledge: [ %s ]', -- 1. amount of xp 2.Branch name
    ['knowledge_branch_desc_total_info'] = 'Total Knowledge: [ %s ]', -- 1. amount of xp

    -- email level up
    ['level_up_email_message'] = 'Well done for increasing your %s knowledge branch to level %s', -- 1. amount of xp 2.Branch name
    ['level_up_email_sender'] = 'Knowledge Agency',
    ['level_up_email_subject'] = 'You\'ve Improved',

    -- command description / args help
    ['commandname_desc'] = 'Show your current knowledge branches',
    ['addxp_help_arg_1'] = 'Add xp to an online player\'s knowledge branch (Allowed Staff Only)',
    ['addxp_help_arg_2'] = 'Server ID',
    ['addxp_name_arg_2'] = 'ID',
    ['addxp_help_arg_3'] = 'Branch Name',
    ['addxp_name_arg_3'] = 'Branch',
    ['addxp_help_arg_4'] = 'Amount of xp to add',
    ['addxp_name_arg_4'] = 'XP',
    ['removexp_help_arg_1'] = 'Remove xp from an online player\'s knowledge branch (Allowed Staff Only)',
    ['removexp_name_arg_2'] = 'Server ID',
    ['removexp_help_arg_2'] = 'ID',
    ['removexp_name_arg_3'] = 'Branch Name',
    ['removexp_help_arg_3'] = 'Branch',
    ['removexp_name_arg_4'] = 'Amount of xp to remove',
    ['removexp_help_arg_4'] = 'XP',
    ['checkxp_help_arg_1'] = 'Check a knowledge branch of an online player (Allowed Staff Only)',
    ['checkxp_name_arg_2'] = 'Server ID',
    ['checkxp_help_arg_2'] = 'ID',
    ['checkxp_name_arg_3'] = 'Branch Name',
    ['checkxp_help_arg_3'] = 'Branch',
    ['check_player_branch_title'] = 'Checking Player Branch',
    ['check_player_branch_message'] = ' has a total of [%s] xp in [%s] branch', -- 1. amount of xp 2.Branch name

    -- Missing args in command
    ['missing_args_title'] = 'Missing args',
    ['missing_args_message'] = 'Your missing some data for command [%s]', -- 1. Name of command
}