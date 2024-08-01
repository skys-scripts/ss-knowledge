fx_version 'cerulean'
game 'gta5'

author 'Sky\'s Scripts'
description 'Multi use knowledge/rep/xp resource'

version '1.1.1'

shared_scripts {
    '@ox_lib/init.lua', -- if not using ox_lib options please mark this out with the 2 -'s like i have to write this comment
    'language.lua',
	'config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/main.lua',
	'bridge/server/framework.lua',
	'bridge/server/utilities.lua',
}

client_scripts {
	'client/*.lua',
	'bridge/client/*.lua',
}

escrow_ignore {
	'client/main.lua',
	'client/gui.lua',
	'client/commands.lua',
	'client/functions.lua',
	'server/main.lua',
	'language.lua',
	'config.lua',
	'bridge/client/framework.lua',
	'bridge/client/utilities.lua',
	'bridge/server/framework.lua',
	'bridge/server/utilities.lua',
}

lua54 'yes'