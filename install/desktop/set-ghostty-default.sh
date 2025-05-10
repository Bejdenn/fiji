#!/usr/bin/env sh
# Adding ghostty to nautilus contextual menu requires the python wrapper for the libraries
sudo dnf install -y nautilus-python
mkdir -p ~/.local/share/nautilus-python/extensions/
cp ~/.local/share/fiji/install/desktop/open-ghostty.py ~/.local/share/nautilus-python/extensions
