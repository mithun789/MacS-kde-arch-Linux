#!/bin/bash

THEME_NAME="MacSonoma-kde"
INSTALL_DIR="$HOME/.local/share/plasma/desktoptheme/$THEME_NAME"

# Remove theme files
rm -rf "$INSTALL_DIR"

# Remove additional components
plasmapkg2 -r launchpad-plasma.plasmoid
plasmapkg2 -r kapplemenu.plasmoid
plasmapkg2 -r kde-control-station.plasmoid

# Optional: Remove AUR packages (uncomment if desired)
# yay -Rns plasma5-applets-window-appmenu plasma5-applets-window-title latte-dock-git

# Reset blur effect settings
kwriteconfig5 --file kwinrc --group Effect-Blur --key BlurStrength "5"

# Restart KWin
qdbus org.kde.KWin /KWin reconfigure

echo "Uninstallation completed. Please log out and log back in to apply all changes."
