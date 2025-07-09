#!/usr/bin/env bash

# Run core desktop installers
echo "==> Installing core desktop applications and settings..."
source "$fiji_path/install/desktop/a-flatpak.sh"
source "$fiji_path/install/desktop/app-ghostty.sh"
source "$fiji_path/install/desktop/app-gnome-sushi.sh"
source "$fiji_path/install/desktop/app-gnome-tweak-tool.sh"
source "$fiji_path/install/desktop/app-localsend.sh"
source "$fiji_path/install/desktop/applications.sh"
source "$fiji_path/install/desktop/fonts.sh"
source "$fiji_path/install/desktop/set-app-grid.sh"
source "$fiji_path/install/desktop/set-dock.sh"
source "$fiji_path/install/desktop/set-gnome-extensions.sh"
source "$fiji_path/install/desktop/set-gnome-hotkeys.sh"
source "$fiji_path/install/desktop/set-gnome-settings.sh"
source "$fiji_path/install/desktop/set-nautilus-preferences.sh"

# Run optional app installers
echo "==> Installing optional desktop applications..."
source "$fiji_path/install/desktop/select-optional-apps.sh"

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
