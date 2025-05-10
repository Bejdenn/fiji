#!/usr/bin/env bash

# Needed for all installers
sudo dnf update
sudo dnf install -y curl git unzip

# Run terminal installers
for installer in ~/.local/share/fiji/install/terminal/*.sh; do source $installer; done
