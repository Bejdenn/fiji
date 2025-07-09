#!/usr/bin/env bash
echo "==> Installing Neovim..."
sudo dnf install -y -q neovim

# for some reason, the treesitter version that comes bundled with Fedora leads to errors when trying to
# compile a LaTeX grammar definition.
if ! command -v tree-sitter &> /dev/null
then
    echo "==> Installing tree-sitter-cli..."
    cargo install --locked tree-sitter-cli
fi
