#!/bin/bash

THEME_NAME="MacSonoma-kde"
INSTALL_DIR="$HOME/.local/share/plasma/desktoptheme/$THEME_NAME"

# Check if yay is installed (for AUR packages)
if ! command -v yay &> /dev/null; then
    echo "Installing yay (AUR helper)..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

# Install required dependencies
echo "Installing required packages..."
sudo pacman -S --needed \
    plasma-desktop \
    plasma-framework \
    kdecoration \
    kwin \
    breeze \
    qt5-base \
    qt5-declarative

# Install AUR packages
echo "Installing AUR packages..."
yay -S --needed \
    plasma5-applets-window-appmenu \
    plasma5-applets-window-title \
    latte-dock-git

# Create installation directory
mkdir -p "$INSTALL_DIR"

# Copy theme files
cp -r ./blur-effects/* "$INSTALL_DIR/"
cp -r ./widgets/* "$INSTALL_DIR/"
cp metadata.json "$INSTALL_DIR/"

# Apply blur effect settings
kwriteconfig5 --file kwinrc --group Compositing --key GLCore "true"
kwriteconfig5 --file kwinrc --group Compositing --key Backend "OpenGL"
kwriteconfig5 --file kwinrc --group Effect-Blur --key BlurStrength "15"

# Install additional components
echo "Installing additional plasmoids..."
plasmapkg2 -i launchpad-plasma.plasmoid
plasmapkg2 -i kapplemenu.plasmoid
plasmapkg2 -i kde-control-station.plasmoid

# Enable required services
echo "Enabling services..."
systemctl --user enable plasma-kwin_x11.service
systemctl --user enable plasma-plasmashell.service

# Restart KWin
qdbus org.kde.KWin /KWin reconfigure

echo "Installation completed! Please log out and log back in to apply all changes."
echo "For the best experience, make sure to enable blur effects in System Settings → Workspace Behavior → Desktop Effects"
