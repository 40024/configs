#!/bin/bash
set -e

# Update official ARM repos
sudo pacman -Syu --noconfirm

# Install core packages from Arch Linux ARM repos
sudo pacman -S --noconfirm \
    zsh \
    curl \
    wget \
    fzf \
    neovim \
    fastfetch \
    hyprland \
    kitty \
    pipewire \
    pavucontrol \
    rofi \
    waybar \
    gnome-keyring \
    libreoffice \
    base-devel \
    git

# Optional: Nerd Fonts (if available in ARM repos)
sudo pacman -S --noconfirm nerd-fonts

echo "✔ Official ARM repo packages installed."

# Create a build directory for AUR / source builds
mkdir -p ~/aur-build
cd ~/aur-build

# List of packages likely buildable from AUR or source
AUR_PKGS=(
    btop
    easyeffects
    keyd
    qalc
    ytdlp
    nwg-displays
    swww
    wlsunset
    satty
    loupe
    wlogout
    swaync
    digikam
    shotcut
)

echo "Starting AUR/source builds…"

for pkg in "${AUR_PKGS[@]}"; do
    echo "🛠 Building $pkg from AUR/source…"
    git clone https://aur.archlinux.org/${pkg}.git || continue
    cd "$pkg"
    makepkg -si --noconfirm || echo "⚠ Failed building $pkg"
    cd ..
done

echo "✔ AUR/source builds complete!"

echo "
🎉 Setup done! A few packages *may still fail* to build because upstream doesn’t support aarch64 — see the notes below.
"

echo "
❗ Problematic packages not handled here:
 - **Signal Desktop**: No official ARM64 build; unlikely to install.
 - **OBS Studio**: May build but GPU support & deps are tricky on ARM.
"

echo "You’re ready to log out and start Hyprland with Wayland!"
