-- Appearance defaults ported from the current HyDE Tokyo Night theme.
-- Supported values are overridden from themes/theme.conf below so theme
-- changes continue to work. The selected animation profile loads separately.

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = {
                colors = { "rgba(bb9af7ff)", "rgba(b4f9f8ff)" },
                angle = 45,
            },
            inactive_border = {
                colors = { "rgba(565f89cc)", "rgba(9aa5cecc)" },
                angle = 45,
            },
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        active_opacity = 0.90,
        inactive_opacity = 0.75,
        shadow = { enabled = false },
        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
        },
    },
    animations = {
        enabled = false,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    scrolling = {
        fullscreen_on_one_column = true,
    },
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        force_no_accel = true,
        touchpad = {
            natural_scroll = false,
        },
    },
    layers = {
        allow_new_top_layers_over_existing_fullscreen = true,
    },
})

-- HyDE writes the currently selected theme to this file. Read the supported
-- settings as data so theme switches continue to work without sourcing a .conf.
local configHome = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
local themeFile = io.open(configHome .. "/hypr/themes/theme.conf", "r")

local function trim(value)
    return (value:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function parseValue(value)
    value = trim(value:gsub("%s+#.*$", ""))
    local first, second, angle = value:match("^(%S+)%s+(%S+)%s+([%-]?[%d%.]+)deg$")
    if first then
        return { colors = { first, second }, angle = tonumber(angle) }
    end
    if value == "yes" or value == "on" or value == "true" then return true end
    if value == "no" or value == "off" or value == "false" then return false end
    return tonumber(value) or value
end

local function setPath(root, path, value)
    local parts = {}
    for part in path:gmatch("[^%.]+") do
        table.insert(parts, part)
    end
    local target = root
    for index = 1, #parts - 1 do
        target[parts[index]] = target[parts[index]] or {}
        target = target[parts[index]]
    end
    target[parts[#parts]] = value
end

if themeFile then
    local sections = {}
    local themeOverrides = {}
    local themeLayers = {}

    for line in themeFile:lines() do
        local normalized = trim(line:gsub("%s+#.*$", ""))
        if normalized ~= "" then
            local section = normalized:match("^([%w_:%-]+)%s*{%s*$")
            if section then
                table.insert(sections, (section:gsub(":", ".")))
            elseif normalized:match("^}%s*$") then
                table.remove(sections)
            else
                local key, value = normalized:match("^([%w_%.:%-]+)%s*=%s*(.-)%s*$")
                if key then
                    key = key:gsub(":", ".")
                    local prefix = table.concat(sections, ".")
                    local fullPath = prefix ~= "" and (prefix .. "." .. key) or key
                    if fullPath == "layerrule" then
                        local effect, namespace = value:match("^%s*([^,]+),%s*(.-)%s*$")
                        if effect and namespace then
                            table.insert(themeLayers, { effect = trim(effect), namespace = trim(namespace) })
                        end
                    elseif not fullPath:match("^%$") then
                        setPath(themeOverrides, fullPath, parseValue(value))
                    end
                end
            end
        end
    end
    themeFile:close()

    if next(themeOverrides) then
        hl.config(themeOverrides)
    end
    for index, rule in ipairs(themeLayers) do
        if rule.effect == "blur" then
            hl.layer_rule({
                name = "hyde-theme-layer-blur-" .. index,
                match = { namespace = rule.namespace },
                blur = true,
            })
        end
    end
end

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
