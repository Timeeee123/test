-- NC PROTECT+
shared_scripts { '@nc_PROTECT+/exports/protected.lua', '@nc_PROTECT+/exports/sh.lua' }

fx_version 'adamant'

game 'gta5'

description 'https://discord.gg/VxQDpbmFG8'

lua54 'yes'
version '1.4.8'

shared_scripts {
	'locale.lua',
	'locales/*.lua',

	'config.lua',
	'config.weapons.lua',
}

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/common.lua',
	'server/classes/player.lua',
	'server/classes/overrides/*.lua',
	'server/functions.lua',
	'server/onesync.lua',
	'server/paycheck.lua',
	'server/main.lua',
	'server/server.lua',
	'server/commands.lua',


	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/modules/table.lua',
	'common/functions.lua'
}

client_scripts {
	'client/common.lua',
	'client/functions.lua',
	'client/Zc_Client/Zc_Client.lua',
	'client/wrapper.lua',
	'client/main.lua',


	'client/modules/death.lua',
	'client/modules/scaleform.lua',
	'client/modules/streaming.lua',

	'common/modules/math.lua',
	'common/modules/table.lua',
	'common/functions.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'imports.lua',
	'locale.js',
	'html/ui.html',

	'html/css/app.css',

	'html/js/mustache.min.js',
	'html/js/wrapper.js',
	'html/js/app.js',

	'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf',

	'html/img/accounts/bank.png',
	'html/img/accounts/black_money.png',
	'html/img/accounts/money.png'
}

dependencies {
	'oxmysql',
	'spawnmanager',
	'async'
}
export {
	'CheckSex',
}