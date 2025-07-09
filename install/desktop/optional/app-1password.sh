#!/usr/bin/env bash
message "Installing 1Password..."
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc

# Add 1Password YUM repository
sudo tee /etc/yum.repos.d/1password.repo >/dev/null <<EOL
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://downloads.1password.com/linux/keys/1password.asc
EOL

sudo dnf install -y 1password 1password-cli
