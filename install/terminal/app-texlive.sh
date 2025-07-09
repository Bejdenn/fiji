#!/usr/bin/env bash

echo "Fiji wants to install TeX Live, a LaTeX installation and Zathura, a SyncTeX-compatible PDF viewer."
if gum confirm "Process with installation?"; then
    echo "==> Installing TeX Live and Zathura..."
    sudo dnf install -y -q texlive-scheme-full zathura zathura-pdf-poppler
else
    echo "Skipped installation of LaTeX."
fi
