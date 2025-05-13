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
      sudo rpm --import https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc
      echo '[conda]
name=Conda
baseurl=https://repo.anaconda.com/pkgs/misc/rpmrepo/conda
enabled=1
gpgcheck=1
gpgkey=https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc' | sudo tee /etc/yum.repos.d/conda.repo
      sudo dnf install -y conda
      ;;
    Rust)
      sudo dnf install -y rustup
      ;;
    esac
  done
fi
