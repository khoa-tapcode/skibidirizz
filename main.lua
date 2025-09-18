local _ENV = (getgenv or getrenv or getfenv)()

local Scripts = {
    {
        PlacesIds = {2753915549, 4442272183, 7449423635},
        UrlPath = "BloxFruits.luau"
    },
    {
        PlacesIds = {10260193230},
        UrlPath = "MemeSea.luau"
    }
}

local fetcher, urls = {}, {}

do
    local last_exec = _ENV.rz_execute_debounce

    if last_exec and (tick() - last_exec) <= 5 then
        return nil
    end

    _ENV.rz_execute_debounce = tick()
end

urls.Owner = "https://raw.githubusercontent.com/tlredz/";
urls.Repository = urls.Owner .. "Scripts/refs/heads/main/";
urls.Translator = urls.Repository .. "Translator/";
urls.Utils = urls.Repository .. "Utils/";

do
    local executor = syn or fluxus or solara
    local queueteleport = queue_on_teleport or (executor and executor.queue_on_teleport)

    if not _ENV.rz_added_teleport_queue and type(queueteleport) == "function" then
        local ScriptSettings = {...}
        local SettingsCode = ""

        _ENV.rz_added_teleport_queue = true

        local Success, EncodedSettings = pcall(function()
            return game:GetService("HttpService"):JSONEncode(ScriptSettings)
        end)

        if Success and EncodedSettings then
            SettingsCode = "unpack(game:GetService('HttpService'):JSONDeco
