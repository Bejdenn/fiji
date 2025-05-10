#!/usr/bin/env bash

AVAILABLE_LANGUAGES=("Python" "Go" "Rust")
SELECTED_LANGUAGES="Python,Go,Rust"
USER_SELECTIONS=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")
export FIJI_FIRST_RUN_LANGUAGES=$USER_SELECTIONS
