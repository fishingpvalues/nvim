#!/usr/bin/env bash
# Launch Neovim using this repository as the config root, without moving files.
# Works on macOS and Linux.

set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"

exec nvim -u "$repo_dir/init.lua" --cmd "set rtp^=$repo_dir"

