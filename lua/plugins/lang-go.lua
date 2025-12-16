-- ============================================================================
-- Go Language Support
-- ============================================================================

return {
  -- Go.nvim
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        disable_defaults = false,
        go = "go",
        goimports = "gopls",
        fillstruct = "gopls",
        gofmt = "gofumpt",
        max_line_len = 120,
        tag_transform = false,
        test_dir = "",
        comment_placeholder = "   ",
        icons = { breakpoint = " ", currentpos = " " },
        verbose = false,
        lsp_cfg = false, -- use lspconfig
        lsp_gofumpt = true,
        lsp_on_attach = false,
        lsp_keymaps = false,
        lsp_codelens = true,
        diagnostic = {
          underline = true,
          virtual_text = { space = 0, prefix = "■" },
          signs = true,
          update_in_insert = false,
        },
        lsp_inlay_hints = {
          enable = true,
          style = "inlay",
          only_current_line = false,
        },
        dap_debug = true,
        dap_debug_gui = true,
        dap_debug_keymap = true,
        dap_vt = true,
        build_tags = "",
        textobjects = true,
        test_runner = "go",
        verbose_tests = true,
        run_in_floaterm = false,
        trouble = true,
        test_efm = false,
      })

      -- Auto format on save
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },

  -- DAP Go
  {
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = "go",
    config = function()
      require("dap-go").setup()
    end,
  },

  -- Go struct tags
  {
    "fatih/vim-go",
    build = ":GoUpdateBinaries",
    ft = { "go", "gomod" },
    config = function()
      -- Disable vim-go LSP (use gopls via lspconfig instead)
      vim.g.go_code_completion_enabled = 0
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_doc_keywordprg_enabled = 0
      vim.g.go_gopls_enabled = 0
    end,
  },
}
