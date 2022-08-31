fx_version 'cerulean'
game 'gta5'

description 'DevX-Multicharacter'

shared_script 'config.lua'
client_script {
            'client/main.lua'
            'client/skin.lua'
            }
server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
    'server/skin.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/profanity.js',
    'html/script.js'
}

lua54 'yes'
