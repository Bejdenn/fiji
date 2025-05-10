#!/usr/bin/env bash
mkdir -p ~/.local/share/fonts

cd /tmp || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip
unzip IosevkaTerm.zip -d IosevkaFont
cp IosevkaFont/*.ttf ~/.local/share/fonts
rm -rf IosevkaTerm.zip IosevkaFont

fc-cache
cd - || exit
