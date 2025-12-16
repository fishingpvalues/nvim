-- ============================================================================
-- Specialized Language Support
-- ============================================================================

return {
  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
    opts = {
      server = {
        on_attach = function(client, bufnr)
          -- Keybindings for Rust-specific features
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },

  -- Crates (Rust dependencies)
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      completion = {
        cmp = {
          enabled = true,
        },
      },
    },
  },

  -- Haskell
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local ht = require("haskell-tools")
      vim.g.haskell_tools = {
        hls = {
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, opts)
            vim.keymap.set("n", "<leader>he", ht.lsp.buf_eval_all, opts)
          end,
        },
      }
    end,
  },

  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      lsp = {
        color = {
          enabled = true,
          background = true,
          virtual_text = true,
        },
      },
    },
  },

  -- Scala Metals
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local metals_config = require("metals").bare_config()
      metals_config.settings = {
        showImplicitArguments = true,
        showInferredType = true,
      }
      metals_config.init_options.statusBarProvider = "on"
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },

  -- Java JDTLS
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  -- Clangd extensions (C/C++)
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
      },
    },
  },

  -- Package info (package.json)
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>ns", function() require("package-info").show() end, desc = "Show package info", ft = "json" },
      { "<leader>nc", function() require("package-info").hide() end, desc = "Hide package info", ft = "json" },
      { "<leader>nt", function() require("package-info").toggle() end, desc = "Toggle package info", ft = "json" },
      { "<leader>nu", function() require("package-info").update() end, desc = "Update package", ft = "json" },
      { "<leader>nd", function() require("package-info").delete() end, desc = "Delete package", ft = "json" },
      { "<leader>ni", function() require("package-info").install() end, desc = "Install package", ft = "json" },
      { "<leader>np", function() require("package-info").change_version() end, desc = "Change package version", ft = "json" },
    },
    opts = {},
  },

  -- Just (justfile)
  {
    "IndianBoy42/tree-sitter-just",
    ft = "just",
    config = function()
      require("tree-sitter-just").setup({})
    end,
  },

  -- YAML enhancements
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- JQX (JSON query)
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
    keys = {
      { "<leader>j", "<cmd>JqxList<cr>", desc = "JQX List", ft = { "json", "yaml" } },
    },
  },

  -- CSV
  {
    "cameron-wags/rainbow_csv.nvim",
    ft = { "csv", "tsv", "csv_semicolon", "csv_whitespace", "csv_pipe", "rfc_csv", "rfc_semicolon" },
    cmd = { "RainbowDelim", "RainbowDelimSimple", "RainbowDelimQuoted", "RainbowMultiDelim" },
    config = true,
  },

  -- Orgmode
  {
    "nvim-orgmode/orgmode",
    ft = "org",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
    },
  },

  -- Obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
    },
  },

  -- Jupynium (Jupyter notebooks)
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    ft = { "python", "ipynb" },
    opts = {
      python_host = vim.fn.exepath("python3"),
    },
  },

  -- Log highlighting
  {
    "fei6409/log-highlight.nvim",
    ft = "log",
    opts = {},
  },

  -- Nerdy (nerd font icon picker)
  {
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    keys = {
      { "<leader>ni", "<cmd>Nerdy<cr>", desc = "Nerdy Icons" },
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
