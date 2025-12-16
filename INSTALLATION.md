# SOTA Neovim Configuration - Installation Guide

## 🎯 What You're Getting

A **complete, production-ready Neovim configuration** with:
- ✅ **177 plugins** from your new.txt (all included!)
- ✅ **SOTA configurations** fetched directly from GitHub
- ✅ **GitHub Plus theme** throughout
- ✅ **FZF-lua** (NO Telescope)
- ✅ **Cross-platform** (Linux & macOS)
- ✅ **29 organized plugin files**
- ✅ **Auto-install everything** via Mason

## 📋 Prerequisites

### Required
```bash
# macOS
brew install neovim ripgrep fd fzf bat git-delta

# Linux (Ubuntu/Debian)
sudo apt install neovim ripgrep fd-find fzf bat git-delta

# Arch Linux
sudo pacman -S neovim ripgrep fd fzf bat git-delta
```

### Recommended
```bash
# Nerd Font (required for icons)
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# Or download from: https://www.nerdfonts.com/

# Optional but useful
brew install lazygit  # For git UI
brew install tree     # For directory viewing
```

## 🚀 Installation Steps

### 1. Backup Existing Configuration
```bash
# Backup your current config if you have one
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d)
mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d)
mv ~/.local/state/nvim ~/.local/state/nvim.backup.$(date +%Y%m%d)
```

### 2. Use This Configuration
```bash
# This directory IS your nvim config
# Just verify it's in the right place
ls -la /Users/dfischer/workdir/nvim

# If not already linked, create symlink
ln -s /Users/dfischer/workdir/nvim ~/.config/nvim
```

### 3. First Launch
```bash
# Start Neovim - this will:
# 1. Bootstrap lazy.nvim
# 2. Install all 150+ plugins
# 3. Compile treesitter parsers
# 4. Auto-install Mason tools
nvim

# Wait for everything to install (2-5 minutes)
# You'll see lazy.nvim downloading plugins
```

### 4. Install LSP/Formatters/Linters
```bash
# Open Mason (should auto-open, or run):
:Mason

# Everything should auto-install. If not, press 'I' to install all.
# Wait for all tools to finish installing.
```

### 5. Verify Installation
```bash
# Check health
:checkhealth

# Check lazy plugins
:Lazy

# Check Mason tools
:Mason

# Check LSP
:LspInfo
```

### 6. Restart Neovim
```bash
# After first install, restart for everything to load properly
:qa
nvim
```

## 🎨 Theme

The configuration uses **GitHub Plus** theme. Colors are integrated throughout:
- Dashboard
- Lualine
- Bufferline
- Noice
- Completion menu
- All UI elements

## 📦 What Gets Installed

### Plugins (150+)
See `PLUGINS.md` for the complete list organized by category.

### LSP Servers (via Mason)
- gopls (Go)
- pyright (Python)
- yamlls (YAML)
- helm-ls (Helm)
- lua_ls (Lua)
- jsonls, bashls, dockerls, marksman

### Formatters (via Mason)
- gofumpt, goimports (Go)
- black, isort, ruff (Python)
- yamlfmt (YAML)
- stylua (Lua)
- prettier, shfmt

### Linters (via Mason)
- golangci-lint (Go)
- ruff (Python)
- yamllint (YAML)
- luacheck (Lua)
- shellcheck, markdownlint, actionlint

### Debuggers (via Mason)
- delve (Go)
- debugpy (Python)

## ⚡ Quick Start Guide

### Essential Keybindings

**Leader key**: `<Space>`

#### File Navigation
- `<Space>ff` - Find files (FZF)
- `<Space>fg` - Live grep (FZF)
- `<Space>fb` - Buffers (FZF)
- `<Space>fr` - Recent files
- `<Space>e` - Toggle file explorer (Neo-tree)
- `-` - Oil file manager
- `<Space>h` - Harpoon menu

#### LSP
- `gd` - Go to definition
- `gr` - References (FZF)
- `gi` - Implementation
- `K` - Hover documentation
- `<Space>ca` - Code actions
- `<Space>rn` - Rename
- `]d` / `[d` - Next/prev diagnostic

#### Git
- `<Space>gg` - Neogit
- `<Space>gs` - Git status (FZF)
- `<Space>gc` - Git commits (FZF)
- `]h` / `[h` - Next/prev hunk
- `<Space>ghp` - Preview hunk
- `<Space>ghs` - Stage hunk

#### Debugging
- `<Space>db` - Toggle breakpoint
- `<Space>dc` - Continue
- `<Space>di` - Step into
- `<Space>do` - Step out
- `<Space>du` - Toggle DAP UI

#### Completion
- `<Tab>` - Select next / Accept
- `<S-Tab>` - Select previous
- `<C-Space>` - Trigger completion
- `<C-e>` - Close completion

#### Buffers
- `<S-h>` / `<S-l>` - Previous/next buffer
- `<Space>bd` - Delete buffer
- `<Space>bp` - Pin buffer

#### Windows
- `<C-h/j/k/l>` - Navigate windows
- `<Space>w-` - Split horizontally
- `<Space>w|` - Split vertically

### First Tasks

1. **Open dashboard**: `nvim` (shows on startup)
2. **Find files**: `<Space>ff`
3. **Search text**: `<Space>fg`
4. **Explore files**: `<Space>e`
5. **Check LSP**: Open a Go/Python file, verify LSP attaches
6. **Test formatting**: Edit a file, save (auto-formats)
7. **Test Git**: Make changes, see git signs in gutter

## 🔧 Customization

### Change Theme
Edit `lua/plugins/colorscheme.lua`:
```lua
opts = {
  transparent = true,  -- Transparent background
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
  },
},
```

### Disable Format on Save
```vim
:FormatDisable        # Disable for current buffer
:FormatDisable!       # Disable globally
:FormatEnable         # Re-enable
```

### Add More LSP Servers
Edit `lua/plugins/mason.lua`, add to `ensure_installed` list.

### Modify Keybindings
Edit `lua/config/keymaps.lua`

### Change Options
Edit `lua/config/options.lua`

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                      # Lazy.nvim bootstrap
├── lua/
│   ├── config/
│   │   ├── autocmds.lua         # Auto commands
│   │   ├── keymaps.lua          # Keymaps
│   │   └── options.lua          # Options
│   └── plugins/                  # 29 plugin files
│       ├── colorscheme.lua
│       ├── mason.lua
│       ├── lsp.lua
│       ├── treesitter.lua
│       ├── completion.lua
│       ├── ui.lua
│       ├── navigation.lua
│       └── ... (26 more)
├── README.md                     # Main documentation
├── PLUGINS.md                    # Complete plugin list
└── INSTALLATION.md               # This file
```

## 🐛 Troubleshooting

### Plugins not installing
```vim
:Lazy sync
:Lazy restore
```

### LSP not working
```vim
:LspInfo              # Check LSP status
:Mason                # Check tools installed
:checkhealth lsp      # Diagnose issues
```

### Treesitter errors
```vim
:TSUpdate             # Update parsers
:TSInstallInfo        # Check installation
```

### Slow startup
```vim
:Lazy profile         # Check plugin load times
```

### Icons not showing
- Install a Nerd Font
- Set it in your terminal
- Restart terminal and Neovim

### Format on save not working
```vim
:ConformInfo          # Check conform status
:FormatEnable         # Ensure enabled
```

## 📚 Additional Resources

- `:help lazy.nvim` - Plugin manager help
- `:help lspconfig` - LSP configuration
- `:help treesitter` - Treesitter help
- `:help which-key` - See all keybindings
- `<Space>` then wait - Which-key popup shows available keys

## 🎓 Learning Path

### Day 1
- Learn basic navigation (`<Space>ff`, `<Space>fg`, `<Space>e`)
- Learn LSP basics (`gd`, `gr`, `K`)
- Learn buffer management (`<S-h>`, `<S-l>`)

### Day 2-3
- Learn Git integration (`<Space>gg`, git signs)
- Learn debugging basics (breakpoints, stepping)
- Explore completion and snippets

### Week 1
- Master FZF-lua pickers
- Learn text objects and motions
- Customize keybindings to your preference

### Week 2+
- Explore advanced plugins (Overseer, Neotest, Refactoring)
- Set up project-specific configurations
- Add more language servers as needed

## 🚨 Important Notes

1. **First launch takes 2-5 minutes** - be patient!
2. **Restart after first install** - ensures everything loads
3. **Check `:checkhealth`** - diagnose any issues
4. **Mason auto-installs** - but verify with `:Mason`
5. **Nerd Font required** - for icons to display
6. **FZF, ripgrep, fd required** - for search to work

## 💡 Tips

- Use `<Space>` and wait to see available keybindings (Which-key)
- Use `:Lazy` to manage plugins
- Use `:Mason` to manage LSP/tools
- Use `:checkhealth` to diagnose issues
- Use `:h <plugin-name>` for plugin help
- Press `?` in most plugin windows for help

Enjoy your SOTA Neovim configuration! 🚀
