fx_version 'cerulean'
game 'gta5'
lua54 'yes' -- lua 5.4
use_experimental_fxv2_oal 'yes' -- experimental fxv2 oal

shared_scripts {
    'shared/utils/logger.lua'
}

server_scripts {
    'addons/defferals/server/*.lua',
    'server/playerConnecting.lua'
}