-- HyDE core compatibility layer for Hyprland 0.57+.
-- This ports the active parts of ~/.local/share/hyde/hyprland.conf into Lua.

local home = os.getenv("HOME")
local configHome = os.getenv("XDG_CONFIG_HOME") or (home .. "/.config")
local dataHome = os.getenv("XDG_DATA_HOME") or (home .. "/.local/share")
local cacheHome = os.getenv("XDG_CACHE_HOME") or (home .. "/.cache")
local stateHome = os.getenv("XDG_STATE_HOME") or (home .. "/.local/state")
local runtimeDir = os.getenv("XDG_RUNTIME_DIR")
local hydeScripts = home .. "/.local/lib/hyde"
local path = table.concat({ home .. "/.local/bin", hydeScripts, os.getenv("PATH") or "" }, ":")
local hydeRuntimeDir = runtimeDir and (runtimeDir .. "/hyde") or ""

local function readHyDEVariables(pathname)
    local variables = {}
    local file = io.open(pathname, "r")
    if not file then
        return variables
    end

    for line in file:lines() do
        local normalized = line:gsub("%s+#.*$", "")
        local name, value = normalized:match("^%s*%$([%w_%-]+)%s*=%s*(.-)%s*$")
        if name then
            value = value:gsub("^['\"](.*)['\"]$", "%1")
            variables[name] = value
        end
    end
    file:close()
    return variables
end

local hydeTheme = readHyDEVariables(configHome .. "/hypr/themes/wallbash.conf")
local wallbashColors = readHyDEVariables(configHome .. "/hypr/themes/colors.conf")

-- Values currently active in Hyde's generated Tokyo Night theme files.
local theme = {
    gtk = hydeTheme.GTK_THEME or "Tokyo-Night",
    icons = hydeTheme.ICON_THEME or "Tela-circle-purple",
    cursor = hydeTheme.CURSOR_THEME or "Bibata-Modern-Ice",
    cursorSize = hydeTheme.CURSOR_SIZE or "24",
    font = hydeTheme.FONT or "Noto Sans CJK KR",
    fontSize = hydeTheme.FONT_SIZE or "10",
    documentFont = hydeTheme.DOCUMENT_FONT or "Cantarell",
    documentFontSize = hydeTheme.DOCUMENT_FONT_SIZE or "10",
    monospaceFont = hydeTheme.MONOSPACE_FONT or "CaskaydiaCove Nerd Font Mono",
    monospaceFontSize = hydeTheme.MONOSPACE_FONT_SIZE or "9",
}
local colorScheme = hydeTheme["COLOR-SCHEME"] or "prefer-dark"

local environment = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1",
    QT_QPA_PLATFORM = "wayland;xcb",
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1",
    QT_QPA_PLATFORMTHEME = "qt6ct",
    MOZ_ENABLE_WAYLAND = "1",
    GDK_SCALE = "1",
    ELECTRON_OZONE_PLATFORM_HINT = "auto",
    XDG_CURRENT_DESKTOP = "Hyprland",
    XDG_SESSION_TYPE = "wayland",
    XDG_SESSION_DESKTOP = "Hyprland",
    XDG_CONFIG_HOME = configHome,
    XDG_CACHE_HOME = cacheHome,
    XDG_DATA_HOME = dataHome,
    XDG_STATE_HOME = stateHome,
    PATH = path,
    HYDE_PATH = path,
    HYDE_THEME = hydeTheme.HYDE_THEME or "",
    HYDE_RUNTIME_DIR = hydeRuntimeDir,
    HYDE_CONFIG_HOME = configHome .. "/hyde",
    HYDE_CACHE_HOME = cacheHome .. "/hyde",
    HYDE_DATA_HOME = dataHome .. "/hyde",
    HYDE_STATE_HOME = stateHome .. "/hyde",
    GTK_THEME = theme.gtk,
    ICON_THEME = theme.icons,
    COLOR_SCHEME = colorScheme,
    XCURSOR_THEME = theme.cursor,
    XCURSOR_SIZE = theme.cursorSize,
    HYPRCURSOR_THEME = theme.cursor,
    HYPRCURSOR_SIZE = theme.cursorSize,
    FONT = theme.font,
    FONT_SIZE = theme.fontSize,
    DOCUMENT_FONT = theme.documentFont,
    DOCUMENT_FONT_SIZE = theme.documentFontSize,
    MONOSPACE_FONT = theme.monospaceFont,
    MONOSPACE_FONT_SIZE = theme.monospaceFontSize,
}

for name, value in pairs(environment) do
    hl.env(name, value)
end

local function shellQuote(value)
    return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

-- Core HyDE defaults that used to come from the sourced legacy config.
hl.config({
    decoration = {
        dim_special = 0.3,
        fullscreen_opacity = 1,
        blur = { special = true },
    },
    general = {
        snap = { enabled = true },
    },
    group = {
        col = {
            border_active = { colors = { "rgba(bb9af7ff)", "rgba(b4f9f8ff)" }, angle = 45 },
            border_inactive = { colors = { "rgba(565f89cc)", "rgba(9aa5cecc)" }, angle = 45 },
            border_locked_active = { colors = { "rgba(bb9af7ff)", "rgba(b4f9f8ff)" }, angle = 45 },
            border_locked_inactive = { colors = { "rgba(565f89cc)", "rgba(9aa5cecc)" }, angle = 45 },
        },
        groupbar = {
            enabled = true,
            gradients = true,
            render_titles = true,
            font_size = 12,
            font_family = theme.font,
            col = {
                inactive = "rgba(" .. (wallbashColors.wallbash_pry3 or "C1740A") .. "ee)",
                active = "rgba(" .. (wallbashColors.wallbash_pry1 or "220A03") .. "ee)",
                locked_active = "rgba(" .. (wallbashColors.wallbash_pry2 or "821F06") .. "ee)",
                locked_inactive = "rgba(" .. (wallbashColors.wallbash_pry4 or "F5EEDF") .. "ee)",
            },
        },
    },
    input = {
        numlock_by_default = true,
    },
    misc = {
        vrr = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        font_family = theme.font,
    },
    xwayland = {
        force_zero_scaling = true,
    },
})

-- The HyDE core also starts these shared services and runs the theme setup.
hl.on("hyprland.start", function()
    if runtimeDir then
        local directories = table.concat({
            runtimeDir .. "/hyde",
            cacheHome .. "/hyde/wallbash",
            configHome .. "/hyde",
            dataHome .. "/hyde",
            stateHome .. "/hyde",
        }, " ")
        hl.exec_cmd("mkdir -p " .. directories)

        local shellEnvironment = {
            _SHELL = os.getenv("SHELL") or "/bin/sh",
            _GTK_THEME = theme.gtk,
            _ICON_THEME = theme.icons,
            _COLOR_SCHEME = colorScheme,
            _CURSOR_THEME = theme.cursor,
            _CURSOR_SIZE = theme.cursorSize,
            FONT = theme.font,
            FONT_SIZE = theme.fontSize,
            DOCUMENT_FONT = theme.documentFont,
            DOCUMENT_FONT_SIZE = theme.documentFontSize,
            MONOSPACE_FONT = theme.monospaceFont,
            MONOSPACE_FONT_SIZE = theme.monospaceFontSize,
            TERMINAL = "kitty",
            LOCKSCREEN = "hyprlock",
        }
        for name, value in pairs(environment) do
            shellEnvironment[name] = value
        end

        local environmentLines = {}
        for name, value in pairs(shellEnvironment) do
            table.insert(environmentLines, name .. "=" .. shellQuote(value))
        end
        local environmentFile = runtimeDir .. "/hyde/environment"
        hl.exec_cmd(
            "printf '%s\\n' " .. shellQuote(table.concat(environmentLines, "\n")) ..
                " > " .. shellQuote(environmentFile)
        )
        hl.exec_cmd(hydeScripts .. "/keybinds.hint.py --format rofi > " .. runtimeDir .. "/hyde/keybinds_hint.rofi")
    end

    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd(hydeScripts .. "/resetxdgportal.sh")
    hl.exec_cmd(hydeScripts .. "/polkitkdeauth.sh")
    hl.exec_cmd("waybar")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("udiskie --no-automount --smart-tray")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd(hydeScripts .. "/wallpaper.sh --global")
    hl.exec_cmd(hydeScripts .. "/batterynotify.sh")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprctl setcursor " .. theme.cursor .. " " .. theme.cursorSize)

    -- Keep GTK/terminal defaults consistent with HyDE's dconf setup.
    local dconf = string.format(
        "printf '%%s\\n' '[org/gnome/desktop/interface]' " ..
        "\"gtk-theme='%s'\" \"icon-theme='%s'\" \"color-scheme='%s'\" " ..
        "\"cursor-theme='%s'\" \"cursor-size=%s\" \"font-name='%s %s'\" " ..
        "\"document-font-name='%s %s'\" \"monospace-font-name='%s %s'\" " ..
        "\"font-antialiasing='rgba'\" \"font-hinting='full'\" " ..
        "'[org/gnome/desktop/default-applications/terminal]' \"exec='$(which kitty)'\" | dconf load /",
        theme.gtk, theme.icons, colorScheme, theme.cursor, theme.cursorSize,
        theme.font, theme.fontSize, theme.documentFont, theme.documentFontSize,
        theme.monospaceFont, theme.monospaceFontSize
    )
    hl.exec_cmd(dconf)
    hl.exec_cmd("dconf update")
end)

-- HyDE core floating-window and panel blur defaults.
local function windowRule(name, match, effects)
    local spec = { name = name, match = match }
    for key, value in pairs(effects) do
        spec[key] = value
    end
    hl.window_rule(spec)
end

windowRule("hyde-float-satty", { class = "^com.gabm.satty$" }, { float = true })
windowRule("hyde-float-dolphin-dialogs", {
    class = "^org.kde.dolphin$",
    title = "(Progress Dialog — Dolphin|Copying — Dolphin)",
}, { float = true })
windowRule("hyde-float-firefox-about", { title = "^About Mozilla Firefox$" }, { float = true })
windowRule("hyde-float-firefox-pip-library", {
    class = "^firefox$",
    title = "(Picture-in-Picture|Library)",
}, { float = true })
windowRule("hyde-float-terminal-monitors", {
    initial_title = "(top|btop|htop)",
}, { float = true })
for _, class in ipairs({
    "^vlc$", "^kvantummanager$", "^qt5ct$", "^qt6ct$", "^nwg-look$",
    "^nwg-displays$", "^org.kde.ark$", "^org.pulseaudio.pavucontrol$",
    "^blueman-manager$", "^nm-applet$", "^nm-connection-editor$",
    "^org.kde.polkit-kde-authentication-agent-1$", "^[Xx]dg-desktop-portal-gtk$",
}) do
    windowRule("hyde-float-" .. class:gsub("[^%w]", ""), { class = class }, { float = true })
end

hl.layer_rule({ name = "hyde-blur-waybar", match = { namespace = "waybar" }, blur = true })
