-- ============================================================================
-- Telescope - Fuzzy Finder with Extensions (alongside FZF-Lua)
-- ============================================================================

return {
  -- Telescope core
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>ft", "<cmd>Telescope<cr>", desc = "Telescope" },
      { "<leader>tp", "<cmd>Telescope projects<cr>", desc = "Projects" },
      { "<leader>tu", "<cmd>Telescope undo<cr>", desc = "Undo Tree" },
      { "<leader>tz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
      { "<leader>ta", "<cmd>Telescope aerial<cr>", desc = "Aerial" },
      { "<leader>tm", "<cmd>Telescope media_files<cr>", desc = "Media Files" },
      { "<leader>th", "<cmd>Telescope heading<cr>", desc = "Markdown Headings" },
      -- { "<leader>tr", "<cmd>Telescope repo list<cr>", desc = "Repos" }, -- Disabled: telescope-repo has healthcheck bug
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          file_ignore_patterns = { "node_modules", ".git/" },
          mappings = {
            i = {
              ["<C-n>"] = actions.move_selection_next,
              ["<C-p>"] = actions.move_selection_previous,
              ["<Down>"] = actions.cycle_history_next,  -- Changed from <C-j> to avoid conflict with smart-splits
              ["<Up>"] = actions.cycle_history_prev,    -- Changed from <C-k> to avoid conflict with LSP signature
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
            },
            n = {
              ["q"] = actions.close,
            },
          },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
      }
    end,
  },

  -- Telescope FZF native (faster sorting)
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- Telescope undo tree
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("undo")
    end,
  },

  -- Telescope zoxide integration
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("zoxide")
    end,
  },

  -- Telescope project management
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("project")
    end,
  },

  -- Telescope media files (images, videos)
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },

  -- Telescope heading (markdown headings)
  {
    "crispgm/telescope-heading.nvim",
    ft = "markdown",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("heading")
    end,
  },

  -- Telescope repo (git repos)
  -- Disabled due to healthcheck bug in upstream plugin
  -- {
  --   "cljoly/telescope-repo.nvim",
  --   dependencies = { "telescope.nvim" },
  --   config = function()
  --     require("telescope").load_extension("repo")
  --   end,
  -- },

  -- Telescope all recent (frecency)
  {
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "telescope.nvim",
      "kkharji/sqlite.lua",
    },
    opts = {},
  },

  -- Telescope egrepify (better live grep)
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("egrepify")
    end,
  },
}
