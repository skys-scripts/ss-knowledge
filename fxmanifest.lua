fx_version 'cerulean'
game 'gta5'

author 'Sky\'s Scripts'
description 'Multi use knowledge/rep/xp resource'

version '1.2.3'

shared_scripts {
    '@ox_lib/init.lua', -- if not using ox_lib options please mark this out with the 2 -'s like i have to write this comment
    'language.lua',
	'config.lua',
	'bridge/shared/logging.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'bridge/server/*.lua',
	'bridge/shared/logging.lua',
}

client_scripts {
	'client/*.lua',
	'bridge/client/*.lua',
	'bridge/shared/logging.lua',
}

escrow_ignore {
	'client/*.lua',
	'server/*.lua',
	'language.lua',
	'config.lua',
	'bridge/*/*.lua',
}

lua54 'yes'
