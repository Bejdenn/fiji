#!/usr/bin/env bash

set -e

function cleanup_on_error() {
  echo "Fiji installation failed! You can retry by running: source ~/.local/share/fiji/install.sh"
  # If we are in a GNOME environment, reset the idle and lock settings
  if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
    echo "==> Re-enabling screen lock and idle timeout due to error..."
    gsettings set org.gnome.desktop.screensaver lock-enabled true
    gsettings set org.gnome.desktop.session idle-delay 300
  fi
}

# Give people a chance to retry running the installation
trap cleanup_on_error ERR

# Check the distribution name and version and abort if incompatible
echo "==> Checking system compatibility..."
source ~/.local/share/fiji/install/check-version.sh

# Ask for app choices
echo "==> Preparing for user selections..."
source ~/.local/share/fiji/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/fiji/install/first-run-choices.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  echo "==> Temporarily disabling screen lock and idle timeout..."
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "==> Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/.local/share/fiji/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/fiji/install/desktop.sh

  # Revert to normal idle and lock settings
  echo "==> Re-enabling screen lock and idle timeout..."
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "==> GNOME desktop not detected, only installing terminal tools..."
  source ~/.local/share/fiji/install/terminal.sh
fi

echo "==> Fiji installation complete!"

# Disable the trap on successful exit to prevent it from running
trap - ERR