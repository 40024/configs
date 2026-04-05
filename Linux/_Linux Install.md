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


## Install Notes
PipeWire (Instead of PulseAudio)
Easy Effects +deps (-Qi easyeffects)
i3 (backup DM: startx i3)
Display settings
