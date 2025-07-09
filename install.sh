#!/usr/bin/env bash

set -e

function cleanup_on_error() {
	echo "Fiji installation failed! You can retry by running: source $fiji_path/install.sh"
	# If we are in a GNOME environment, reset the idle and lock settings
	if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
		message "Re-enabling screen lock and idle timeout due to error..."
		gsettings set org.gnome.desktop.screensaver lock-enabled true
		gsettings set org.gnome.desktop.session idle-delay 300
	fi
}

# Give people a chance to retry running the installation
trap cleanup_on_error ERR

# Check the distribution name and version and abort if incompatible
message "Checking system compatibility..."
source "$fiji_path/install/check-version.sh"

# Ask for app choices
message "Preparing for user selections..."
source "$fiji_path/install/terminal/required/app-gum.sh" >/dev/null
source "$fiji_path/install/first-run-choices.sh"

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
	# Ensure computer doesn't go to sleep or lock while installing
	message "Temporarily disabling screen lock and idle timeout..."
	gsettings set org.gnome.desktop.screensaver lock-enabled false
	gsettings set org.gnome.desktop.session idle-delay 0

	message "Installing terminal and desktop tools..."

	# Install terminal tools
	source "$fiji_path/install/terminal.sh"

	# Install desktop tools and tweaks
	source "$fiji_path/install/desktop.sh"

	# Revert to normal idle and lock settings
	message "Re-enabling screen lock and idle timeout..."
	gsettings set org.gnome.desktop.screensaver lock-enabled true
	gsettings set org.gnome.desktop.session idle-delay 300
else
	message "GNOME desktop not detected, only installing terminal tools..."
	source "$fiji_path/install/terminal.sh"
fi

message "Fiji installation complete!"

# Disable the trap on successful exit to prevent it from running
trap - ERR
