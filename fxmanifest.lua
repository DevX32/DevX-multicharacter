fx_version 'cerulean'
game 'gta5'
author 'DevX32'
description 'DevX-Multicharacter'
shared_scripts {
    '@ox_lib/init.lua',
    'shared.lua'
}
client_script {
    'client/cl_multi.lua'
}
server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    '@qb-apartments/config.lua',
    'server/sv_multi.lua'
}

ui_page 'web/ui.html'

files {
    'web/ui.html',
    'web/ui.css',
    'web/reset.css',
    'web/prompts.js',
    'web/app.js'
}
dependencies {
    'ox_lib'
}
lua54 'yes'