-- Personal preferences previously kept in userprefs.conf.

hl.env("EDITOR", "nvim")

local personalStartup = {
    "signal-desktop",
    "tutanota-desktop",
    "xbindkeys", -- Pretty sure this is useless
    "tmux has-session -t wlsunset 2>/dev/null || tmux new-session -d -s wlsunset 'wlsunset -l 37.3349 -L -122.0090 -t 3900 -T 6500 -g 1.0 -d 1800'",
    "awww-daemon",
    "python /home/v/bin/dynamic_wallpaper.py",
    "tmux has-session -t easyeffects 2>/dev/null || tmux new-session -d -s easyeffects 'flatpak run com.github.wwmm.easyeffects --gapplication-service'",
}

hl.on("hyprland.start", function()
    for _, command in ipairs(personalStartup) do
        hl.exec_cmd(command)
    end
end)
