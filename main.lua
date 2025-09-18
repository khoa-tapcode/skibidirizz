local _ENV = (getgenv or getrenv or getfenv)()

local Scripts = {
    {
        PlacesIds = {2753915549, 4442272183, 7449423635},
        UrlPath = "Games/BloxFruits.lua"
    },
    {
        PlacesIds = {10260193230},
        UrlPath = "Games/MemeSea.lua"
    }
}

local BASE_URL = "https://raw.githubusercontent.com/khoa-tapcode/Scripts/main/"

local fetcher = {}

local function formatUrl(path)
    return BASE_URL .. path
end

function fetcher.get(path)
    local success, response = pcall(function()
        return game:HttpGet(formatUrl(path))
    end)
    if success then
        return response
    else
        warn("[Fetcher] Failed to get:", path, response)
        return nil
    end
end

function fetcher.load(path, concat)
    local raw = fetcher.get(path)
    if not raw then return end
    raw = raw .. (concat or "")
    local func, err = loadstring(raw)
    if not func then
        warn("[Fetcher] Syntax error in", path, err)
        return
    end
    return func
end

local function IsPlace(Script)
    if Script.PlacesIds and table.find(Script.PlacesIds, game.PlaceId) then
        return true
    elseif Script.GameId and Script.GameId == game.GameId then
        return true
    end
end

for _, Script in ipairs(Scripts) do
    if IsPlace(Script) then
        return fetcher.load(Script.UrlPath)(fetcher, ...)
    end
end
