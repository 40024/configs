
# Bootstrap
secure boot off (uefi)
arch install normally
sbctl status
sbctl create-keys
sbctl enroll-keys --microsoft
sbctl status
sbctl verify
sign each file here with sbctl sign: sbctl sign /boot/EFI/BOOT/BOOTX64.EFI ...
sbctl verify

# Hardware
curl -s https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \ sudo pacman-key --add -
pacman-key --finger 56C464BAAC421453
pacman-key --lsign-key 56C464BAAC421453
/etc/pacman.conf [linux-surface] Server = https://pkg.surfacelinux.com/arch/
pacman -Syu linux-surface linux-surface-headers iptsd libcamera libcamera-tools
cp /boot/loader/entries/2025-08-24_08-39-03_linux.conf /boot/loader/entries/2025-08-24_08-39-03_linux-surface.conf
vim /boot/loader/entries/2025-08-24_08-39-03_linux-surface.conf
    title   Arch Linux (linux-surface)
    linux   /vmlinuz-linux-surface
    initrd  /initramfs-linux-surface.img

vim /etc/mkinitcpio.conf
MODULES=(pinctrl_tigerlake surface_aggregator surface_aggregator_registry surface_aggregator_hub surface_hid_core surface_hid surface_kbd intel_lpss_pci 8250_dw)
mkinitcpio -P




https://github.com/linux-surface/linux-surface/wiki


# Pointer
https://chrismcleod.dev/blog/installing-arch-linux-with-secure-boot-on-a-microsoft-surface-laptop-studio/#fn2
