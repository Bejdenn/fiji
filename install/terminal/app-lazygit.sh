#!/usr/bin/env bash

message "Installing Lazygit..."
sudo dnf copr enable -y -q atim/lazygit
sudo dnf install -y -q lazygit
