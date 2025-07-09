#!/usr/bin/env bash
cat <<EOF >~/.local/share/applications/Activity.desktop
[Desktop Entry]
Version=1.0
Name=Activity
Comment=System activity from btop
Exec=ghostty --window-width=160 --window-height=60 --title=Activity --class=Activity -e btop
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/fiji/applications/icons/Activity.png
Categories=GTK;
StartupNotify=false
EOF
