#!/usr/bin/env bash
sudo dnf install -y gnome-extensions-app pipx
pipx install gnome-extensions-cli --system-site-packages

# Install new extensions
gext install blur-my-shell@aunetx
gext install space-bar@luchrioh
gext install undecorate@sun.wxg@gmail.com
gext install tophat@fflewddur.github.io
gext install AlphabeticalAppGrid@stuarthayhurst
sudo dnf install gnome-shell-extension-pop-shell xprop

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Blur My Shell
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

# Configure Space Bar
gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons true
gsettings set org.gnome.shell.extensions.tophat show-cpu true
gsettings set org.gnome.shell.extensions.tophat show-mem true
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'

# Configure Pop Shell
accent_color=$(gsettings get org.gnome.desktop.interface accent-color | tr -d "'")

# accent_to_rgb converts a GNOME accent color to the corresponding RGB value and
# returns a string that is compatible with the gsettings value for the active hint
# option of Pop Shell.
accent_to_rgb() {
	case $1 in
	blue)
		echo "rgb(53,132,228)"
		;;
	teal)
		echo "rgb(33,144,164)"
		;;
	green)
		echo "rgb(58,148,74)"
		;;
	yellow)
		echo "rgb(200,136,0)"
		;;
	orange)
		echo "rgb(237,91,0)"
		;;
	red)
		echo "rgb(230,45,66)"
		;;
	pink)
		echo "rgb(213,97,153)"
		;;
	purple)
		echo "rgb(145,65,172)"
		;;
	slate)
		echo "rgb(111,131,150)"
		;;
	*)
		echo "Invalid accent color"
		;;
	esac
}
gsettings set org.gnome.shell.extensions.pop-shell hint-color-rgba "'$(accent_to_rgb "$accent_color")'"
gsettings set org.gnome.shell.extensions.pop-shell active-hint-border-radius 'uint32 16'
gsettings set org.gnome.shell.extensions.pop-shell gap-inner 'uint32 4'
gsettings set org.gnome.shell.extensions.pop-shell gap-outer 'uint32 4'
