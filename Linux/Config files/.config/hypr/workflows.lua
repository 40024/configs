-- Workflow overrides, loaded last just like workflows.conf used to be.
-- The active workflow is "default"; edit this selector to activate another.

local configHome = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
local activeWorkflow = "default"
local workflowSelector = io.open(configHome .. "/hypr/workflows.conf", "r")
if workflowSelector then
    for line in workflowSelector:lines() do
        local selected = line:match("^%s*%$WORKFLOW%s*=%s*([%w_-]+)")
        if selected then
            activeWorkflow = selected
            break
        end
    end
    workflowSelector:close()
end

local workflows = {
    default = {},

    editing = {
        config = {
            decoration = {
                blur = { enabled = true },
                active_opacity = 1,
                inactive_opacity = 1,
                fullscreen_opacity = 1,
            },
        },
        layerRules = {
            { namespace = "waybar", blur = true },
            { namespace = "dunst", blur = true },
            { namespace = "swaync-notification-window", blur = true },
            { namespace = "rofi", blur = true },
        },
        windowRules = {
            { name = "workflow-editing-opaque", match = { class = ".*" }, opaque = true },
        },
    },

    gaming = {
        config = {
            decoration = {
                shadow = { enabled = false },
                blur = { enabled = false },
                rounding = 0,
            },
            general = {
                gaps_in = 0,
                gaps_out = 0,
                border_size = 1,
            },
            animations = { enabled = false },
        },
    },

    powersaver = {
        config = {
            decoration = {
                shadow = { enabled = false },
                blur = { enabled = false },
                rounding = 0,
                active_opacity = 1,
                inactive_opacity = 1,
                fullscreen_opacity = 1,
            },
            general = {
                gaps_in = 0,
                gaps_out = 0,
                border_size = 1,
            },
            animations = { enabled = false },
        },
        layerRules = {
            { namespace = "waybar", no_anim = true },
            { namespace = "swaync-notification-window", no_anim = true },
            { namespace = "swww-daemon", no_anim = true },
            { namespace = "rofi", no_anim = true },
        },
        windowRules = {
            { name = "workflow-powersaver-opaque", match = { class = ".*" }, opaque = true },
        },
    },

    snappy = {
        config = {
            decoration = { rounding = 0 },
            general = {
                gaps_in = 0,
                gaps_out = 0,
                border_size = 1,
            },
            animations = { enabled = false },
        },
    },
}

local selected = workflows[activeWorkflow]
if selected then
    if selected.config then
        hl.config(selected.config)
    end
    for _, rule in ipairs(selected.windowRules or {}) do
        hl.window_rule(rule)
    end
    for _, rule in ipairs(selected.layerRules or {}) do
        hl.layer_rule(rule)
    end
end
