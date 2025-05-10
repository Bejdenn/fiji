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

sudo dnf update >/dev/null
sudo dnf install -y git >/dev/null

echo "Cloning Fiji..."
rm -rf ~/.local/share/fiji
git clone https://github.com/Bejdenn/fiji.git ~/.local/share/fiji >/dev/null

echo "Installation starting..."
source ~/.local/share/fiji/install.sh
