-- Personal preferences previously kept in userprefs.conf.

hl.env("EDITOR", "nvim")

local personalStartup = {
    "signal-desktop",
    "tutanota-desktop",
    "xbindkeys", -- Pretty sure this is useless
    "awww-daemon",
    "python /home/v/bin/dynamic_wallpaper.py",
    "opencode &",
    "tmux has-session -t auto 2>/dev/null || tmux new-session -d -s auto 'python3 /home/v/bin/auto.py --device /dev/input/event6; exit'",
    "tmux has-session -t easyeffects 2>/dev/null || tmux new-session -d -s easyeffects 'flatpak run com.github.wwmm.easyeffects --gapplication-service'",
    "tmux has-session -t wlsunset 2>/dev/null || tmux new-session -d -s wlsunset 'wlsunset -l 37.3349 -L -122.0090 -t 3900 -T 6500 -g 1.0 -d 1800'",
}

hl.on("hyprland.start", function()
    for _, command in ipairs(personalStartup) do
        hl.exec_cmd(command)
    end
end)
