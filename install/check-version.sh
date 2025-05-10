#!/usr/bin/env bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04 or higher
if [ "$ID" != "fedora" ] || [ "$VARIANT_ID" != "workstation" ] || [ "$(echo "$VERSION_ID >= 42" | bc)" != 1 ]; then
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VARIANT_ID $VERSION_ID"
  echo "OS required: Fedora Workstation 42 or higher"
  echo "Installation stopped."
  exit 1
fi

# Check if running on x86
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  echo "$(tput setaf 1)Error: Unsupported architecture detected"
  echo "Current architecture: $ARCH"
  echo "This installation is only supported on x86 architectures (x86_64 or i686)."
  echo "Installation stopped."
  exit 1
fi
