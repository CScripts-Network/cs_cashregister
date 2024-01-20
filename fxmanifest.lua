lua54 'yes'
game 'gta5'
fx_version 'adamant'
author 'CScripts Network'

client_scripts {
    'client/**.lua',
    'config.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/**.lua',
    'config.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
}

exports {
    'CreateRegister'
}