# Neovim SOTA Setup - Complete Plugin & Tool List

Complete inventory of all plugins, LSP servers, formatters, linters, and tools installed in this configuration.

---

## 📦 Core Plugins

### Plugin Management
- **folke/lazy.nvim** - Modern plugin manager with lazy loading
- **nvim-lua/plenary.nvim** - Lua utility library (dependency)
- **MunifTanjim/nui.nvim** - UI component library
- **nvim-tree/nvim-web-devicons** - File icons
- **ray-x/guihua.lua** - GUI library for floating windows
- **kkharji/sqlite.lua** - SQLite bindings

---

## 🎨 UI & Appearance

### Theme
- **projekt0n/github-plus.nvim** - GitHub Plus colorscheme with semantic highlighting

### Status & UI Components
- **nvim-lualine/lualine.nvim** - Statusline
- **akinsho/bufferline.nvim** - Buffer tabs
- **nvimdev/dashboard-nvim** - Startup dashboard
- **folke/which-key.nvim** - Keybinding popup helper
- **rcarriga/nvim-notify** - Notification manager
- **folke/noice.nvim** - Enhanced UI for messages, cmdline, popups

### Window & Buffer Management
- **Bekaboo/dropbar.nvim** - Winbar with breadcrumbs (SOTA)
- **utilyre/barbecue.nvim** - VSCode-like winbar (alternative, disabled)
- **b0o/incline.nvim** - Floating statusline per window
- **lewis6991/satellite.nvim** - Scrollbar with diagnostics/git/marks
- **luukvbaal/statuscol.nvim** - Customizable status column
- **nvimdev/noline.nvim** - Hide cursorline in inactive windows
- **TaDaa/vimade** - Dim inactive windows

### Visual Enhancements
- **mawkler/modicator.nvim** - Mode-based cursor color
- **Bekaboo/deadcolumn.nvim** - Dynamic colorcolumn
- **m4xshen/smartcolumn.nvim** - Smart colorcolumn per filetype
- **lukas-reineke/indent-blankline.nvim** - Indentation guides
- **nvim-zh/colorful-winsep.nvim** - Colorful window separators (if installed)
- **winston0410/range-highlight.nvim** - Highlight command ranges
- **uga-rosa/ccc.nvim** - Color picker and highlighter

### Window Utilities
- **shortcuts/no-neck-pain.nvim** - Center buffer view
- **nvim-focus/focus.nvim** - Auto-resize focused splits
- **sindrets/winshift.nvim** - Rearrange windows
- **xiyaowong/transparent.nvim** - Transparent background toggle
- **zaldih/themery.nvim** - Theme switcher

---

## 💻 Code Intelligence

### LSP Core
- **neovim/nvim-lspconfig** - LSP configurations
- **williamboman/mason.nvim** - LSP/formatter/linter installer
- **williamboman/mason-lspconfig.nvim** - Mason + LSP integration
- **WhoIsSethDaniel/mason-tool-installer.nvim** - Auto-install Mason tools

### LSP Enhancements
- **ray-x/lsp_signature.nvim** - Function signatures while typing
- **https://git.sr.ht/~whynothugo/lsp_lines.nvim** - Diagnostics as virtual lines
- **linrongbin16/lsp-progress.nvim** - LSP loading progress
- **nvimdev/lspsaga.nvim** - Enhanced LSP UI
- **onsails/lspkind.nvim** - VSCode-like icons for completion
- **SmiteshP/nvim-navic** - LSP context breadcrumbs
- **SmiteshP/nvim-navbuddy** - Breadcrumb navigation UI
- **Wansmer/symbol-usage.nvim** - Symbol references in virtual text
- **kosayoda/nvim-lightbulb** - Code action indicator
- **VidocqH/lsp-lens.nvim** - Show references/implementations count
- **rachartier/tiny-inline-diagnostic.nvim** - Better inline diagnostics
- **m-demare/hlargs.nvim** - Highlight function arguments
- **jubnzv/virtual-types.nvim** - Virtual type annotations
- **dgagn/agrolens.nvim** - Code lens enhancements
- **folke/lazydev.nvim** - Better Lua LSP for Neovim
- **Bilal2453/luvit-meta** - Luvit meta files
- **b0o/schemastore.nvim** - JSON schemas

---

## ✍️ Completion & Snippets

### Completion Engine
- **saghen/blink.cmp** - Rust-based completion engine (SOTA)
- **windwp/nvim-autopairs** - Auto-close brackets/quotes

### Blink.cmp Sources
- **Davincible/blink-cmp-conventional-commits** - Conventional commit messages
- **moyiz/blink-emoji.nvim** - Emoji completion
- **xzbdmw/blink-cmp-env** - Environment variables
- **Snikimonkd/blink-cmp-git** - Git completion
- **mikavilpas/blink-ripgrep.nvim** - Ripgrep fuzzy completion
- **xzbdmw/blink-cmp-tmux** - Tmux pane completion
- **saghen/blink.compat** - nvim-cmp compatibility layer

### Snippets
- **L3MON4D3/LuaSnip** - Snippet engine
- **rafamadriz/friendly-snippets** - Pre-configured snippets (50+ languages)

---

## 🌳 Treesitter

### Core
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting & code understanding
- **nvim-treesitter/nvim-treesitter-textobjects** - Textobject selections
- **nvim-treesitter/nvim-treesitter-context** - Show context at top

### Extensions
- **nvim-treesitter/playground** - Treesitter playground
- **RRethy/nvim-treesitter-textsubjects** - Smart textobject selection

---

## 🔍 Navigation & Search

### Fuzzy Finders
- **ibhagwan/fzf-lua** - Fast fuzzy finder (primary)
- **nvim-telescope/telescope.nvim** - Universal fuzzy finder (secondary)
- **nvim-telescope/telescope-fzf-native.nvim** - FZF native sorting

### Telescope Extensions
- **debugloop/telescope-undo.nvim** - Undo tree picker
- **jvgrootveld/telescope-zoxide** - Zoxide integration
- **nvim-telescope/telescope-project.nvim** - Project management
- **nvim-telescope/telescope-media-files.nvim** - Media file preview
- **crispgm/telescope-heading.nvim** - Markdown heading picker
- **cljoly/telescope-repo.nvim** - Git repository picker
- **prochri/telescope-all-recent.nvim** - Frecency sorting
- **fdschmidt93/telescope-egrepify.nvim** - Better live grep

### File Explorers
- **nvim-neo-tree/neo-tree.nvim** - File tree explorer
- **stevearc/oil.nvim** - Edit filesystem as buffer
- **mikavilpas/yazi.nvim** - Yazi file manager integration

### Motion & Navigation
- **ThePrimeagen/harpoon** - Quick file navigation
- **stevearc/flash.nvim** - Enhanced f/t motions and jump
- **echasnovski/mini.ai** - Enhanced textobjects
- **echasnovski/mini.bracketed** - Bracket navigation

### Search Enhancements
- **MagicDuck/grug-far.nvim** - Search and replace UI
- **cshuaimin/ssr.nvim** - Structural search and replace
- **kevinhwang91/nvim-hlslens** - Better search highlighting
- **chrisgrieser/nvim-rip-substitute** - Fast substitute with ripgrep
- **AckslD/muren.nvim** - Multiple regex replace
- **ray-x/sad.nvim** - Search and destroy
- **Mr-LLLLL/interestingwords.nvim** - Highlight word under cursor

---

## 📝 Editing

### Text Manipulation
- **echasnovski/mini.surround** - Surround operations
- **numToStr/Comment.nvim** - Smart commenting
- **kylechui/nvim-surround** - Advanced surround (alternative)
- **windwp/nvim-ts-autotag** - Auto-close HTML tags
- **andymass/vim-matchup** - Enhanced % matching
- **monaqa/dial.nvim** - Enhanced increment/decrement

### Multi-cursor & Selection
- **smoka7/multicursors.nvim** - Multiple cursors
- **mg979/vim-visual-multi** - Visual multi-cursor (alternative)

### Advanced Editing
- **folke/flash.nvim** - Jump to any location
- **ggandor/leap.nvim** - Motion plugin (alternative)
- **echasnovski/mini.splitjoin** - Split/join code blocks
- **Wansmer/treesj** - Split/join with treesitter

---

## 🎯 Git Integration

- **lewis6991/gitsigns.nvim** - Git signs and hunks
- **NeogitOrg/neogit** - Magit-like git UI
- **sindrets/diffview.nvim** - Git diff view
- **tpope/vim-fugitive** - Classic git commands
- **akinsho/git-conflict.nvim** - Git conflict resolution
- **kdheepak/lazygit.nvim** - Lazygit integration

---

## 🐛 Debugging & Testing

### DAP (Debug Adapter Protocol)
- **mfussenegger/nvim-dap** - Debug adapter protocol client
- **rcarriga/nvim-dap-ui** - DAP UI
- **theHamsta/nvim-dap-virtual-text** - Virtual text during debugging
- **Weissle/persistent-breakpoints.nvim** - Persistent breakpoints
- **leoluz/nvim-dap-go** - Go debugging
- **mfussenegger/nvim-dap-python** - Python debugging

### Testing
- **nvim-neotest/neotest** - Testing framework
- **nvim-neotest/neotest-go** - Go test adapter
- **nvim-neotest/neotest-python** - Python test adapter
- **nvim-neotest/neotest-jest** - Jest adapter
- **nvim-neotest/neotest-plenary** - Plenary test adapter
- **nvim-neotest/nvim-nio** - Async IO library for neotest
- **antoinemadec/FixCursorHold.nvim** - Fix CursorHold performance

---

## 🔧 Formatting & Linting

### Formatters
- **stevearc/conform.nvim** - Modern async formatter
- **mfussenegger/nvim-lint** - Asynchronous linter

### Null-LS Alternative
- **nvimtools/none-ls.nvim** - null-ls successor (if used)

---

## 🛠️ Utilities

### Task & Project Management
- **stevearc/overseer.nvim** - Task runner
- **ahmedkhalf/project.nvim** - Project management
- **coffebar/neovim-project** - Project switcher (alternative)
- **folke/persistence.nvim** - Session management
- **olimorris/persisted.nvim** - Session management (alternative)

### Terminal
- **akinsho/toggleterm.nvim** - Toggle terminal
- **willothy/flatten.nvim** - Open files from terminal in parent nvim

### Diagnostics & Quickfix
- **folke/trouble.nvim** - Pretty diagnostics and quickfix
- **kevinhwang91/nvim-bqf** - Better quickfix window
- **stevearc/quicker.nvim** - Improved quickfix

### Code Actions & Refactoring
- **ThePrimeagen/refactoring.nvim** - Refactoring operations
- **smjonas/inc-rename.nvim** - Incremental LSP rename
- **aznhe21/actions-preview.nvim** - Code action preview
- **dnlhc/glance.nvim** - Pretty LSP locations
- **rmagatti/goto-preview.nvim** - Preview definitions in float
- **Wansmer/sibling-swap.nvim** - Swap function arguments

### Marks & Bookmarks
- **chentoast/marks.nvim** - Enhanced marks
- **tomasky/bookmarks.nvim** - Persistent bookmarks
- **ThePrimeagen/harpoon** - Quick file marks

### Folding
- **kevinhwang91/nvim-ufo** - Modern fold with treesitter/LSP
- **kevinhwang91/promise-async** - Promise library for ufo

### Highlighting
- **NvChad/nvim-colorizer.lua** - Color highlighter
- **RRethy/vim-illuminate** - Highlight word under cursor
- **folke/todo-comments.nvim** - Highlight TODO comments
- **tzachar/local-highlight.nvim** - Highlight word under cursor locally

### Tmux Integration
- **aserowy/tmux.nvim** - Tmux integration
- **numToStr/Navigator.nvim** - Tmux pane navigation
- **alexghergh/nvim-tmux-navigation** - Seamless tmux/nvim navigation

---

## 🌐 Language-Specific

### Go
- **ray-x/go.nvim** - Go development tools
- **leoluz/nvim-dap-go** - Go debugging
- **fatih/vim-go** - Classic Go plugin

### Python
- **mfussenegger/nvim-dap-python** - Python debugging
- **linux-cultist/venv-selector.nvim** - Python venv selector

### YAML/Kubernetes/Helm
- **someone-stole-my-name/yaml-companion.nvim** - YAML schema support
- **rrethy/vim-yaml-folds** - YAML folding
- **towolf/vim-helm** - Helm chart support
- **Ramilito/kubectl.nvim** - Kubectl integration

### Rust
- **mrcjkb/rustaceanvim** - Rust tools (if configured)
- **saecki/crates.nvim** - Cargo.toml crate management

### Web/JavaScript/TypeScript
- **jose-elias-alvarez/typescript.nvim** - TypeScript utilities
- **dmmulroy/tsc.nvim** - TypeScript compiler integration

### Markdown
- **iamcco/markdown-preview.nvim** - Markdown preview
- **OXY2DEV/markview.nvim** - Enhanced markdown rendering

### Other Languages
- **IndianBoy42/tree-sitter-just** - Justfile support
- **simrat39/rust-tools.nvim** - Rust tools

---

## 🧩 Mini.nvim Modules

- **echasnovski/mini.ai** - Enhanced textobjects
- **echasnovski/mini.surround** - Surround operations
- **echasnovski/mini.clue** - Keymap hints
- **echasnovski/mini.fuzzy** - Fuzzy matching
- **echasnovski/mini.hipatterns** - Highlight patterns
- **echasnovski/mini.snippets** - Snippet engine
- **echasnovski/mini.bracketed** - Bracket navigation
- **echasnovski/mini.icons** - Icon provider
- **echasnovski/mini.splitjoin** - Split/join code
- **echasnovski/mini.animate** - Animations

---

## 🎬 Productivity & QOL

### Macros & Automation
- **ecthelionvi/NeoComposer.nvim** - Macro management
- **chrisgrieser/nvim-recorder** - Macro recorder
- **kr40/nvim-macros** - Macro enhancements

### Debug Printing
- **andrewferrier/debugprint.nvim** - Insert debug prints

### Templates & Snippets
- **cvigilv/esqueleto.nvim** - File templates
- **chrisgrieser/nvim-scissors** - Snippet management

### Screenshots & Export
- **michaelrommel/nvim-silicon** - Code screenshots with silicon
- **ellisonleao/carbon-now.nvim** - Carbon.now.sh integration
- **TobinPalmer/rayso.nvim** - Ray.so code screenshots

### Drawing & Diagrams
- **jbyuki/venn.nvim** - ASCII diagrams

### Registers & Clipboard
- **AckslD/nvim-neoclip.lua** - Clipboard manager
- **tversteeg/registers.nvim** - Register preview

### Time Tracking
- **gaborvecsei/usage-tracker.nvim** - Track coding time

### Gestures
- **smoka7/gesture.nvim** - Mouse gestures

### Remote & SSH
- **chipsenkbeil/distant.nvim** - Remote file editing

### Database
- **kristijanhusak/vim-dadbod-ui** - Database UI
- **tpope/vim-dadbod** - Database integration
- **kristijanhusak/vim-dadbod-completion** - Database completion
- **kndndrj/nvim-dbee** - Modern database client

### REST Client
- **rest-nvim/rest.nvim** - HTTP REST client
- **diepm/vim-rest-console** - REST console

### Notes & Organization
- **epwalsh/obsidian.nvim** - Obsidian integration
- **nvim-orgmode/orgmode** - Org-mode
- **nvim-neorg/neorg** - Neorg notes

### GitHub
- **pwntester/octo.nvim** - GitHub issues/PRs

### CSV
- **cameron-wags/rainbow_csv.nvim** - CSV highlighting

### Jupyter
- **kiyoon/jupynium.nvim** - Jupyter notebook integration

### Sorting
- **sQVe/sort.nvim** - Sorting utilities

### Advanced Text
- **nvim-pack/nvim-spectre** - Project-wide search and replace
- **AckslD/nvim-FeMaco.lua** - Edit code blocks in markdown

---

## 🔧 Mason Tools Installed

### LSP Servers (20+)
- **gopls** - Go
- **pyright** - Python
- **yamlls** - YAML
- **helm_ls** - Helm charts
- **lua_ls** - Lua
- **jsonls** - JSON
- **ts_ls** - TypeScript/JavaScript
- **html** - HTML
- **cssls** - CSS
- **tailwindcss** - Tailwind CSS
- **eslint** - ESLint LSP
- **bashls** - Bash
- **dockerls** - Docker
- **docker_compose_language_service** - Docker Compose
- **terraformls** - Terraform
- **marksman** - Markdown
- **sqlls** - SQL
- **rust_analyzer** - Rust

### Formatters (25+)
- **gofumpt** - Go formatter
- **goimports** - Go import formatter
- **goimports-reviser** - Go import organizer
- **golines** - Go line length formatter
- **black** - Python formatter
- **isort** - Python import formatter
- **ruff** - Python formatter (fast)
- **yamlfmt** - YAML formatter
- **stylua** - Lua formatter
- **shfmt** - Shell script formatter
- **prettier** - Multi-language formatter
- **prettierd** - Prettier daemon (faster)
- **sql-formatter** - SQL formatter
- **markdownlint** - Markdown formatter
- **markdownlint-cli2** - Markdown formatter CLI
- **markdown-toc** - Markdown TOC generator
- **fixjson** - JSON formatter
- **rustfmt** - Rust formatter

### Linters (15+)
- **golangci-lint** - Go linter
- **golangci-lint-langserver** - golangci-lint LSP
- **ruff** - Python linter (fast)
- **pylint** - Python linter
- **mypy** - Python type checker
- **yamllint** - YAML linter
- **luacheck** - Lua linter
- **selene** - Lua linter (alternative)
- **shellcheck** - Shell script linter
- **eslint_d** - Fast ESLint
- **hadolint** - Dockerfile linter
- **tflint** - Terraform linter
- **sqlfluff** - SQL linter
- **jsonlint** - JSON linter
- **actionlint** - GitHub Actions linter

### Debuggers (DAP)
- **delve** - Go debugger
- **debugpy** - Python debugger
- **js-debug-adapter** - JavaScript/TypeScript debugger

### Go Tools
- **gomodifytags** - Struct tag management
- **impl** - Interface implementation
- **gotests** - Test generation
- **iferr** - Error handling generator

---

## 📊 Statistics

- **Total Plugins**: ~140+
- **LSP Servers**: 20+
- **Formatters**: 25+
- **Linters**: 15+
- **Telescope Extensions**: 10
- **Blink.cmp Sources**: 7
- **Treesitter Parsers**: 20+ (auto-installed)
- **DAP Adapters**: 3
- **Mini.nvim Modules**: 10

---

## 🎯 Key Features

### Performance
- Lazy loading for most plugins
- Blink.cmp (Rust-based) for fast completion
- FZF-Lua for blazing fast fuzzy finding
- Conform.nvim for async formatting

### Modern Replacements
- ✅ Blink.cmp → nvim-cmp (Rust-based)
- ✅ FZF-Lua → Primary fuzzy finder
- ✅ Telescope → Secondary (with 10 extensions)
- ✅ Conform.nvim → null-ls (async formatting)
- ✅ nvim-lint → Built-in linting

### Cross-Platform
- Works on Linux, macOS, and Termux (Android)
- All tools available via Mason
- Optimized for terminal use

### Developer Experience
- Comprehensive language support (Go, Python, YAML, Lua, Web, Shell, etc.)
- Full LSP integration with enhancements
- DAP debugging for multiple languages
- Neotest for running tests
- Git integration with multiple tools
- Session persistence
- Project management

---

*Generated for Neovim SOTA Configuration v1.0*
*Last Updated: 2026-01-01*
