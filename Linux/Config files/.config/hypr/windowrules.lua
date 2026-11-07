-- Window/layer rules ported from windowrules.conf.

local function windowRule(name, match, effects)
    local spec = { name = name, match = match }
    for key, value in pairs(effects) do
        spec[key] = value
    end
    hl.window_rule(spec)
end

local function layerRule(name, namespace, effects)
    local spec = { name = name, match = { namespace = namespace } }
    for key, value in pairs(effects) do
        spec[key] = value
    end
    hl.layer_rule(spec)
end

-- Keep games on the external primary display and stop Steam stealing focus.
windowRule("games-on-primary", { class = "^(steam_app_.*)$" }, { monitor = "DP-1" })
windowRule("steam-no-initial-focus", { class = "^(steam)$" }, { no_initial_focus = true })
windowRule("steam-games-no-initial-focus", { class = "^(steam|steam_app_.*)$" }, { no_initial_focus = true })
windowRule("steam-games-no-focus-on-activate", { class = "^(steam|steam_app_.*)$" }, { focus_on_activate = false })

-- Transparency and media windows.
windowRule("kitty-opacity", { class = "^kitty$" }, { opacity = "0.80 0.80 1" })

for _, class in ipairs({ "^org.gnome.Loupe$", "^feh$", "^mpv$" }) do
    local id = class:gsub("[^%w]", "")
    windowRule("float-" .. id, { class = class }, { float = true })
    windowRule("center-" .. id, { class = class }, { center = true })
end

windowRule("pavucontrol-size", { class = "^org.pulseaudio.pavucontrol$" }, { size = { 600, 700 } })

local opacityRules = {
    { "^com.github.rafostar.Clapper$", "0.90 0.90" },
    { "^com.github.tchx84.Flatseal$", "0.80 0.80" },
    { "^hu.kramo.Cartridges$", "0.80 0.80" },
    { "^com.obsproject.Studio$", "0.80 0.80" },
    { "^gnome-boxes$", "0.80 0.80" },
    { "^vesktop$", "0.80 0.80" },
    { "^WebCord$", "0.80 0.80" },
    { "^ArmCord$", "0.80 0.80" },
    { "^app.drey.Warp$", "0.80 0.80" },
    { "^net.davidotek.pupgui2$", "0.80 0.80" },
    { "^yad$", "0.80 0.80" },
    { "^Signal$", "0.80 0.80" },
    { "^io.github.alainm23.planify$", "0.80 0.80" },
    { "^io.gitlab.theevilskeleton.Upscaler$", "0.80 0.80" },
    { "^com.github.unrud.VideoDownloader$", "0.80 0.80" },
    { "^io.gitlab.adhami3310.Impression$", "0.80 0.80" },
    { "^io.missioncenter.MissionCenter$", "0.80 0.80" },
    { "^io.github.flattool.Warehouse$", "0.80 0.80" },
}

for _, entry in ipairs(opacityRules) do
    local id = entry[1]:gsub("[^%w]", "")
    windowRule("opacity-" .. id, { class = entry[1] }, { opacity = entry[2] })
end

-- Dialogs and floating utilities.
windowRule("float-dolphin-progress", {
    class = "^org.kde.dolphin$",
    title = "(Progress Dialog — Dolphin|Copying — Dolphin)",
}, { float = true })
windowRule("float-firefox-about", { title = "^About Mozilla Firefox$" }, { float = true })
windowRule("float-firefox-pip-library", {
    class = "^firefox$",
    title = "(Picture-in-Picture|Library)",
}, { float = true })
windowRule("float-terminal-monitors", {
    class = "^kitty$",
    title = "^(top|btop|htop)$",
}, { float = true })

local floatingClasses = {
    "^vlc$",
    "^kvantummanager$",
    "^qt5ct$",
    "^qt6ct$",
    "^nwg-look$",
    "^org.kde.ark$",
    "^org.pulseaudio.pavucontrol$",
    "^blueman-manager$",
    "^nm-applet$",
    "^nm-connection-editor$",
    "^org.kde.polkit-kde-authentication-agent-1$",
    "^com.github.rafostar.Clapper$",
    "^app.drey.Warp$",
    "^net.davidotek.pupgui2$",
    "^yad$",
    "^eog$",
    "^io.github.alainm23.planify$",
    "^io.gitlab.theevilskeleton.Upscaler$",
    "^com.github.unrud.VideoDownloader$",
    "^io.missioncenter.MissionCenter$",
}

for _, class in ipairs(floatingClasses) do
    local id = class:gsub("[^%w]", "")
    windowRule("float-user-" .. id, { class = class }, { float = true })
end

for _, title in ipairs({
    "^(Choose Files)$",
    "^(Save As)$",
    "^(Confirm to replace files)$",
    "^(File Operation Progress)$",
}) do
    windowRule("float-file-dialog-" .. title:gsub("[^%w]", ""), { title = title }, { float = true })
end
windowRule("float-xdg-desktop-portal-gtk", {
    class = "^(xdg-desktop-portal-gtk)$",
}, { float = true })

-- Blur translucent layer surfaces used by HyDE/Hyprland tools.
for _, namespace in ipairs({ "rofi", "notifications", "swaync-notification-window", "swaync-control-center" }) do
    local id = namespace:gsub("[^%w]", "")
    layerRule("blur-" .. id, namespace, { blur = true })
    layerRule("ignore-alpha-" .. id, namespace, { ignore_alpha = 0 })
end
layerRule("blur-logout-dialog", "logout_dialog", { blur = true })
