#!/usr/bin/env bash

message "Installing Ghostty..."
sudo dnf install -y -q ghostty
source "$fiji_path/install/desktop/set-ghostty-default.sh"
