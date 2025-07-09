#!/usr/bin/env bash

# Needed for all installers
echo "==> Installing terminal dependencies..."
sudo dnf install -y -q curl git unzip jq

# Run terminal installers
echo "==> Installing terminal applications..."
source "$fiji_path/install/terminal/app-chezmoi.sh"
source "$fiji_path/install/terminal/app-fastfetch.sh"
source "$fiji_path/install/terminal/app-lazygit.sh"
source "$fiji_path/install/terminal/app-neovim.sh"
source "$fiji_path/install/terminal/app-texlive.sh"
source "$fiji_path/install/terminal/app-tmux.sh"
source "$fiji_path/install/terminal/apps-terminal.sh"
source "$fiji_path/install/terminal/select-dev-language.sh"