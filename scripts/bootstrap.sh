#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLAKE_DIR="$(dirname "$SCRIPT_DIR")"

TMP_DIR=$(mktemp -d)
printf "building initial system configuration in temporary directory...\n"

nix build --extra-experimental-features "nix-command flakes" "$FLAKE_DIR#darwinConfigurations.xnu.system" --out-link "$TMP_DIR/result"

sudo rm -f /etc/bashrc /etc/zshrc

printf "activating nix-darwin configuration (requires sudo)...\n"
sudo "$TMP_DIR/result/sw/bin/darwin-rebuild" switch --flake "$FLAKE_DIR#xnu"

# 4. Clean up the temporary directory
rm -rf "$TMP_DIR"

printf "nix-darwin is bootstrapped. you can now use 'darwin-rebuild switch' normally.\n"
