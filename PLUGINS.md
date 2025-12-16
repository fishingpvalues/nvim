# Complete Plugin List

This configuration includes **150+ plugins** from your new.txt file, all configured with SOTA (State of the Art) settings fetched from their GitHub repositories.

## Plugin Organization (31 Files)

### Core Infrastructure
1. **colorscheme.lua** - GitHub Plus theme (tommarien/github-plus.nvim)
2. **mason.lua** - LSP/DAP/formatter/linter installer with all tools for Go, Python, YAML, Helm, Lua
3. **lsp.lua** - LSP configuration for gopls, pyright, yamlls, helm-ls, lua_ls, jsonls, bashls, dockerls, marksman
4. **treesitter.lua** - Syntax highlighting for 25+ languages
5. **plugin-management.lua** - Plenary, NUI, Guihua, SQLite, and other dependencies

### UI & Visual
6. **ui.lua** - Dashboard, Lualine, Bufferline, Noice, Notify, Which-key, Web-devicons
7. **ui-enhancements.lua** - Modicator, Deadcolumn, Smartcolumn, Satellite, Statuscol, Noline, Vimade, No-neck-pain, Focus, Winshift, Transparent, Range-highlight, CCC, Agrolens, Themery

### Completion & Snippets
8. **completion.lua** - Blink.cmp with full SOTA config, LuaSnip, Autopairs, Friendly-snippets
9. **blink-sources.lua** - Blink conventional commits, emoji, env, git, LaTeX, tmux sources

### Navigation
10. **navigation.lua** - FZF-lua (replaces Telescope), Neo-tree, Oil, Harpoon
11. **file-navigation.lua** - Arrow, Portal, Trailblazer, Buffer-manager, Bufdelete, Yazi, Workspaces, Neoscroll, Registers, Peekup

### Editing
12. **editing.lua** - Flash, Surround, Comment, Mini.ai, Various-textobjs, Multicursors, Matchup, Dial, Indent-blankline, Todo-comments
13. **mini.lua** - Mini.clue, Mini.surround, Mini.fuzzy, Mini.snippets, Mini.hipatterns, Mini.bufremove
14. **search-replace.lua** - Grug-far, SSR, Hlslens, Rip-substitute, Muren, Sad, Interestingwords

### Git
15. **git.lua** - Gitsigns, Neogit, Diffview, Fugitive

### LSP Enhancements
16. **lsp-enhancements.lua** - LSPSaga, LSPKind, Navic, Navbuddy, LazyDev, Lightbulb, LSP-lens, Symbol-usage, Dropbar, Hlargs, Tiny-inline-diagnostic, Virtual-types

### Language Support
17. **lang-go.lua** - Go.nvim, DAP-go, Vim-go
18. **lang-python.lua** - DAP-python, Venv-selector
19. **python-extras.lua** - Swenv
20. **lang-yaml.lua** - YAML-companion, Kubectl, Vim-helm
21. **lang-specialized.lua** - Rustaceanvim, Crates, Haskell-tools, Flutter-tools, Metals, JDTLS, Clangd-extensions, Package-info, Tree-sitter-just, YAML.nvim, JQX, Rainbow-CSV, Orgmode, Obsidian, Jupynium, Log-highlight, Nerdy

### Debugging
22. **dap.lua** - nvim-DAP, DAP-UI, DAP-virtual-text, Persistent-breakpoints

### Formatting & Linting
23. **formatting.lua** - Conform.nvim (gofumpt, black, isort, ruff, yamlfmt, stylua, prettier, shfmt), nvim-lint (golangci-lint, ruff, yamllint, luacheck, shellcheck, markdownlint)
24. **none-ls.lua** - None-ls (null-ls fork) for additional formatting/diagnostics

### Utilities
25. **utilities.lua** - Overseer, Trouble, Persistence, Toggleterm, Project, BQF, Colorizer, Illuminate, Marks, Bookmarks, UFO, Inc-rename, Spectre, Glance, Goto-preview, Fidget, Dressing
26. **productivity.lua** - Macrothis, Debugprint, Esqueleto, Scissors, Snippet-converter, Easypick, Carbon-now, Rayso, Venn, Track, Gesture

### Development Tools
27. **tools.lua** - Octo (GitHub), Remote-nvim, Netman, Kubectl, DBee, Navigator, Open, Sort, Persisted, Schema-companion
28. **extras.lua** - Markdown-preview, Markview, Neotest, Refactoring, REST.nvim, Dadbod-UI, Yanky, Aerial, Neoclip, Better-escape, Smart-splits, Legendary, Tmux, Zen-mode, Twilight, LSP-signature, Outline, Barbecue, Incline, LSP-lines

### Treesitter Extensions
29. **treesitter-extended.lua** - Treesitter-playground, Treesitter-textsubjects
30. **treesitter-context** - (in treesitter.lua) Show code context

### Configuration
31. **config/** - options.lua, keymaps.lua, autocmds.lua

## Excluded Plugins

**Telescope plugins removed** (as requested - using FZF-lua instead):
- telescope_all_recent
- telescope_alternate
- telescope_egrepify
- telescope_heading
- telescope_media_files
- telescope_repo
- telescope_rooter
- telescope_undo
- telescope_zoxide

## Mason Tools (Auto-installed)

### LSP Servers
- gopls (Go)
- pyright (Python)
- yamlls (YAML)
- helm-ls (Helm)
- lua_ls (Lua)
- jsonls (JSON)
- bashls (Bash)
- dockerls (Docker)
- marksman (Markdown)

### Formatters
- gofumpt, goimports (Go)
- black, isort, ruff (Python)
- yamlfmt (YAML)
- stylua (Lua)
- prettier (Multi-language)
- shfmt (Shell)

### Linters
- golangci-lint (Go)
- ruff (Python)
- yamllint (YAML)
- luacheck (Lua)
- shellcheck (Shell)
- markdownlint (Markdown)
- actionlint (GitHub Actions)

### Debuggers
- delve (Go)
- debugpy (Python)

### Go Tools
- gomodifytags
- impl

## Key Features

✅ **177 plugins** from new.txt
✅ **All SOTA configurations** fetched from GitHub
✅ **No Telescope** - pure FZF-lua
✅ **GitHub Plus theme** integrated throughout
✅ **Cross-platform** (Linux/macOS)
✅ **Format on save** for all languages
✅ **Complete debugging** support
✅ **Smart completion** with Blink.cmp
✅ **Comprehensive Git integration**
✅ **Full Kubernetes/Helm support**
✅ **Database client** included
✅ **Jupyter notebook** support
✅ **Markdown rendering**
✅ **Code screenshots** (Carbon, Rayso)
✅ **Session management**
✅ **Task runner** (Overseer)
✅ **Testing** (Neotest)
✅ **Refactoring** tools

## Configuration Highlights

- **Blink.cmp**: Full SOTA config with all sources, ghost text, auto-brackets
- **FZF-lua**: Complete telescope replacement with all pickers and integrations
- **LSP**: Inlay hints, virtual text diagnostics, breadcrumbs, symbol usage
- **Treesitter**: 25+ languages, incremental selection, text objects
- **DAP**: Full debugging UI with virtual text and persistent breakpoints
- **Conform**: Auto-format on save for all languages
- **Mason**: Auto-install all tools on startup

All configurations are based on best practices fetched directly from plugin GitHub repositories!
