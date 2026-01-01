# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a state-of-the-art (SOTA) Neovim configuration designed for cross-platform use (Linux, macOS, Termux/Android). It uses modern, performance-focused plugins with extensive lazy loading.

**Theme:** GitHub Plus (github-plus.nvim)
**Plugin Manager:** lazy.nvim
**Leader Key:** `<Space>`
**Local Leader:** `\`

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

2. **Plugin Loading**:
   - All 29 plugin files in `lua/plugins/` are automatically imported
   - Plugins use lazy loading via `keys`, `cmd`, `ft`, `event` triggers
   - Not lazy-loaded by default unless specified
   - Checker runs hourly for updates (notify disabled)

### Directory Structure

```
nvim/
├── init.lua                     # Main entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua        # Autocommands (augroups, auto-resize, yank highlight, etc.)
│   │   ├── keymaps.lua         # Global keybindings (window nav, buffer nav, splits)
│   │   └── options.lua         # Vim options (UI, search, indent, folding)
│   └── plugins/                # 29 plugin specification files
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
```

## Key Plugin Choices & Patterns

### Modern Replacements

- **Blink.cmp** instead of nvim-cmp (Rust-based, faster completion)
- **FZF-Lua** instead of Telescope (faster, registered as `vim.ui.select`)
- **Conform.nvim** for formatting (async, modern)
- **nvim-lint** for linting
- **GitHub Plus** colorscheme with semantic highlighting

### FZF-Lua Integration

FZF-Lua is registered as the global `vim.ui.select` provider in `navigation.lua:13`:
```lua
require("fzf-lua").register_ui_select()
```
This means all plugins using `vim.ui.select` will use FZF-Lua by default.

### Lazy Loading Patterns

Plugins use these triggers:
- **`event`**: `BufReadPre`, `BufNewFile`, `VeryLazy`, `InsertEnter`
- **`cmd`**: Load on specific command execution
- **`ft`**: Load for specific filetypes
- **`keys`**: Load when keybindings are pressed (most common)
- **`lazy = true`**: Only load as dependency

### Configuration Patterns

**Options** (`config/options.lua`):
- 2-space indentation with `expandtab`
- Relative line numbers with current line number
- System clipboard integration (`unnamedplus`)
- Persistent undo (10,000 levels)
- Treesitter folding
- Smart case-insensitive search
- Ripgrep as `grepprg`

**Keymaps** (`config/keymaps.lua`):
- Window navigation: `<C-h/j/k/l>`
- Buffer navigation: `<S-h/l>`, `]b`/`[b`
- Splits: `<leader>w-` (horizontal), `<leader>w|` (vertical)
- Leader-based organization: `<leader>f` (files), `<leader>g` (git), `<leader>c` (code), `<leader>t` (test)

**Autocmds** (`config/autocmds.lua`):
- Custom augroup creation function
- Auto-reload files on focus
- Highlight on yank (150ms)
- Auto-resize splits on window resize
- Remember last cursor position
- Close help/info/man windows with `q`
- Enable spell check in markdown/git commits
- Auto-create parent directories on save

## Language Server Configuration

### LSP Setup (lua/plugins/lsp.lua)

Configured servers:
- **Go**: gopls (gofumpt, codelenses, staticcheck, vulncheck)
- **Python**: pyright
- **YAML**: yamlls, helm_ls (via lang-yaml.lua)
- **Lua**: lua_ls (Neovim-specific workspace library)
- **JSON**: jsonls
- **Bash**: bashls
- **Docker**: dockerls
- **Markdown**: marksman
- **And more**: See server configurations in lsp.lua:68+

### LSP Keybindings (Buffer-local)

Set in `on_attach` function (lsp.lua:38-65):
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

Inlay hints are automatically enabled if the server supports them.

## Formatting & Linting

### Conform.nvim (lua/plugins/formatting.lua)

**Format-on-save** is enabled by default (500ms timeout, LSP fallback).

**Formatters by filetype:**
- **Go**: gofumpt, goimports
- **Python**: isort, black
- **YAML**: yamlfmt
- **Lua**: stylua
- **Shell**: shfmt (2-space indent)
- **JSON/Markdown**: prettier
- **JavaScript/TypeScript**: prettier

**Toggle format-on-save:**
- `:FormatDisable` - Disable globally
- `:FormatDisable!` - Disable for current buffer
- `:FormatEnable` - Enable globally
- `:FormatEnable!` - Enable for current buffer

**Manual format:**
- `<leader>cf` - Format current buffer
- `<leader>cF` - Format injected languages (e.g., code blocks in markdown)

### Linting (lua/plugins/formatting.lua)

**Linters by filetype:**
- **Python**: ruff
- **Go**: golangci-lint
- **YAML**: yamllint
- **Shell**: shellcheck
- **Markdown**: markdownlint

Linting runs on save and buffer entry.

## Testing & Debugging

### Neotest (lua/plugins/extras.lua)

Configured with adapters for Go and Python.

**Keybindings:**
- `<leader>tn` - Run nearest test
- `<leader>tf` - Run current file tests
- `<leader>td` - Debug nearest test (with DAP)
- `<leader>ts` - Toggle test summary
- `<leader>to` - Show test output
- `<leader>tO` - Toggle output panel
- `<leader>tS` - Stop test

### DAP (lua/plugins/dap.lua)

Configured for Go and Python debugging.

**Keybindings:**
- `<leader>db` - Toggle breakpoint
- `<leader>dB` - Set conditional breakpoint
- `<leader>dc` - Continue
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>dO` - Step out
- `<leader>dt` - Terminate
- `<leader>du` - Toggle UI
- `<leader>de` - Eval expression

Breakpoints are persisted across sessions.

## Navigation & Search

### FZF-Lua Keybindings (lua/plugins/navigation.lua)

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

FZF uses `bat` for previews and respects `.gitignore`.

### File Explorers

- **Neo-tree**: `<leader>e` - Toggle file explorer (filesystem/buffers/git)
- **Oil.nvim**: `<leader>o` - Edit directory as buffer (in-place file operations)

### Harpoon

Quick file navigation (configured in navigation.lua):
- `<leader>ha` - Add file to harpoon
- `<leader>hm` - Toggle harpoon menu
- `<C-h/j/k/l>` - Navigate to harpoon files 1-4

## Git Integration

### Gitsigns (lua/plugins/git.lua)

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

### Neogit & Diffview

- **Neogit**: `<leader>gg` - Git status UI (Magit-like)
- **Diffview**: `<leader>gd` - Open diff view
- **Fugitive**: Classic vim-fugitive commands available

## Language-Specific Features

### Go (lua/plugins/lang-go.lua)

Uses **ray-x/go.nvim** for enhanced Go support:
- Auto-imports on save
- Test generation
- Code coverage
- Struct tags
- Go to implementation
- Fill struct
- Comment generation

**go.nvim commands:** `:GoInstallBinaries`, `:GoFmt`, `:GoTest`, `:GoCoverage`, `:GoFillStruct`, etc.

### Python (lua/plugins/lang-python.lua)

Python-specific tools and configurations.

### YAML/Helm/Kubernetes (lua/plugins/lang-yaml.lua)

- **yaml-companion**: Schema selection for YAML files
- **kubectl.nvim**: Kubernetes resource management
- **helm_ls**: Helm chart LSP support

## Development Workflow Commands

### Common Tasks

**Install/Update Plugins:**
```vim
:Lazy                    " Open lazy.nvim UI
:Lazy sync               " Install missing + update all
:Lazy update             " Update all plugins
:Lazy clean              " Remove unused plugins
```

**LSP Management:**
```vim
:Mason                   " Open Mason UI
:MasonInstall <name>     " Install LSP/formatter/linter
:LspInfo                 " Show LSP client info
:LspRestart              " Restart LSP clients
```

**Formatting/Linting:**
```vim
:ConformInfo             " Show formatter info
:FormatDisable           " Disable format-on-save (global)
:FormatEnable            " Enable format-on-save (global)
```

**Testing:**
```vim
:Neotest summary         " Show test summary
:Neotest output          " Show test output
:Neotest run             " Run nearest test
```

**Debugging:**
```vim
:DapToggleBreakpoint     " Toggle breakpoint
:DapContinue             " Start/continue debugging
:DapTerminate            " Stop debugging
```

**File Operations:**
```vim
:Oil                     " Open directory editor
:Neotree                 " Open file tree
```

## Plugin Performance Optimizations

The config includes several performance optimizations:

1. **Disabled runtime plugins** (init.lua:54-63):
   - gzip, matchit, matchparen, netrw, tar, tohtml, tutor, zip

2. **Lazy loading**: Most plugins load on-demand via triggers

3. **FZF integration**: Uses native `fzf` for speed (faster than Telescope)

4. **Blink.cmp**: Rust-based completion engine (faster than nvim-cmp)

5. **Treesitter folding**: Uses Treesitter for code folding (faster than syntax)

6. **Update checker**: Runs hourly but doesn't notify (non-intrusive)

## Special Considerations

### Cross-platform Support

This config works on Linux, macOS, and Termux (Android). Some plugins may require external dependencies:
- `fd` - Fast file finder (FZF-Lua files)
- `rg` (ripgrep) - Fast grep (FZF-Lua grep, search)
- `bat` - Syntax highlighting for previews
- `delta` - Better git diffs
- `lazygit` - TUI for git (optional)

### Mason Installation

Mason will auto-install LSP servers, formatters, and linters on first use. You can manually install with `:MasonInstall <tool>`.

### Colorscheme

Uses **github-plus.nvim** with semantic highlighting. Falls back during installation (init.lua:41).

### Custom Settings

Global and buffer-local settings are in `lua/config/options.lua`. Modify there rather than in `init.lua`.

### Adding New Plugins

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

### Editing Plugin Files

When modifying plugin configurations:
1. Changes to plugin specs require `:Lazy reload` or restart
2. Changes to `config` functions take effect on next plugin load
3. Use `:Lazy` to check plugin status and errors
4. Use `:checkhealth` to verify plugin dependencies

## Important Files to Check

- **init.lua** - Entry point and lazy.nvim setup
- **lua/config/options.lua** - Global Neovim settings
- **lua/config/keymaps.lua** - Global keybindings
- **lua/plugins/lsp.lua** - LSP server configurations
- **lua/plugins/formatting.lua** - Formatters and linters
- **lua/plugins/navigation.lua** - FZF-Lua, file navigation
- **lua/plugins/completion.lua** - Blink.cmp setup
