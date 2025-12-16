-- ============================================================================
-- LSP Enhancements - Additional LSP UI and Features
-- ============================================================================

return {
  -- LSPSaga
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "gh", "<cmd>Lspsaga finder<cr>", desc = "LSP Finder" },
      { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action", mode = { "n", "v" } },
      { "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
      { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc" },
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming Calls" },
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing Calls" },
    },
    opts = {
      ui = {
        border = "rounded",
        code_action = "",
      },
      lightbulb = {
        enable = false,
        sign = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
    },
  },

  -- LSP Kind (icons for completion)
  {
    "onsails/lspkind.nvim",
    event = "VeryLazy",
    opts = {
      mode = "symbol_text",
      preset = "codicons",
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    },
  },

  -- Navic (LSP context breadcrumbs)
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    opts = {
      separator = "  ",
      highlight = true,
      depth_limit = 5,
      icons = {
        File = " ",
        Module = " ",
        Namespace = " ",
        Package = " ",
        Class = " ",
        Method = " ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = " ",
        Interface = " ",
        Function = " ",
        Variable = " ",
        Constant = " ",
        String = " ",
        Number = " ",
        Boolean = " ",
        Array = " ",
        Object = " ",
        Key = " ",
        Null = " ",
        EnumMember = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
      },
    },
  },

  -- Navbuddy (LSP navigation UI)
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>nv", "<cmd>Navbuddy<cr>", desc = "Nav Buddy" },
    },
    opts = {
      window = {
        border = "rounded",
      },
      lsp = { auto_attach = true },
    },
  },

  -- LazyDev (better Lua LSP for Neovim)
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "Bilal2453/luvit-meta",
    lazy = true,
  },

  -- Lightbulb (show code actions)
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    opts = {
      autocmd = { enabled = true },
      sign = {
        enabled = false,
      },
      virtual_text = {
        enabled = true,
        text = "",
      },
    },
  },

  -- LSP Lens (show references count)
  {
    "VidocqH/lsp-lens.nvim",
    event = "LspAttach",
    opts = {
      enable = true,
      include_declaration = false,
      sections = {
        definition = false,
        references = true,
        implements = true,
        git_authors = true,
      },
    },
  },

  -- Symbol usage (show where symbol is used)
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    opts = {
      vt_position = "end_of_line",
    },
  },

  -- Dropbar (winbar with context)
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  -- Hlargs (highlight arguments)
  {
    "m-demare/hlargs.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      color = "#ef9062",
      use_colorpalette = false,
      disable = function(_, bufnr)
        if vim.b.semantic_tokens then
          return true
        end
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        for _, c in pairs(clients) do
          local caps = c.server_capabilities
          if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
            vim.b.semantic_tokens = true
            return true
          end
        end
      end,
    },
  },

  -- Tiny inline diagnostic
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    opts = {
      preset = "modern",
    },
  },

  -- Virtual types
  {
    "jubnzv/virtual-types.nvim",
    ft = { "go", "python", "rust" },
    opts = {},
  },
}
