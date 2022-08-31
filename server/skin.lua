QBCore = exports[Config.CoreFolderName]:GetCoreObject() ----------Dont change this

---------Make necessary changes but maintain the table-------

if not Config.UseFivemAppearance then
    QBCore.Functions.CreateCallback("yg-characters:server:GetPlayerSkins", function(source, cb)
        local src = source
        local license = QBCore.Functions.GetIdentifier(src, 'license')
        local skinsTable = {}
        if Config.oxmysql == 'new' then
            MySQL.Async.fetchAll('SELECT * FROM playerskins INNER JOIN players ON players.license = ?  AND playerskins.citizenid = players.citizenid', {license}, function(result)
                for k,v in pairs(result) do
                    skinsTable[#skinsTable + 1] = {
                        skin = v.skin,
                        cid = v.cid,
                        model = v.model,
                    }
                end
                cb(skinsTable)
            end)
        elseif Config.oxmysql == 'old' then
            local result = exports.oxmysql:fetchAll('SELECT * FROM playerskins INNER JOIN players ON players.license = ?  AND playerskins.citizenid = players.citizenid', {license})
            for k,v in pairs(result) do
                skinsTable[#skinsTable + 1] = {
                    skin = v.skin,
                    cid = v.cid,
                    model = v.model,
                }
            end
            cb(skinsTable)
        end
    end)
else
    if Config.FivemAppaeranceversion == 'aj' then
        QBCore.Functions.CreateCallback("yg-characters:server:GetPlayerSkins", function(source, cb)
            local src = source
            local license = QBCore.Functions.GetIdentifier(src, 'license')
            local skinsTable = {}
            if Config.oxmysql == 'new' then
                MySQL.Async.fetchAll('SELECT * FROM players WHERE license = ?', {license}, function(result)
                    for k,v in pairs(result) do
                        if v.skin ~= nil then
                            model = json.decode(v.skin)
                            if model ~= nil then
                                skinsTable[#skinsTable + 1] = {
                                    skin = v.skin,
                                    cid = v.cid,
                                    model = model.model,
                                }
                            else
                                skinsTable[#skinsTable + 1] = {
                                    skin = json.encode({}),
                                    cid = v.cid,
                                    model = 'mp_m_freemode_01',
                                }
                            end
                        else
                            skinsTable[#skinsTable + 1] = {
                                skin = json.encode({}),
                                cid = v.cid,
                                model = 'mp_m_freemode_01',
                            }
                        end
                    end
                    cb(skinsTable)
                end)
            elseif Config.oxmysql == 'old' then
                local result = exports.oxmysql:fetchAll('SELECT * FROM players WHERE license = ?', {license})
                for k,v in pairs(result) do
                    if v.skin ~= nil then
                        model = json.decode(v.skin)
                        if model ~= nil then
                            skinsTable[#skinsTable + 1] = {
                                skin = v.skin,
                                cid = v.cid,
                                model = model.model,
                            }
                        else
                            skinsTable[#skinsTable + 1] = {
                                skin = json.encode({}),
                                cid = v.cid,
                                model = 'mp_m_freemode_01',
                            }
                        end
                    else
                        skinsTable[#skinsTable + 1] = {
                            skin = json.encode({}),
                            cid = v.cid,
                            model = 'mp_m_freemode_01',
                        }
                    end
                end
                cb(skinsTable)
            end
        end)
    
        QBCore.Functions.CreateCallback('yg-characters:server:SkinCheck',function(source,cb,cid)
            local src = source
            local license = QBCore.Functions.GetIdentifier(src, 'license')
            if Config.oxmysql == 'new' then
                MySQL.Async.fetchAll('SELECT * FROM players WHERE license = @license AND cid = @cid',{['@license'] = license,['@cid'] = cid.cid},function(result)
                    local players = MySQL.Sync.fetchAll('SELECT skin FROM players WHERE citizenid = ?', {result[1].citizenid})
                    if players[1].skin ~= nil then
                        cb(true)
                    else
                        cb(false)
                    end
                end)
            elseif Config.oxmysql == 'old' then
                local result = exports.oxmysql.fetchAll('SELECT * FROM players WHERE license = @license AND cid = @cid',{['@license'] = license,['@cid'] = cid.cid})
                local players = exports.oxmysql.fetchAll('SELECT skin FROM players WHERE citizenid = ?', {result[1].citizenid})
                if players[1].skin ~= nil then
                    cb(true)
                else
                    cb(false)
                end
            end
        end)
    elseif Config.FivemAppaeranceversion == 'il' then
        QBCore.Functions.CreateCallback("yg-characters:server:GetPlayerSkins", function(source, cb)
            local src = source
            local license = QBCore.Functions.GetIdentifier(src, 'license')
            local skinsTable = {}
            if Config.oxmysql == 'new' then
                local result = MySQL.Sync.fetchAll('SELECT * FROM players INNER JOIN playerskins ON players.license = ?  AND players.citizenid = playerskins.citizenid', {license})
                for k,v in pairs(result) do
                    skinsTable[#skinsTable + 1] = {
                        skin = json.decode(v.skin),
                        cid = v.cid,
                        model = v.model,
                    }
                end
                cb(skinsTable)
            elseif Config.oxmysql == 'old' then
                local result = exports.oxmysql:fetchAll('SELECT * FROM playerskins INNER JOIN players ON players.license = ?  AND playerskins.citizenid = players.citizenid', {license})
                for k,v in pairs(result) do
                        for k,v in pairs(result) do
                            skinsTable[#skinsTable + 1] = {
                                skin = json.decode(v.skin),
                                cid = v.cid,
                                model = v.model,
                            }
                        end   
                end
                cb(skinsTable)
            end
        end)
    end
end