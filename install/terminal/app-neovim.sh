#!/usr/bin/env bash
sudo dnf install -y neovim

# for some reason, the treesitter version that comes bundled with Fedora leads to errors when trying to
# compile a LaTeX grammar definition.
cargo install --locked tree-sitter-cli
