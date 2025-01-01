#!/bin/bash

THEME_NAME="MacSonoma-kde"
INSTALL_DIR="$HOME/.local/share/plasma/desktoptheme/$THEME_NAME"

# Remove theme files
rm -rf "$INSTALL_DIR"

# Reset blur effect settings
kwriteconfig6 --file kwinrc --group Effect-Blur --key BlurStrength "5"

# Restart KWin
qdbus org.kde.KWin /KWin reconfigure

echo "Uninstallation completed. Please log out and log back in to apply all changes."
