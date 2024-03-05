fx_version 'adamant'
games { 'gta5' }

author 'Vol7r1x Scripts'
name 'vs_vendingmachine'
description 'Use all snack vending machines'
version '1.0'

lua54 'yes'

shared_script {
    '@es_extended/imports.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}
