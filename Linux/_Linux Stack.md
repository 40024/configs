
## Install
iwctl
station device_name scan
station device_name get-networks
station device_name connect "nw"
station device_name show

pacman -Sy && pacman-key --init && pacman -S archlinux-keyring && archinstall

no subvolumes or home

neovim
iwd
git
ufw
sbctl

sudo systemctl enable ufw

if on surface use custom kernel, https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup install guide and make new file in /boot/loader/entries change title linux initrd

edit kernel modules loading, regenerate kernel image /etc/mkinicpio.conf
MODULES=(pinctrl_tigerlake surface_aggregator surface_aggregator_registry surface_aggregator_hub surface_hid_core surface_hid surface_kbd intel_lpss_pci 8250_dw)
sudo mkinitcpio -P

sbctl verify, create-keys, enroll-keys <xyz>, status, verify, sign, verify

Install guide https://www.youtube.com/watch?v=2ZSqTQq6BFI


## Post Install
code as default
ssh
keepass
copy docs/

_Core Stack

.config


## Install Notes
PipeWire (Instead of PulseAudio)
Easy Effects +deps (-Qi easyeffects)
i3 (backup DM: startx i3)
Display settings

## Settings
xdg-settings default-web-browser
xdg-mime query default text/plain
proton enable
KPDB
~/.config/autostart/signal-desktop.desktop
nmcli connection import type <type> file <file>

## Terminal Utilities
- Btop
- curl
- Fastfetch
- Fzf
- wget
- zsh
- Nvim
- kitty, ghostty (nvim dedicated)
- Nerdfonts (pacman -S nerd-fonts)
- xsel

## Window Managers/Desktop Environments
- Hyperland
- xrandr --output DP-1 --primary

## Audio Tools
- Easyeffects
- pavucontrol
- pipewire

## Productivity Apps
- Rofi (+.local/lib/hyde/rofilaunch.sh --sorting-method fzf)
- Signal
- evolution
- papers
- libreoffice

## Utility Tools
- keyd (+config)
- qalc
- ytdlp

## Image/Display Tools
- obs
- Digikam
- nwg displays
- satty
- loupe
- shotcut
- swww
- wlsunset

## Status Bars
- waybar

## System Management Tools
- wlogout
- swaync

## Password Management
- kpxc
- gnome keyring




keepassxc
exfatprogs
swaync
hyprland
neovim
zsh
kitty
btop
curl
fastfetch
fzf
wget
easyeffects
pavucontrol
pipewire
rofi
signal-desktop
keyd
yt-dlp
obs-studio
digikam
nwg-displays
satty
feh
swww
wlsunset
waybar
tmux
