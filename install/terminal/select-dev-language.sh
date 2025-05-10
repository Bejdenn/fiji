#!/usr/bin/env bash

# Install default programming languages
if [[ -v FIJI_FIRST_RUN_LANGUAGES ]]; then
  languages=$FIJI_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Python" "Go" "Rust")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Go)
      sudo dnf install -y go
      ;;
    Python)
      if [ -d ~/miniconda3 ]; then
        echo "miniconda exists, skip installation"
      else
        mkdir -p ~/miniconda3
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
        bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
        rm ~/miniconda3/miniconda.sh
      fi
      ;;
    Rust)
      sudo dnf install -y rustup
      ;;
    esac
  done
fi
