# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a professional-grade **Neovim IDE configuration** (SOTA 2025 - State of the Art) built on the Kickstart framework. It provides a feature-rich polyglot development environment supporting 20+ programming languages with integrated LSP, debugging, testing, and productivity features.

**Primary Focus**: Go, Rust, Python, C/C++, TypeScript/JavaScript, and systems programming with comprehensive IDE-like capabilities.

## Key Commands

### Plugin and Tool Management

```bash
# Inside Neovim:
:Lazy                     # Open plugin manager UI
:Lazy update              # Update all plugins
:Lazy sync                # Sync plugin state with lazy-lock.json
:Mason                    # Open tool installer for LSP/DAP/formatters/linters
:MasonInstall <tool>      # Install specific language tool
:MasonUpdate              # Update tool registry
:MasonLog                 # View Mason installation logs
:checkhealth              # Verify LSP and plugin health
```

### Development Commands

```bash
# Building and Running (language-specific):
:GoTest <args>           # Run Go tests (configured via go.nvim)
:GoRun <args>            # Run Go code
:GoDebug                 # Debug Go with Delve
:CargoRun                # Run Rust code
:RustRun                 # Alternative Rust runner

# Testing Framework (Neotest):
<leader>t + a            # Run all tests in current file
<leader>t + n            # Run nearest test
<leader>t + d            # Debug nearest test
<leader>t + s            # Summary toggle
<leader>t + o            # Output panel toggle

# Linting and Formatting:
<leader>f                # Format current buffer (conform.nvim)
:Lint                    # Run linters (nvim_lint)
```

### Navigation and Search

```bash
# Fuzzy Finding (Telescope):
<leader>sf               # Search files
<leader>sg               # Search with grep (live)
<leader>sr               # Search recent files
<leader>sd               # Search diagnostics
<leader>s/               # Search current word

# File Navigation:
\                        # Toggle Neo-tree (file browser)
<leader>hj/hk/hl         # Harpoon marks (quick jump)
gd / gr / gD / K         # LSP navigation (definition, references, etc.)

# Code Structure:
<leader>o                # Toggle Aerial (symbol outline)
]m / [m                  # Jump to next/previous function
]M / [M                  # Jump to next/previous class end
```

### Debugging

```bash
# Delve (Go) / LLDB (Rust) / GDB (C/C++):
F5                       # Continue execution
F1 / F2 / F3             # Step over / Step into / Step out
<leader>b                # Toggle breakpoint
<leader>B                # Conditional breakpoint
:DapUIToggle             # Toggle debugger UI
:DapContinue             # Start/continue debugger
```

### Git Integration

```bash
:Git <command>           # Run Git command (vim-fugitive)
:Gvdiffsplit             # View diff in split
:DiffviewOpen            # Open diff view (diffview.nvim)
:DiffviewClose           # Close diff view
:Neogit                  # Magit-like interface (neogit)
```

## Architecture Overview

### 1. **Modular Plugin System**

- **269 individual plugin configuration files** in `lua/plugins/`
- Each plugin is self-contained with its own configuration
- **Lazy.nvim** manages on-demand loading for fast startup

**Key Subsystems**:

- **LSP Ecosystem** (`lspconfig.lua`, `mason.lua`): Configures 25+ language servers
- **Code Completion** (`blink_cmp.lua`): Async completion with LSP, snippets, ripgrep sources
- **Formatting & Linting** (`conform.lua`, `nvim_lint.lua`): Modern formatter/linter pipeline
- **Debugging** (`debug.lua`, `dap_ui.lua`): DAP protocol for Go, Rust, C/C++
- **Testing** (`neotest.lua`): Integration with Go, Python, Rust test runners
- **Navigation** (`telescope*.lua`, `harpoon.lua`, `flash.lua`): Fuzzy finding and jumping
- **Syntax & Parsing** (`nvim_treesitter.lua`): Tree-sitter for highlighting, folding, text objects
- **UI System** (`lualine.lua`, `snacks_dashboard.lua`, `noice.lua`): 60+ UI plugins

### 2. **Language-Specific Configurations**

Located in `lua/plugins/`:

- **Go**: `golang.lua`, `go.nvim`, `golangci-lint` integration, test runners
- **Rust**: `rustaceanvim.lua` (full IDE experience), `crates.nvim`, lldb debugging
- **Python**: `lspconfig.lua` (pyright), `ruff`, type checking, test integration
- **C/C++**: `clangd_extensions.lua`, DAP/LLDB support
- **Web**: TypeScript, HTML, CSS, Tailwind, Svelte, Vue via multiple LSPs
- **DevOps**: Kubernetes, Docker, Terraform, Helm, Ansible LSP support

### 3. **Core Dependencies**

**Essential Plugins**:
- `lazy.nvim`: Plugin manager
- `nvim-lspconfig`: Native LSP configuration
- `mason.nvim` + `mason-lspconfig`: Language server management
- `nvim-treesitter`: Syntax parsing
- `blink.cmp`: Completion engine
- `nvim-dap`: Debugging adapter protocol
- `conform.nvim`: Code formatting
- `telescope.nvim`: Fuzzy finder

**Loaded On-Demand**: Most plugins lazy-load on specific events:
- File opening: LSP, formatters, linters
- Text insertion: Completion, snippets
- Command entry: DAP, testing
- Specific file types: Language-specific tools

### 4. **Key Configuration Points**

**`init.lua`** - Main entry point with:
- Leader key: `<Space>`
- Nerd Font support flag
- Folding with Tree-sitter
- Relative line numbers for navigation
- Clipboard sync
- Undo history
- Search settings (case-insensitive with smartcase)

**`lua/plugins/`** - Fine-grained plugin control:
- Each plugin has its own file for maintainability
- Explicit dependencies for proper initialization order
- Event-driven lazy loading configuration

**`lazy-lock.json`** - Version pinning for reproducibility (294 plugins)

**`after/lsp/`** - Language-specific LSP post-configuration hooks

## Common Development Workflows

### Adding a New Language

1. **Check if LSP exists**: Search `lspconfig.lua` for language
2. **Configure in lspconfig.lua**: Add server configuration with capabilities/on_attach
3. **Install tool**: Use `:MasonInstall <server_name>`
4. **Add formatter** (optional): Configure in `conform.lua`
5. **Add linter** (optional): Configure in `nvim_lint.lua`
6. **Test**: Open a file and verify LSP works (`:LspInfo`)

### Setting Up Debugging

1. **Go**: Uses Delve automatically via mason-nvim-dap
2. **Rust**: Configured in `rustaceanvim.lua` with LLDB
3. **Python**: Add `debugpy` via Mason for Python DAP
4. **C/C++**: Uses GDB/LLDB, configure in `debug.lua`

### Extending Completion

- **Add source**: Edit `blink_cmp.lua` sources section
- **Custom snippets**: Add to `snippets/` directory (LuaSnip format)
- **Dependency injection**: Completions auto-receive LSP capabilities

### Customizing Dashboard

Two dashboard options available:

**Option 1: snacks_dashboard.lua (default)**
- Floating dashboard with sections
- Simpler configuration
- To disable: set `dashboard = { enabled = false }`

**Option 2: dashboard_nvim.lua (SOTA)**
- Widescreen layout with ASCII art
- Git integration, quick shortcuts
- Full setup in SOTA_DASHBOARD_SETUP.md

To switch: Disable snacks dashboard and ensure dashboard_nvim is enabled.

## Plugin Organization by Function

### Navigation & Finding (12 files)
`telescope*.lua`, `harpoon.lua`, `neo-tree.lua`, `flash.lua`, `aerial.lua`, `portal.lua`, `marks.lua`

### LSP & Completion (8 files)
`lspconfig.lua`, `blink_cmp.lua`, `mason.lua`, `rustaceanvim.lua`, `clangd_extensions.lua`, `golang.lua`, `go.nvim`, `crates.nvim`

### Formatting & Linting (3 files)
`conform.lua`, `nvim_lint.lua`, `none_ls.lua`

### Debugging & Testing (5 files)
`debug.lua`, `dap_ui.lua`, `dap_virtual_text.lua`, `neotest.lua`, `mason-nvim-dap`

### UI & Appearance (60+ files)
Lualine, notifications, indent guides, colorschemes, themes, transparency support

### Code Editing (30+ files)
Tree-sitter, surround, autopairs, multi-cursor, refactoring, sorting, alignment

### Git & Version Control (4 files)
`vim_fugitive.lua`, `diffview.lua`, `gitsigns.lua`, `neogit.lua`

### Productivity (100+ files)
Macro recording, session management, project bookmarking, AI integration, documentation tools

## Important Notes

### File Type Specifics

- **Go files**: Auto-linted with golangci-lint, tested with neotest-golang
- **Rust files**: Full IDE experience via rustaceanvim, cargo integration
- **Python files**: Type checking via pyright, fast formatting with ruff
- **TypeScript files**: LSP via ts_ls (TypeScript Language Server)

### Performance Considerations

- Lazy loading ensures fast startup (plugins load on-demand)
- Treesitter incremental parsing for large files
- Ripgrep integration in completion for fast text search
- Virtual text (diagnostics) can be disabled if slow: toggle with `:DiagnosticsToggle`

### Configuration Patterns

- **on_attach hooks**: Global setup in `lspconfig.lua`, language-specific in respective plugins
- **Capabilities chain**: blink.cmp provides capabilities → passed to all LSP servers
- **Dependency declaration**: Plugins specify dependencies for proper load order
- **Event-driven loading**: Plugins define `event` triggers (e.g., `BufReadPre`, `InsertEnter`)

## Troubleshooting

### LSP not working
```
:checkhealth                 # Verify installation
:LspInfo                    # Show current LSP status
:MasonLog                   # Check tool installation logs
```

### Formatting not working
```
:ConformInfo               # Check available formatters
:Lint                      # Check linters
```

### Debugger issues
```
:DapContinue               # Start debug session
:DapInfo                   # Check DAP status (if available)
```

### Plugin conflicts
- Check `lazy-lock.json` for version conflicts
- Run `:Lazy sync` to resolve dependency issues
- Inspect individual plugin configs in `lua/plugins/`

## File Editing Approach

When modifying the configuration:

1. **Single concern per plugin file**: Each plugin gets its own file in `lua/plugins/`
2. **Keep dependencies explicit**: Declare required plugins in `dependencies = { ... }`
3. **Use lazy loading**: Set `event = { ... }` for on-demand plugin loading
4. **Test language setup**: Verify with `:LspInfo`, `:checkhealth` after changes
5. **Update lock file**: Run `:Lazy sync` to update `lazy-lock.json`

## Additional Resources

- **SOTA_DASHBOARD_SETUP.md**: Dashboard configuration guide
- **Kickstart.nvim**: Base framework (system overview)
- **Neovim docs**: `:help` in editor
- **Individual plugin configs**: Each `lua/plugins/*.lua` file is self-documented
