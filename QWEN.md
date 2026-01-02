# Neovim SOTA Configuration

## Project Overview

This is a state-of-the-art (SOTA) Neovim configuration designed for cross-platform use (Linux, macOS, Termux/Android). It uses modern, performance-focused plugins with extensive lazy loading. The configuration is organized in a modular way with separate files for different aspects of the setup.

**Key Features:**
- **Theme:** GitHub Plus (github-plus.nvim)
- **Plugin Manager:** lazy.nvim
- **Leader Key:** `<Space>`
- **Local Leader:** `\`

## Architecture

### Entry Point & Load Order

1. **init.lua** - Main entry point:
   - Sets leader keys
   - Bootstraps lazy.nvim (auto-installs if missing)
   - Configures lazy.nvim to import all `lua/plugins/*.lua` files
   - Loads core config modules in order:
     - `config.options` - Vim settings
     - `config.keymaps` - Global keybindings
     - `config.autocmds` - Autocommands

### Directory Structure

```
nvim/
├── init.lua                     # Main entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua        # Autocommands (augroups, auto-resize, yank highlight, etc.)
│   │   ├── keymaps.lua         # Global keybindings (window nav, buffer nav, splits)
│   │   └── options.lua         # Vim options (UI, search, indent, folding)
│   └── plugins/                # Plugin specification files
│       ├── plugin-management.lua   # Core dependencies
│       ├── colorscheme.lua         # GitHub Plus theme
│       ├── lsp.lua                 # LSP config with 10+ servers
│       ├── completion.lua          # Blink.cmp (Rust-based)
│       ├── treesitter.lua          # Syntax & text objects
│       ├── navigation.lua          # FZF-Lua, Neo-tree, Oil, Harpoon
│       ├── editing.lua             # Flash, surround, comment, multicursors
│       ├── formatting.lua          # Conform.nvim, nvim-lint
│       ├── git.lua                 # Gitsigns, Neogit, Diffview, Fugitive
│       ├── dap.lua                 # nvim-dap with UI
│       ├── extras.lua              # Neotest, refactoring, REST, database
│       ├── lang-go.lua             # Go-specific tools
│       ├── lang-python.lua         # Python-specific tools
│       ├── lang-yaml.lua           # YAML/Helm/kubectl
│       ├── ui.lua                  # Dashboard, lualine, bufferline, noice
│       └── utilities.lua           # Overseer, Trouble, toggleterm, etc.
├── snippets/                     # Custom code snippets
├── skeletons/                    # File templates
├── lazy-lock.json                # Plugin lock file
├── PLUGINS.md                    # Complete plugin inventory
├── CLAUDE.md                     # Claude-specific guidance
└── various health check files
```

## Key Plugin Choices & Patterns

### Modern Replacements

- **Blink.cmp** instead of nvim-cmp (Rust-based, faster completion)
- **FZF-Lua** instead of Telescope (faster, registered as `vim.ui.select`)
- **Conform.nvim** for formatting (async, modern)
- **nvim-lint** for linting
- **GitHub Plus** colorscheme with semantic highlighting

### FZF-Lua Integration

FZF-Lua is registered as the global `vim.ui.select` provider in `navigation.lua`, meaning all plugins using `vim.ui.select` will use FZF-Lua by default.

### Lazy Loading Patterns

Plugins use these triggers:
- **`event`**: `BufReadPre`, `BufNewFile`, `VeryLazy`, `InsertEnter`
- **`cmd`**: Load on specific command execution
- **`ft`**: Load for specific filetypes
- **`keys`**: Load when keybindings are pressed (most common)
- **`lazy = true`**: Only load as dependency

## Building and Running

### Installation

The configuration is self-bootstrapping:

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone https://github.com/your-repo/nvim ~/.config/nvim
   ```

2. Start Neovim - lazy.nvim will automatically install itself and all plugins
   ```bash
   nvim
   ```

3. Run `:Lazy sync` to install all plugins

### Key Commands

- `:Lazy` - Open lazy.nvim UI
- `:Lazy sync` - Install missing + update all plugins
- `:Lazy update` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Mason` - Open Mason UI for LSP/formatter/linter management
- `:FormatDisable` - Disable format-on-save (global)
- `:FormatEnable` - Enable format-on-save (global)

### Health Checks

- Run `:checkhealth` to verify configuration
- Use `check_health.sh` script for specific module checks
- Run `:Lazy health` to check lazy.nvim status

## Development Conventions

### Options (`config/options.lua`)
- 2-space indentation with `expandtab`
- Relative line numbers with current line number
- System clipboard integration (`unnamedplus`)
- Persistent undo (10,000 levels)
- Treesitter folding
- Smart case-insensitive search
- Ripgrep as `grepprg`

### Keymaps (`config/keymaps.lua`)
- Window navigation: `<C-h/j/k/l>`
- Buffer navigation: `<S-h/l>`, `]b`/`[b`
- Splits: `<leader>w-` (horizontal), `<leader>w|` (vertical)
- Leader-based organization: `<leader>f` (files), `<leader>g` (git), `<leader>c` (code), `<leader>t` (test)

### Autocmds (`config/autocmds.lua`)
- Auto-reload files on focus
- Highlight on yank (150ms)
- Auto-resize splits on window resize
- Remember last cursor position
- Close help/info/man windows with `q`
- Enable spell check in markdown/git commits
- Auto-create parent directories on save

## Language Support

### LSP Configuration

Configured servers:
- **Go**: gopls (gofumpt, codelenses, staticcheck, vulncheck)
- **Python**: pyright
- **YAML**: yamlls, helm_ls (via lang-yaml.lua)
- **Lua**: lua_ls (Neovim-specific workspace library)
- **JSON**: jsonls
- **Bash**: bashls
- **Docker**: dockerls
- **Markdown**: marksman
- **And more**: See server configurations in lsp.lua

### LSP Keybindings (Buffer-local)

Set in `on_attach` function:
- `gd` - Goto definition
- `gr` - Goto references
- `gI` - Goto implementation
- `gy` - Goto type definition
- `gD` - Goto declaration
- `K` - Hover documentation
- `gK` - Signature help
- `<leader>ca` - Code action
- `<leader>cr` - Rename symbol
- `<leader>cf` - Format buffer
- `]d`/`[d` - Next/prev diagnostic
- `<leader>cd` - Show line diagnostics

### Formatting & Linting

**Conform.nvim** (lua/plugins/formatting.lua)
- Format-on-save is enabled by default (500ms timeout, LSP fallback)
- Formatters by filetype: Go (gofumpt, goimports), Python (isort, black), YAML (yamlfmt), Lua (stylua), Shell (shfmt), JSON/Markdown (prettier)

**Linting**
- Linters by filetype: Python (ruff), Go (golangci-lint), YAML (yamllint), Shell (shellcheck), Markdown (markdownlint)

## Navigation & Search

### FZF-Lua Keybindings
- `<leader>ff` - Find files (uses `fd`)
- `<leader>fr` - Recent files
- `<leader>fb` - Buffers
- `<leader>fg` - Live grep (uses `rg`)
- `<leader>fw` - Grep word under cursor
- `<leader>fh` - Help tags
- `<leader>fc` - Commands
- `<leader>fk` - Keymaps
- `<leader>fd` - Document diagnostics
- `<leader>fD` - Workspace diagnostics
- `<leader>fs` - Document symbols
- `<leader>fS` - Workspace symbols
- `<leader>gc` - Git commits
- `<leader>gs` - Git status
- `<leader>gb` - Git branches

### File Explorers
- **Neo-tree**: `<leader>e` - Toggle file explorer (filesystem/buffers/git)
- **Oil.nvim**: `<leader>o` - Edit directory as buffer (in-place file operations)

### Harpoon
Quick file navigation:
- `<leader>ha` - Add file to harpoon
- `<leader>hm` - Toggle harpoon menu
- `<C-h/j/k/l>` - Navigate to harpoon files 1-4

## Testing & Debugging

### Neotest
Configured with adapters for Go and Python.
- `<leader>tn` - Run nearest test
- `<leader>tf` - Run current file tests
- `<leader>td` - Debug nearest test (with DAP)
- `<leader>ts` - Toggle test summary
- `<leader>to` - Show test output
- `<leader>tO` - Toggle output panel
- `<leader>tS` - Stop test

### DAP (Debug Adapter Protocol)
Configured for Go and Python debugging.
- `<leader>db` - Toggle breakpoint
- `<leader>dB` - Set conditional breakpoint
- `<leader>dc` - Continue
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>dO` - Step out
- `<leader>dt` - Terminate
- `<leader>du` - Toggle UI
- `<leader>de` - Eval expression

## Git Integration

### Gitsigns
Inline git change indicators with:
- `]h`/`[h` - Next/prev hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hR` - Reset buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>hd` - Diff this
- `<leader>hD` - Diff this ~

### Git Tools
- **Neogit**: `<leader>gg` - Git status UI (Magit-like)
- **Diffview**: `<leader>gd` - Open diff view
- **Fugitive**: Classic vim-fugitive commands available

## Platform-Specific Notes

### Android/Termux Support
- LuaRocks support is disabled due to compatibility issues
- Some plugins like REST client are disabled on Android
- Configuration is optimized for terminal use

### Cross-platform Compatibility
- Works on Linux, macOS, and Termux (Android)
- All tools available via Mason
- Optimized for terminal use

## Adding New Plugins

1. Create a new file in `lua/plugins/` or add to existing category file
2. Return a table with plugin spec(s)
3. Use lazy loading triggers (`keys`, `cmd`, `ft`, `event`)
4. Add keybindings in the plugin spec, not in `config/keymaps.lua`
5. Restart Neovim or run `:Lazy reload`

Example:
```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  event = "VeryLazy",
  keys = {
    { "<leader>x", "<cmd>PluginCommand<cr>", desc = "Description" },
  },
  opts = {
    -- Plugin options
  },
}
```

## Performance Optimizations

The config includes several performance optimizations:
1. **Disabled runtime plugins**: gzip, matchit, matchparen, netrw, tar, tohtml, tutor, zip
2. **Lazy loading**: Most plugins load on-demand via triggers
3. **FZF integration**: Uses native `fzf` for speed (faster than Telescope)
4. **Blink.cmp**: Rust-based completion engine (faster than nvim-cmp)
5. **Treesitter folding**: Uses Treesitter for code folding (faster than syntax)
6. **Update checker**: Runs hourly but doesn't notify (non-intrusive)