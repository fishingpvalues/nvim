Local Neovim Config (macOS & Linux)

Usage

- Run with this repo as the config (no install needed):
  - macOS/Linux: `scripts/nvim-here.sh` (make sure it’s executable)
- Or move/symlink this folder to your Neovim config path:
  - macOS/Linux: `~/.config/nvim`

Notes

- Clipboard: this config enables system clipboard only when a provider is available.
  - macOS: requires `pbcopy` (built-in)
  - Wayland: `wl-clipboard` (wl-copy)
  - X11: `xclip` or `xsel`
- Folds: uses Treesitter when available, falls back to `indent` otherwise.
- Fuzzy finder: uses Telescope. Alternative pickers (fzf-lua, mini.fuzzy, etc.) are disabled to keep things lean.

