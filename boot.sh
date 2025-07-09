#!/usr/bin/env bash

set -e

ascii_art='███████╗██╗     ██╗██╗
██╔════╝██║     ██║██║
█████╗  ██║     ██║██║
██╔══╝  ██║██   ██║██║
██║     ██║╚█████╔╝██║
╚═╝     ╚═╝ ╚════╝ ╚═╝
'

echo -e "$ascii_art"
echo "=> Fiji is for fresh Fedora Workstation 42+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

echo "==> Updating system packages..."
sudo dnf update -y -q
echo "==> Ensuring Git is installed..."
sudo dnf install -y -q git

if [ -d ~/.local/share/fiji ]; then
  echo "==> Fiji is already installed, pulling latest changes..."
  cd ~/.local/share/fiji
  git pull --quiet
  cd - >/dev/null
else
  echo "==> Cloning Fiji repository..."
  git clone --quiet https://github.com/Bejdenn/fiji.git ~/.local/share/fiji
fi

echo "==> Starting Fiji installation..."
source ~/.local/share/fiji/install.sh
