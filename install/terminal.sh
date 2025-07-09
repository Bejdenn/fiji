#!/usr/bin/env bash

# Needed for all installers
echo "==> Installing terminal dependencies..."
sudo dnf install -y -q curl git unzip jq

# Run terminal installers
echo "==> Installing terminal applications..."
source ~/.local/share/fiji/install/terminal/app-chezmoi.sh
source ~/.local/share/fiji/install/terminal/app-fastfetch.sh
source ~/.local/share/fiji/install/terminal/app-lazygit.sh
source ~/.local/share/fiji/install/terminal/app-neovim.sh
source ~/.local/share/fiji/install/terminal/app-texlive.sh
source ~/.local/share/fiji/install/terminal/app-tmux.sh
source ~/.local/share/fiji/install/terminal/apps-terminal.sh
source ~/.local/share/fiji/install/terminal/select-dev-language.sh

