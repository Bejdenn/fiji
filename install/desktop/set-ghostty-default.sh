#!/usr/bin/env sh
# Adding ghostty to nautilus contextual menu requires the python wrapper for the libraries
sudo dnf install -y nautilus-python
mkdir -p ~/.local/share/nautilus-python/extensions/
if [ ! -f ~/.local/share/nautilus-python/extensions/open-ghostty.py ]; then
    echo "Setting Ghostty as default terminal..."
    cp ~/.local/share/fiji/install/desktop/open-ghostty.py ~/.local/share/nautilus-python/extensions
fi
