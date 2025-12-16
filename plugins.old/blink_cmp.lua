-- blink.cmp: SOTA async completion engine for Neovim with enhanced sources
return {
  "Saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
    {
      "mikavilpas/blink-ripgrep.nvim",
      version = "*",
    },
    -- Blink.cmp addon sources
    "Kaiser-Yang/blink-cmp-git",
    "disrupted/blink-cmp-conventional-commits",
    "bydlw98/blink-cmp-env",
    "bydlw98/blink-cmp-sshconfig",
    "mgalliou/blink-cmp-tmux",
    "moyiz/blink-emoji.nvim",
    "erooke/blink-cmp-latex",
    "saghen/blink.compat",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-y>"] = { "select_and_accept" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      menu = {
        border = "rounded",
        winblend = 10,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "ripgrep", "git", "env", "emoji" },
      providers = {
        lsp = {
          name = "lsp",
          module = "blink.cmp.sources.lsp",
        },
        path = {
          name = "path",
          module = "blink.cmp.sources.path",
          opts = {},
        },
        snippets = {
          name = "snippets",
          module = "blink.cmp.sources.snippets",
          opts = {},
        },
        buffer = {
          name = "buffer",
          module = "blink.cmp.sources.buffer",
          opts = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          opts = {
            -- Use git grep when in a git repo, fallback to ripgrep
            prefix_min_len = 3,
            -- Context lines for preview
            context_size = 5,
            -- Fallback to ripgrep if git grep fails
            search_casing = "--ignore-case",
            -- Exclude very large files from search
            max_filesize = "1M",
            -- Additional ripgrep options for better results
            additional_rg_options = {
              "--hidden",
              "--follow",
              "--smart-case",
            },
            -- Performance: skip certain paths
            ignore_paths = {
              ".git",
              ".gitignore",
              "node_modules",
              ".venv",
              "venv",
              "dist",
              "build",
            },
          },
        },
        git = {
          module = "blink-cmp-git",
          name = "Git",
        },
        conventional_commits = {
          module = "blink-cmp-conventional-commits",
          name = "Conventional Commits",
        },
        env = {
          module = "blink-cmp-env",
          name = "Env",
        },
        sshconfig = {
          module = "blink-cmp-sshconfig",
          name = "SSHConfig",
        },
        tmux = {
          module = "blink-cmp-tmux",
          name = "Tmux",
        },
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
        },
        latex = {
          module = "blink-cmp-latex",
          name = "LaTeX",
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning"
    },
    -- Custom sorting to prioritize under/camelcase
    sorting = {
      comparators = {
        function(a, b)
          local a_score = 0
          local b_score = 0

          -- Check for underscore or camelcase in the completion text
          if a.completion_item.label:find("_") or a.completion_item.label:find("[a-z][A-Z]") then
            a_score = 1
          end
          if b.completion_item.label:find("_") or b.completion_item.label:find("[a-z][A-Z]") then
            b_score = 1
          end

          if a_score ~= b_score then
            return a_score > b_score
          end

          -- Fall back to default comparison
          return nil
        end,
      },
    },
  },
  opts_extend = { "sources.default" },
  config = function(_, opts)
    require("blink.cmp").setup(opts)
  end,
}
