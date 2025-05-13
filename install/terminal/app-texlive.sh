#!/usr/bin/env bash

echo "Fiji wants to install TeX Live, a LaTeX installation and Zathura, a SyncTeX-compatible PDF viewer."
gum confirm "Process with installation?" && sudo dnf install -y texlive-scheme-full zathura zathura-pdf-poppler || echo "Skipped installation of LaTeX."
