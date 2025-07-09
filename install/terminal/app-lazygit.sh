#!/usr/bin/env bash

echo "==> Installing Lazygit..."
sudo dnf copr enable -y -q atim/lazygit
sudo dnf install -y -q lazygit
