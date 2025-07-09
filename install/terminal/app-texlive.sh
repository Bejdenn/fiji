#!/usr/bin/env bash

message "Fiji wants to install TeX Live, a LaTeX installation and Zathura, a SyncTeX-compatible PDF viewer."
if gum confirm "Process with installation?"; then
	message "Installing TeX Live and Zathura..."
	sudo dnf install -y -q texlive-scheme-full zathura zathura-pdf-poppler
else
	message "Skipped installation of LaTeX."
fi
