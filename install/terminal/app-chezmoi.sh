#!/usr/bin/env bash

message "Installing Chezmoi..."
curl -s https://api.github.com/repos/twpayne/chezmoi/releases/latest | jq '.assets[] | select(.name | test(".*x86_64.rpm")) | .browser_download_url' | xargs sudo dnf install -y -q
