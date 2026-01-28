
# Concise
secure boot off (uefi)
arch install normally
sbctl status
sbctl create-keys
sbctl enroll-keys --microsoft
sbctl status
sbctl verify
sign each file here with sbctl sign: sbctl sign /boot/EFI/BOOT/BOOTX64.EFI ...
sbctl verify

https://github.com/linux-surface/linux-surface/wiki


# Pointer
https://chrismcleod.dev/blog/installing-arch-linux-with-secure-boot-on-a-microsoft-surface-laptop-studio/#fn2