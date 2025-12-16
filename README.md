# SOTA Neovim Configuration

A state-of-the-art Neovim configuration optimized for Go, Python, YAML, and Helm development with the GitHub Plus theme.

## Features

- **Theme**: GitHub Plus (`tommarien/github-plus.nvim`)
- **Package Manager**: lazy.nvim
- **LSP Support**: Go (gopls), Python (pyright), YAML (yamlls), Helm (helm-ls), Lua (lua_ls)
- **Completion**: blink.cmp with LSP, path, snippets, and buffer sources
- **Navigation**: fzf-lua (replaces Telescope), neo-tree, oil, harpoon
- **Debugging**: nvim-dap with Go and Python support
- **Formatting**: conform.nvim with gofumpt, black, isort, ruff, yamlfmt, stylua
- **Linting**: nvim-lint with golangci-lint, ruff, yamllint, luacheck
- **Git Integration**: gitsigns, neogit, diffview, fugitive
- **Cross-platform**: Works on both Linux and macOS

## Requirements

- Neovim >= 0.10.0 (nightly recommended)
- Git >= 2.19.0
- A Nerd Font (for icons)
- Node.js and npm (for some plugins)
- Python 3 (for Python support)
- Go (for Go support)

### External Dependencies

Install these tools for full functionality:

```bash
# Essential
brew install ripgrep fd fzf bat git-delta

# Language servers (or use Mason to install)
brew install gopls pyright yaml-language-server lua-language-server

# Formatters (or use Mason)
brew install gofumpt black isort ruff stylua yamlfmt

# Linters (or use Mason)
brew install golangci-lint luacheck yamllint

# Debuggers (or use Mason)
brew install delve

# Optional but recommended
brew install lazygit  # For git integration
```

## Installation

1. **Backup your existing config**:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Wait for plugins to install**: lazy.nvim will automatically install all plugins on first launch.

5. **Install LSP servers and tools**:
   ```vim
   :Mason
   ```
   All tools should auto-install, but you can manually install if needed.

6. **Restart Neovim** to ensure everything is loaded correctly.

## File Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # Auto commands
│   │   ├── keymaps.lua        # Key mappings
│   │   └── options.lua        # Neovim options
│   └── plugins/
│       ├── colorscheme.lua    # GitHub Plus theme
│       ├── mason.lua          # LSP/tool installer
│       ├── lsp.lua            # LSP configuration
│       ├── treesitter.lua     # Syntax highlighting
│       ├── ui.lua             # UI plugins (dashboard, lualine, bufferline, etc.)
│       ├── completion.lua     # Blink.cmp and snippets
│       ├── navigation.lua     # fzf-lua, neo-tree, oil, harpoon
│       ├── editing.lua        # Flash, surround, comment, etc.
│       ├── git.lua            # Git integration
│       ├── lang-go.lua        # Go support
│       ├── lang-python.lua    # Python support
│       ├── lang-yaml.lua      # YAML and Helm support
│       ├── dap.lua            # Debugging
│       ├── formatting.lua     # Formatters and linters
│       ├── utilities.lua      # Utility plugins
│       └── extras.lua         # Additional specialized plugins
└── README.md
```

## Key Mappings

Leader key is set to `<Space>`.

### General

- `<Space>ff` - Find files
- `<Space>fg` - Live grep
- `<Space>fb` - Buffers
- `<Space>fr` - Recent files
- `<Space>e` - Toggle file explorer
- `<C-/>` - Toggle terminal

### LSP

- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<Space>ca` - Code actions
- `<Space>rn` - Rename
- `]d` / `[d` - Next/previous diagnostic

### Git

- `<Space>gg` - Open Neogit
- `<Space>gs` - Git status (fzf)
- `<Space>gc` - Git commits (fzf)
- `]h` / `[h` - Next/previous hunk
- `<Space>ghs` - Stage hunk
- `<Space>ghr` - Reset hunk
- `<Space>ghp` - Preview hunk
- `<Space>ghb` - Blame line

### Debugging

- `<Space>db` - Toggle breakpoint
- `<Space>dc` - Continue
- `<Space>di` - Step into
- `<Space>do` - Step out
- `<Space>dO` - Step over
- `<Space>dt` - Terminate
- `<Space>du` - Toggle DAP UI

### Buffers & Windows

- `<S-h>` / `<S-l>` - Previous/next buffer
- `<Space>bd` - Delete buffer
- `<C-h/j/k/l>` - Navigate windows
- `<Space>w-` - Split horizontally
- `<Space>w|` - Split vertically

### Harpoon

- `<Space>a` - Add file to harpoon
- `<Space>h` - Toggle harpoon menu
- `<Space>1-4` - Jump to harpoon file 1-4

## Language-Specific Features

### Go

- Auto-imports on save (goimports)
- Format on save (gofumpt)
- Lint on save (golangci-lint)
- Debug with Delve
- Test runner integration
- Struct tags and code generation

### Python

- Format on save (black + isort)
- Lint on save (ruff)
- Debug with debugpy
- Virtual environment detection
- Test runner integration (pytest)

### YAML/Helm

- Schema validation
- Kubernetes manifest support
- Helm chart editing
- kubectl integration
- Format on save (yamlfmt)

## Customization

### Changing Theme

Edit `lua/plugins/colorscheme.lua` to modify theme settings:

```lua
opts = {
  transparent = false,  -- Set to true for transparent background
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
  },
},
```

### Disable Format on Save

```vim
:FormatDisable
```

Re-enable with:
```vim
:FormatEnable
```

### Add More LSP Servers

Edit `lua/plugins/mason.lua` and add servers to `ensure_installed`:

```lua
ensure_installed = {
  "gopls",
  "pyright",
  "your-new-server",
},
```

Then configure the server in `lua/plugins/lsp.lua`.

## Updating

Update plugins:
```vim
:Lazy sync
```

Update Mason packages:
```vim
:Mason
```
Then press `U` to update all.

## Troubleshooting

### LSP not working

1. Check LSP status: `:LspInfo`
2. Check Mason installation: `:Mason`
3. Check health: `:checkhealth`

### Treesitter errors

Update parsers:
```vim
:TSUpdate
```

### Performance issues

1. Disable some plugins in `lazy = true` mode
2. Check startup time: `:Lazy profile`
3. Reduce treesitter `ensure_installed` list

### Icons not showing

Install a Nerd Font and set it in your terminal emulator.

## Credits

This configuration uses plugins from the amazing Neovim community. Special thanks to:

- folke - lazy.nvim, which-key, trouble, noice, and more
- nvim-treesitter team
- neovim LSP team
- All plugin authors

## License

This configuration is MIT licensed. Individual plugins maintain their own licenses.
