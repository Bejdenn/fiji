#!/usr/bin/env bash
# Set Cascadia Mono as the default monospace font
message "Configuring Gnome settings..."
gsettings set org.gnome.desktop.interface monospace-font-name 'IosevkaTerm Nerd Font Mono 10'

# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true
