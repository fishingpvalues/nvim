-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- SOTA Neovim plugin setup: minimal, modern, modular
return {
  require('plugins.transparent'), -- Transparency across all UI elements
  require('plugins.codesettings'), -- Load project-specific LSP settings from VS Code config files
  require('plugins.videre'), -- Visual explorer for JSON/YAML files as graph
  require('plugins.buffer_sticks'), -- Visual buffer indicator & picker
  require('plugins.filler_begone'), -- Remove unnecessary filler lines
  require('plugins.mini_nvim'), -- Essential SOTA plugin suite
  require('plugins.gitsigns'), -- Critical Git integration
  require('plugins.nvim_treesitter'), -- Main treesitter configuration
  require('plugins.log_highlight'), -- Syntax highlighting for log files
  require('plugins.session'), -- SOTA session management
  require('plugins.region_folding'),
  require('plugins.lualine'),
  require('plugins.github_dark'),
  require('plugins.trouble'),
  require('plugins.indent_blankline'),
  require('plugins.luasnip'),
  require('plugins.mini_snippets'),
  require('plugins.snippet_converter'),
  require('plugins.nvim_snippy'),
  require('plugins.carbon_now'),
  require('plugins.rayso'),
  require('plugins.haskell_snippets'),
  require('plugins.esqueleto'),
  require('plugins.nvim_scissors'),
  require('plugins.tesoura'),
  require('plugins.web_devicons'),
  -- Add mini.icons for icon support
  {
    "echasnovski/mini.icons",
    version = false,
    config = function()
      require("mini.icons").setup()
    end,
  },
  require('plugins.illuminate'),
  require('plugins.yazi'), -- Keep one file browser (yazi is modern and fast)
  require('plugins.pickme'),
  require('plugins.noice'),
  require('plugins.dap_ui'),
  require('plugins.dap_virtual_text'),
  require('plugins.flash'),
  require('plugins.diffview'),
  require('plugins.rainbow_csv'),
  require('plugins.neoscroll'),
  require('plugins.referencer'),
  require('plugins.mini_clue'), -- Modern keybinding hints instead of which-key
  require('plugins.vscode_diff'),
  require('plugins.persistent_breakpoints'),
  require('plugins.hodur'),
  require('plugins.comment'),
  require('plugins.autopairs'),
  require('plugins.toggleterm'),
  require('plugins.session'),
  require('plugins.markdown_preview'),
  require('plugins.blink_cmp'), -- Modern completion, no need for lspsaga with blink.cmp
  require('plugins.mason'),
  require('plugins.debug'),
  require('plugins.indent_line'),
  -- SOTA plugins added 2024:
  require('plugins.treesitter_textobjects'),
  require('plugins.treesitter_textsubjects'),
  require('plugins.treesitter_context'),
  require('plugins.treesitter_playground'),
  require('plugins.treesitter_modules'),
  require('plugins.mini_surround'), -- Keep modern mini.surround, remove nvim-surround
  require('plugins.fidget'),
  require('plugins.todo_comments'),
  require('plugins.hlargs'),
  require('plugins.incline'),
  require('plugins.ufo'),
  require('plugins.bqf'),
  require('plugins.spectre'),
  require('plugins.agrolens'),
  require('plugins.tree_sitter_just'),
  require('plugins.log_highlight'),
  -- Core plugins from kickstart (already present):
  -- blink.cmp, nvim-treesitter, nvim-lspconfig, mason, gitsigns, autopairs, which-key, conform
  require('plugins.json_graph_view'),
  require('plugins.coach'),
  require('plugins.sort'),
  -- Language support and development
  require('plugins.neotest'),
  require('plugins.refactoring'),
  require('plugins.rustaceanvim'),
  require('plugins.lspconfig'),
  require('plugins.schemastore'),
  require('plugins.golang'),
  require('plugins.conform'),
  require('plugins.none_ls'),

  -- Data Science & DevOps
  require('plugins.jupynium'),
  require('plugins.kubernetes'),

  -- New plugins: buffer management, settings, type annotations, JSON explorer
  require('plugins.buffer_sticks'),
  require('plugins.codesettings'),
  require('plugins.lazydev'),
  require('plugins.videre'),

  -- LSP Enhancement Plugins (SOTA 2024) - Keep essential tools
  require('plugins.aerial'),
  require('plugins.actions_preview'),
  require('plugins.nvim_navbuddy'),
  require('plugins.outline'),
  require('plugins.lsp_progress'),
  require('plugins.goto_preview'),
  require('plugins.tiny_inline_diagnostic'),
  require('plugins.virtual_types'),
  require('plugins.garbage_day'),
  require('plugins.rustaceanvim_extended'),
  require('plugins.nvim_metals'),
  require('plugins.haskell_tools'),
  require('plugins.nvim_jdtls'),

  -- Language-Specific Support (SOTA 2024)
  -- Python
  require('plugins.swenv'),
  require('plugins.python_import'),

  -- Go (Complete Ecosystem) - Consolidated to avoid overlap
  require('plugins.go_nvim'),
  require('plugins.dap_go'),
  require('plugins.go_tagger'),
  require('plugins.structure_go'),
  require('plugins.nvim_go'),
  require('plugins.gopher'),
  require('plugins.nvim_goc'),
  require('plugins.hierarchy_tree_go'),
  require('plugins.gotests'),
  require('plugins.goplements'),
  require('plugins.gosigns'),
  require('plugins.cmp_go_pkgs'),
  require('plugins.godoc'),
  require('plugins.no_go'),

  -- JSON/YAML
  require('plugins.nvim_jqx'),

  -- Flutter/Dart
  require('plugins.flutter_tools'),

  -- Lean
  require('plugins.lean_nvim'),

  -- Register/Clipboard Management (NEW)
  require('plugins.neoclip'),
  require('plugins.nvim_peekup'),
  require('plugins.registers'),
  require('plugins.karen_yank'),
  require('plugins.macrothis'),
  require('plugins.nvim_macros'),

  -- Marks/Bookmarks Management (NEW)
  require('plugins.arrow'),
  require('plugins.open'),
  require('plugins.trailblazer'),
  require('plugins.bookmarks'),
  require('plugins.recall'),
  require('plugins.track'),
  require('plugins.lspmark'),
  require('plugins.spelunk'),
  require('plugins.skipper'),
  require('plugins.navimark'),

  -- Search/Replace Management (NEW)
  require('plugins.visimatch'),
  require('plugins.nvim_hlslens'),
  require('plugins.highlight_current_n'),
  require('plugins.sad'),
  require('plugins.nvim_search_and_replace'),
  require('plugins.muren'),
  require('plugins.hlsearch'),
  require('plugins.grug_far'),
  require('plugins.nvim_rip_substitute'),
  require('plugins.telescope_all_recent'),

  -- Fuzzy Finder Management (NEW) - Keep fzf-lua, remove telescope (faster and more efficient)
  require('plugins.fzf_lua'),
  require('plugins.easypick'),
  require('plugins.namu'),
  require('plugins.mini_fuzzy'),

  -- Project Management (NEW)
  require('plugins.project'),
  require('plugins.whaler'),
  require('plugins.cd_project'),
  require('plugins.proot'),
  require('plugins.headers'),

  -- Color Management (NEW) - Keep nvim-colorizer, remove redundant color plugins
  require('plugins.nvim_colorizer'),
  require('plugins.range_highlight'),
  require('plugins.twilight'),
  require('plugins.overlength'),
  require('plugins.interestingwords'),
  require('plugins.mini_hipatterns'),
  require('plugins.sunglasses'),
  require('plugins.reactive'),
  require('plugins.command_and_cursor'),
  require('plugins.tiny_devicons_auto_colors'),
  require('plugins.vimade'),
  require('plugins.colorful_menu'),
  require('plugins.minty'),
  require('plugins.pacer'),

  -- Bars & Lines Management (NEW) - Keep lualine, remove redundant winbar/statusline plugins
  require('plugins.deadcolumn'),
  require('plugins.neocolumn'),
  require('plugins.smartcolumn'),
  require('plugins.nvim_navic'),
  require('plugins.statuscol'),
  require('plugins.hml'),
  require('plugins.noline'),
  require('plugins.bars'),
  require('plugins.modicator'),
  require('plugins.lualine_ext'),
  require('plugins.git_prompt_string_lualine'),
  require('plugins.nerdy'),
  require('plugins.smart_splits'),
  require('plugins.focus'),
  require('plugins.winshift'),
  require('plugins.bufdelete'),
  require('plugins.ataraxis'),
  require('plugins.colorful_winsep'),
  require('plugins.remote_ssh'),
  require('plugins.netman'),
  require('plugins.live_share'),
  require('plugins.persistence'),
  require('plugins.cmdline'),
}
