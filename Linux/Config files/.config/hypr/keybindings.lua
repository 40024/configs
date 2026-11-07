-- Migrated from keybindings.conf; kept in its own module for easy editing.
---------------------
---- KEYBINDINGS ----
---------------------
-- Migrated from HyDE's legacy keybindings.conf for Hyprland 0.57+
-- This file uses the Hyprland Lua API (hl.bind / hl.dsp).
--
-- Load from hyprland.lua with require("keybindings").
--
-- Custom bindings are unbound first so they replace HyDE defaults on the
-- same key combination instead of firing alongside them.

local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "dolphin"
local editor = "code"
local browser = "vivaldi"
local volumeApp = "pavucontrol"
local harness = "opencode"

local home = os.getenv("HOME")
-- This is HyDE's $scrPath in ~/.local/share/hyde/hyprland.conf.
local scrPath = home .. "/.local/lib/hyde"
local powerMenu = home .. "/bin/power_menu.py"

local function bind(keys, dispatcher, description, flags)
    flags = flags or {}
    flags.description = description
    hl.unbind(keys)
    hl.bind(keys, dispatcher, flags)
end

local function run(keys, command, description, flags)
    bind(keys, hl.dsp.exec_cmd(command), description, flags)
end

-- ============================================================
-- WINDOW MANAGEMENT
-- ============================================================

-- General management
bind(mainMod .. " + Q",  hl.dsp.window.close(), "[Window Management] close focused window")
bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), "[Window Management] toggle float")
bind(mainMod .. " + G", hl.dsp.group.toggle(), "[Window Management] toggle group")
run(mainMod .. " + N", "lockscreen.sh", "[Window Management] lock screen")
run(mainMod .. " + SHIFT + F", scrPath .. "/windowpin.sh", "[Window Management] toggle pin on focused window")
run(mainMod .. " + DELETE", powerMenu, "[Window Management] power menu")
bind("SHIFT + F11", hl.dsp.window.fullscreen({ action = "toggle" }), "[Window Management] toggle fullscreen")

-- Group navigation
bind(mainMod .. " + CTRL + H", hl.dsp.group.prev(), "[Window Management|Group Navigation] change active group backwards")
bind(mainMod .. " + CTRL + L", hl.dsp.group.next(), "[Window Management|Group Navigation] change active group forwards")

-- Focus direction
for _, item in ipairs({
    { "LEFT", "left", "focus left" },
    { "RIGHT", "right", "focus right" },
    { "UP", "up", "focus up" },
    { "DOWN", "down", "focus down" },
}) do
    bind(mainMod .. " + " .. item[1], hl.dsp.focus({ direction = item[2] }), "[Window Management|Change focus] " .. item[3])
end

-- Vim-style focus keys (preserving the original J/P/L/K layout)
for _, item in ipairs({
    { "J", "left", "focus left" },
    { "P", "right", "focus right" },
    { "L", "up", "focus up" },
    { "K", "down", "focus down" },
}) do
    bind(mainMod .. " + " .. item[1], hl.dsp.focus({ direction = item[2] }), "[Window Management|Change focus] " .. item[3])
end

-- Resize active window. repeating=true preserves bindde behavior.
for _, item in ipairs({
    { "LEFT", -30, 0, "resize window left" },
    { "RIGHT", 30, 0, "resize window right" },
    { "UP", 0, -30, "resize window up" },
    { "DOWN", 0, 30, "resize window down" },
}) do
    bind(mainMod .. " + SHIFT + " .. item[1], hl.dsp.window.resize({ x = item[2], y = item[3], relative = true }), "[Window Management|Resize Active Window] " .. item[4], { repeating = true })
end

-- Move active window: floating windows move by pixels; tiled windows move
-- to the adjacent tile. SUPER+ALT+K is used for down because Calendar keeps
-- the old SUPER+SHIFT+K shortcut.
local function moveActive(dx, dy, direction)
    local command = string.format(
        'if [ "$(hyprctl activewindow -j | jq -r .floating)" = "true" ]; then ' ..
        'hyprctl dispatch moveactive %d %d; else hyprctl dispatch movewindow %s; fi',
        dx, dy, direction
    )
    return hl.dsp.exec_cmd(command)
end

bind(mainMod .. " + SHIFT + J", moveActive(-30, 0, "l"), "[Window Management|Move active window across workspace] move active window to the left", { repeating = true })
bind(mainMod .. " + SHIFT + P", moveActive(30, 0, "r"), "[Window Management|Move active window across workspace] move active window to the right", { repeating = true })

-- Mouse move/resize, plus the original keyboard-triggered interactive actions.
bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), "[Window Management|Move & Resize with mouse] hold to move window", { mouse = true })
bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), "[Window Management|Move & Resize with mouse] hold to resize window", { mouse = true })
bind(mainMod .. " + Z", hl.dsp.window.drag(), "[Window Management|Move & Resize with mouse] hold to move window", { mouse = true })
bind(mainMod .. " + X", hl.dsp.window.resize(), "[Window Management|Move & Resize with mouse] hold to resize window", { mouse = true })

-- ============================================================
-- LAUNCHERS / APPLICATIONS
-- ============================================================

run(mainMod .. " + T", terminal, "[Launcher|Apps] terminal emulator")
run(mainMod .. " + E", fileManager, "[Launcher|Apps] file explorer")
run(mainMod .. " + C", editor, "[Launcher|Apps] text editor")
run(mainMod .. " + SHIFT + K", "gnome-calendar", "[Launcher|Apps] calendar")
run(mainMod .. " + SHIFT + C", 'env NVIM_APPNAME=nvim-lazy kitty -e nvim -c "autocmd VimEnter * ++once lua vim.schedule(function() vim.cmd(\'enew\'); vim.cmd(\'startinsert\') end)"', "[Launcher|Apps] quick text editor")
run(mainMod .. " + SHIFT + M", "tutanota-desktop", "[Launcher|Apps] email")
run(mainMod .. " + R", "keepassxc", "[Launcher|Apps] password manager")
run(mainMod .. " + SHIFT + T", "gnome-clocks", "[Launcher|Apps] timer")
run(mainMod .. " + B", browser, "[Launcher|Apps] web browser")
run(mainMod .. " + M", volumeApp, "[Launcher|Apps] volume control")
run(mainMod .. " + SHIFT + L", "kitty -e " .. harness, "[Launcher|Apps] LLM harness")
run(mainMod .. " + F", "kitty -e btop", "[Launcher|Apps] system monitor")

-- Rofi menus
local rofiLaunch = scrPath .. "/rofilaunch.sh"

run(mainMod .. " + A", "rofi -show drun", "[Launcher|Rofi menus] application finder")
run(mainMod .. " + TAB", "pkill -x rofi || " .. rofiLaunch .. " w", "[Launcher|Rofi menus] window switcher")
run(mainMod .. " + slash", "pkill -x rofi || " .. scrPath .. "/keybinds_hint.sh c", "[Launcher|Rofi menus] keybindings hint")
run(mainMod .. " + comma", "pkill -x rofi || " .. scrPath .. "/emoji-picker.sh", "[Launcher|Rofi menus] emoji picker")
run(mainMod .. " + period", "pkill -x rofi || " .. scrPath .. "/glyph-picker.sh", "[Launcher|Rofi menus] glyph picker")
run(mainMod .. " + V", "pkill -x rofi || " .. scrPath .. "/cliphist.sh -c", "[Launcher|Rofi menus] clipboard")
run(mainMod .. " + SHIFT + V", "pkill -x rofi || " .. scrPath .. "/cliphist.sh", "[Launcher|Rofi menus] clipboard manager")

-- ============================================================
-- HARDWARE CONTROLS
-- ============================================================

local volumeScript = scrPath .. "/volumecontrol.sh"
local brightnessScript = scrPath .. "/brightnesscontrol.sh"

run("F10", volumeScript .. " -o m", "[Hardware Controls|Audio] toggle mute output", { locked = true })
run("XF86AudioMute", volumeScript .. " -o m", "[Hardware Controls|Audio] toggle mute output", { locked = true })
run("F11", volumeScript .. " -o d", "[Hardware Controls|Audio] decrease volume", { locked = true, repeating = true })
run("F12", volumeScript .. " -o i", "[Hardware Controls|Audio] increase volume", { locked = true, repeating = true })
run("XF86AudioMicMute", volumeScript .. " -i m", "[Hardware Controls|Audio] un/mute microphone", { locked = true })
run("XF86AudioLowerVolume", volumeScript .. " -o d", "[Hardware Controls|Audio] decrease volume", { locked = true, repeating = true })
run("XF86AudioRaiseVolume", volumeScript .. " -o i", "[Hardware Controls|Audio] increase volume", { locked = true, repeating = true })

-- Media
run("XF86AudioPlay", "playerctl play-pause", "[Hardware Controls|Media] play media", { locked = true })
run("XF86AudioPause", "playerctl play-pause", "[Hardware Controls|Media] pause media", { locked = true })
run("XF86AudioNext", "playerctl next", "[Hardware Controls|Media] next media", { locked = true })
run("XF86AudioPrev", "playerctl previous", "[Hardware Controls|Media] previous media", { locked = true })

-- Brightness
run("XF86MonBrightnessUp", brightnessScript .. " i", "[Hardware Controls|Brightness] increase brightness", { locked = true, repeating = true })
run("XF86MonBrightnessDown", brightnessScript .. " d", "[Hardware Controls|Brightness] decrease brightness", { locked = true, repeating = true })

-- ============================================================
-- UTILITIES
-- ============================================================

run(mainMod .. " + ALT + G", scrPath .. "/gamemode.sh", "[Utilities] game mode")

-- Screen capture
run(mainMod .. " + SHIFT + O", "hyprpicker -an", "[Utilities|Screen Capture] color picker")
run(mainMod .. " + SHIFT + H", scrPath .. "/screenshot.sh s", "[Utilities|Screen Capture] snip screen")
run(mainMod .. " + H", scrPath .. "/screenshot.sh sf", "[Utilities|Screen Capture] freeze and snip screen")
run(mainMod .. " + ALT + P", scrPath .. "/screenshot.sh m", "[Utilities|Screen Capture] print monitor", { locked = true })
run("Print", scrPath .. "/screenshot.sh p", "[Utilities|Screen Capture] print all monitors", { locked = true })

-- Wallpaper/theme binds intentionally remain disabled, as in the old file.

-- ============================================================
-- WORKSPACES
-- ============================================================

-- Navigate to workspaces 1-10.
for i = 1, 10 do
    local key = (i == 10) and "0" or tostring(i)
    bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), "[Workspaces|Navigation] navigate to workspace " .. i)

    bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i }), "[Workspaces|Move window to workspace] move to workspace " .. i)

    bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }), "[Workspaces|Navigation|Move window silently] move to workspace " .. i .. " (silent)")
end

-- Relative workspace navigation
bind(mainMod .. " + CTRL + RIGHT", hl.dsp.focus({ workspace = "r+1" }), "[Workspaces|Navigation|Relative workspace] change active workspace forwards")
bind(mainMod .. " + CTRL + LEFT", hl.dsp.focus({ workspace = "r-1" }), "[Workspaces|Navigation|Relative workspace] change active workspace backwards")

bind(mainMod .. " + CTRL + DOWN", hl.dsp.focus({ workspace = "empty" }), "[Workspaces|Navigation] navigate to the nearest empty workspace")

-- Move window to relative workspace
bind(mainMod .. " + CTRL + ALT + RIGHT", hl.dsp.window.move({ workspace = "r+1" }), "[Workspaces] move window to next relative workspace")
bind(mainMod .. " + CTRL + ALT + LEFT", hl.dsp.window.move({ workspace = "r-1" }), "[Workspaces] move window to previous relative workspace")

-- Scroll through existing workspaces
bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), "[Workspaces|Navigation] next workspace")
bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), "[Workspaces|Navigation] previous workspace")

-- Special workspace / scratchpad
bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }), "[Workspaces|Navigation|Special workspace] move to scratchpad")
run(mainMod .. " + ALT + S", "hyprctl dispatch movetoworkspacesilent special", "[Workspaces|Navigation|Special workspace] move to scratchpad (silent)")
run(mainMod .. " + S", "hyprctl dispatch togglespecialworkspace", "[Workspaces|Navigation|Special workspace] toggle scratchpad")
