-- telescope-all-recent.nvim: Frequency and recency sorter for Telescope
-- GitHub: https://github.com/prochri/telescope-all-recent.nvim
return {
  "prochri/telescope-all-recent.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope-all-recent").setup({
      -- Database storage
      database = {
        dir = vim.fn.stdpath("data") .. "/telescope_all_recent",
      },

      -- Default configuration
      defaults = {
        disable = true, -- Disable unknown pickers
      },

      -- Sorting method: "recent" or "frecency"
      sorting = "frecency",

      -- Use current working directory for scoring
      use_cwd = true,

      -- Builtin pickers to enable
      recent = {
        find_files = {
          disable = false,
          sorting = "frecency",
        },
        buffers = {
          disable = false,
          sorting = "frecency",
        },
        live_grep = {
          disable = false,
          sorting = "frecency",
        },
        help_tags = {
          disable = false,
          sorting = "recent",
        },
        commands = {
          disable = false,
          sorting = "frecency",
        },
        git_files = {
          disable = false,
          sorting = "frecency",
        },
      },
    })

    -- Load the extension
    pcall(function()
      require("telescope").load_extension("all-recent")
    end)

    -- Optional: Create wrapped Telescope commands
    local telescope = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", function()
      telescope.find_files()
    end, { desc = "[F]ind [F]iles (all-recent)" })

    vim.keymap.set("n", "<leader>fg", function()
      telescope.live_grep()
    end, { desc = "[F]ind [G]rep (all-recent)" })

    vim.keymap.set("n", "<leader>fb", function()
      telescope.buffers()
    end, { desc = "[F]ind [B]uffers (all-recent)" })

    vim.keymap.set("n", "<leader>fh", function()
      telescope.help_tags()
    end, { desc = "[F]ind [H]elp tags (all-recent)" })

    vim.keymap.set("n", "<leader>fc", function()
      telescope.commands()
    end, { desc = "[F]ind [C]ommands (all-recent)" })
  end,
}
