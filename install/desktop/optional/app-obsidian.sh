#!/usr/bin/env bash
message "Installing Obsidian..."
gum spin --spinner meter --title "Obsidian installation about to start. It may take up to 20 minutes on some systems!" -- sleep 3
flatpak install -y flathub md.obsidian.Obsidian
