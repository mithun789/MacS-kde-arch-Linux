#!/bin/bash

THEME_NAME="MacSonoma-kde"
INSTALL_DIR="$HOME/.local/share/plasma/desktoptheme/$THEME_NAME"

# Install required dependencies
echo "Installing required packages..."
sudo pacman -S --needed \
    plasma \
    qt6-base \
    qt6-declarative \
    kwin \
    breeze

# Create installation directory
mkdir -p "$INSTALL_DIR"

# Copy theme files
cp -r ./blur-effects/* "$INSTALL_DIR/"
cp -r ./widgets/* "$INSTALL_DIR/"
cp metadata.json "$INSTALL_DIR/"

# Apply blur effect settings
kwriteconfig6 --file kwinrc --group Compositing --key GLCore "true"
kwriteconfig6 --file kwinrc --group Compositing --key Backend "OpenGL"
kwriteconfig6 --file kwinrc --group Effect-Blur --key BlurStrength "15"

# Install additional components from AUR only if needed
if [ ! -f "$HOME/.local/share/plasma/plasmoids/launchpad-plasma/metadata.json" ]; then
    echo "Installing launchpad-plasma from AUR..."
    yay -S --needed plasma6-applets-launchpad
fi

# Restart KWin
qdbus org.kde.KWin /KWin reconfigure

echo "Installation completed! Please log out and log back in to apply all changes."
echo "For the best experience, make sure to enable blur effects in System Settings → Workspace Behavior → Desktop Effects"
