#!/usr/bin/env bash

if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  OPTIONAL_APPS=("1password" "Obsidian" "Spotify" "Steam" "VSCode")
  DEFAULT_OPTIONAL_APPS='1password,Spotify,Obsidian'
  export FIJI_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' ',')
fi

AVAILABLE_LANGUAGES=("Python" "Go" "Rust")
SELECTED_LANGUAGES="Python,Go,Rust"
export FIJI_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")
