-- Load the profile selected by HyDE's animations.conf, translated to the Lua API.

local configHome = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
local hyprDir = configHome .. "/hypr"
local selector = io.open(hyprDir .. "/animations.conf", "r")
local profilePath

if selector then
    for line in selector:lines() do
        local value = line:match("^%s*%$ANIMATION_PATH%s*=%s*(.-)%s*$")
        if value then
            profilePath = value:gsub("^['\"](.*)['\"]$", "%1")
            break
        end
    end
    selector:close()
end

if not profilePath then
    profilePath = "./animations/disable.conf"
end

profilePath = profilePath:gsub("^%./", "")
if profilePath:sub(1, 1) ~= "/" then
    profilePath = hyprDir .. "/" .. profilePath
end

local profile = io.open(profilePath, "r")
if not profile then
    hl.config({ animations = { enabled = false } })
    return
end

local curves = {}
local animationLines = {}
local animationsEnabled

local function trim(value)
    return (value:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function splitComma(value)
    local fields = {}
    for field in value:gmatch("([^,]+)") do
        table.insert(fields, trim(field))
    end
    return fields
end

for line in profile:lines() do
    local normalized = trim(line:gsub("%s+#.*$", ""))
    if normalized ~= "" and normalized ~= "animations {" and normalized ~= "}" then
        local key, value = normalized:match("^([%w_:%-]+)%s*=%s*(.-)%s*$")
        if key == "enabled" or key == "animations:enabled" then
            animationsEnabled = value == "true" or value == "yes" or value == "on" or value == "1"
        elseif key == "bezier" then
            local fields = splitComma(value)
            if #fields >= 5 then
                local name = fields[1]
                local x1, y1, x2, y2 =
                    tonumber(fields[2]), tonumber(fields[3]), tonumber(fields[4]), tonumber(fields[5])
                if x1 and y1 and x2 and y2 then
                    curves[name] = { type = "bezier", points = { { x1, y1 }, { x2, y2 } } }
                end
            end
        elseif key == "animation" then
            table.insert(animationLines, value)
        end
    end
end
profile:close()

if animationsEnabled ~= nil then
    hl.config({ animations = { enabled = animationsEnabled } })
end

for name, curve in pairs(curves) do
    hl.curve(name, curve)
end

for _, line in ipairs(animationLines) do
    local fields = splitComma(line)
    if #fields >= 2 then
        local spec = {
            leaf = fields[1],
            enabled = fields[2] == "1" or fields[2] == "true" or fields[2] == "yes" or fields[2] == "on",
        }
        if fields[3] then spec.speed = tonumber(fields[3]) end
        if fields[4] then spec.bezier = fields[4] end
        if fields[5] then spec.style = table.concat(fields, " ", 5) end
        hl.animation(spec)
    end
end
