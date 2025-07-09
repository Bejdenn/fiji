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
echo "==> Fiji is for fresh Fedora Workstation 42+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

if [ "$1" == "--local" ]; then
	# When running locally, use the directory of the script itself
	export fiji_path=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
	echo "==> Running local Fiji installation from $fiji_path"
else
	export fiji_path="$HOME/.local/share/fiji"
	repo="https://github.com/Bejdenn/fiji.git"

	echo "==> Updating system packages..."
	sudo dnf update -y -q
	echo "==> Ensuring Git is installed..."
	sudo dnf install -y -q git

	if [ -d "$fiji_path" ]; then
		echo "==> Fiji is already installed, pulling latest changes..."
		cd "$fiji_path"
		git pull --quiet
		cd - >/dev/null
	else
		echo "==> Cloning Fiji repository..."
		git clone --quiet "$repo" "$fiji_path"
	fi
fi

echo "==> Starting Fiji installation..."
source "$fiji_path/install.sh"
