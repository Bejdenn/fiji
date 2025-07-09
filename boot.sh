#!/usr/bin/env bash

set -e

# Function to print a message with a green arrow and bold text
# Usage: message "Your message here"
message() {
	echo -e "\e[1m\e[32m==>\e[0m \e[1m$1\e[0m"
}

ascii_art='███████╗██╗     ██╗██╗
██╔════╝██║     ██║██║
█████╗  ██║     ██║██║
██╔══╝  ██║██   ██║██║
██║     ██║╚█████╔╝██║
╚═╝     ╚═╝ ╚════╝ ╚═╝
'

echo -e "$ascii_art"
message "Fiji is for fresh Fedora Workstation 42+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

if [ "$1" == "--local" ]; then
	# When running locally, use the directory of the script itself
	export fiji_path=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
	message "Running local Fiji installation from $fiji_path"
else
	export fiji_path="$HOME/.local/share/fiji"
	repo="https://github.com/Bejdenn/fiji.git"

	message "Updating system packages..."
	sudo dnf update -y -q
	message "Ensuring Git is installed..."
	sudo dnf install -y -q git

	if [ -d "$fiji_path" ]; then
		message "Fiji is already installed, pulling latest changes..."
		cd "$fiji_path"
		git pull --quiet
		cd - >/dev/null
	else
		message "Cloning Fiji repository..."
		git clone --quiet "$repo" "$fiji_path"
	fi
fi

message "Starting Fiji installation..."
source "$fiji_path/install.sh"
