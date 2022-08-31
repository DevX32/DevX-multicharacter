QBCore = exports[Config.CoreFolderName]:GetCoreObject()---------Dont change this

-----------Make changes to this function if you know what your doing

function createPeds(bool)
    if bool then
        QBCore.Functions.TriggerCallback('yg-characters:server:GetPlayerSkins',function(result)
            if result ~= nil then
                if Config.UseFivemAppearance then
                    if Config.FivemAppaeranceversion == 'aj' then
                        for k, v in pairs(result) do
                            model = v.model
                            RequestModel(model)
                            while not HasModelLoaded(model) do
                                Wait(100)
                            end
                            charPed = CreatePed(2, model, Config.PedSitCoords[v.cid].coords.x, Config.PedSitCoords[v.cid].coords.y, Config.PedSitCoords[v.cid].coords.z, Config.PedSitCoords[v.cid].coords.w, false, false)
                            SetPedDummyProperties(charPed)
                            LoadAnim(Config.SitAnim.dict)
                            FreezeEntityPosition(charPed,true)
                            exports[Config.FivemAppearanceName]:setPedAppearance(charPed, json.decode(v.skin))
                            TaskPlayAnimAdvanced(charPed,Config.SitAnim.dict,Config.SitAnim.anim,Config.PedSitCoords[v.cid].coords.x,Config.PedSitCoords[v.cid].coords.y,Config.PedSitCoords[v.cid].coords.z,0.0,0.0,Config.PedSitCoords[v.cid].coords.w,3.0, 3.0, -1, 7, 2.0, 1, 1)
                            CharPeds[#CharPeds + 1] = {
                                cid = v.cid,
                                ped = charPed
                            }
                            if v.cid ~= 1 then
                                SetEntityAlpha(charPed, 150, false)
                            end
                        end
                    elseif Config.FivemAppaeranceversion == 'il' then
                        for k, v in pairs(result) do
                            model = v.model
                            RequestModel(model)
                            while not HasModelLoaded(model) do
                                Wait(100)
                            end
                            charPed = CreatePed(2, model, Config.PedSitCoords[v.cid].coords.x, Config.PedSitCoords[v.cid].coords.y, Config.PedSitCoords[v.cid].coords.z, Config.PedSitCoords[v.cid].coords.w, false, false)
                            SetPedDummyProperties(charPed)
                            LoadAnim(Config.SitAnim.dict)
                            FreezeEntityPosition(charPed,true)
                            exports[Config.FivemAppearanceName]:setPedAppearance(charPed, v.skin)
                            TaskPlayAnimAdvanced(charPed,Config.SitAnim.dict,Config.SitAnim.anim,Config.PedSitCoords[v.cid].coords.x,Config.PedSitCoords[v.cid].coords.y,Config.PedSitCoords[v.cid].coords.z,0.0,0.0,Config.PedSitCoords[v.cid].coords.w,3.0, 3.0, -1, 7, 2.0, 1, 1)
                            CharPeds[#CharPeds + 1] = {
                                cid = v.cid,
                                ped = charPed
                            }
                            if v.cid ~= 1 then
                                SetEntityAlpha(charPed, 150, false)
                            end
                        end
                    end
                else
                    for k, v in pairs(result) do
                        model = tonumber(v.model)
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Wait(100)
                        end
                        charPed = CreatePed(2, model, Config.PedSitCoords[v.cid].coords.x, Config.PedSitCoords[v.cid].coords.y, Config.PedSitCoords[v.cid].coords.z, Config.PedSitCoords[v.cid].coords.w, false, false)
                        SetPedDummyProperties(charPed)
                        LoadAnim(Config.SitAnim.dict)
                        FreezeEntityPosition(charPed,true)
                        data = json.decode(v.skin)
                        TriggerEvent(Config.ClothingEvent, data, charPed)
                        TaskPlayAnimAdvanced(charPed,Config.SitAnim.dict,Config.SitAnim.anim,Config.PedSitCoords[v.cid].coords.x,Config.PedSitCoords[v.cid].coords.y,Config.PedSitCoords[v.cid].coords.z,0.0,0.0,Config.PedSitCoords[v.cid].coords.w,3.0, 3.0, -1, 7, 2.0, 1, 1)
                        CharPeds[#CharPeds + 1] = {
                            cid = v.cid,
                            ped = charPed
                        }
                        if v.cid ~= 1 then
                            SetEntityAlpha(charPed, 150, false)
                        end
                    end
                end
            else
                model = GetHashKey('mp_m_freemode_01')
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(100)
                end
                charPed = CreatePed(2, model, Config.PedSitCoords[v.cid].coords.x, Config.PedSitCoords[v.cid].coords.y, Config.PedSitCoords[v.cid].coords.z, Config.PedSitCoords[v.cid].coords.w, false, false)
                SetPedDummyProperties(charPed)
                LoadAnim(Config.SitAnim.dict)
                FreezeEntityPosition(charPed,true)
                TaskPlayAnimAdvanced(charPed,Config.SitAnim.dict,Config.SitAnim.anim,Config.PedSitCoords[v.cid].coords.x,Config.PedSitCoords[v.cid].coords.y,Config.PedSitCoords[v.cid].coords.z,0.0,0.0,Config.PedSitCoords[v.cid].coords.w,3.0, 3.0, -1, 7, 2.0, 1, 1)
                CharPeds[#CharPeds + 1] = {
                    cid = v.cid,
                    ped = charPed
                }
                if v.cid ~= 1 then
                    SetEntityAlpha(charPed, 150, false)
                end
            end
        end)
    else
        charPeds = {}
    end
end