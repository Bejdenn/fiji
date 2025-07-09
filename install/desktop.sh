#!/usr/bin/env bash

# Set path to Fiji scripts
export FIJI_PATH=~/.local/share/fiji

# Run core desktop installers
echo "==> Installing core desktop applications and settings..."
source $FIJI_PATH/install/desktop/a-flatpak.sh
source $FIJI_PATH/install/desktop/app-ghostty.sh
source $FIJI_PATH/install/desktop/app-gnome-sushi.sh
source $FIJI_PATH/install/desktop/app-gnome-tweak-tool.sh
source $FIJI_PATH/install/desktop/app-localsend.sh
source $FIJI_PATH/install/desktop/applications.sh
source $FIJI_PATH/install/desktop/fonts.sh
source $FIJI_PATH/install/desktop/set-app-grid.sh
source $FIJI_PATH/install/desktop/set-dock.sh
source $FIJI_PATH/install/desktop/set-gnome-extensions.sh
source $FIJI_PATH/install/desktop/set-gnome-hotkeys.sh
source $FIJI_PATH/install/desktop/set-gnome-settings.sh
source $FIJI_PATH/install/desktop/set-nautilus-preferences.sh

# Run optional app installers
echo "==> Installing optional desktop applications..."
source $FIJI_PATH/install/desktop/select-optional-apps.sh

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
