-- telescope-heading.nvim: Navigate between headings in various formats
-- GitHub: https://github.com/crispgm/telescope-heading.nvim
return {
  "crispgm/telescope-heading.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        heading = {
          -- Enable treesitter support for better accuracy
          treesitter = true,
          -- Picker options
          picker_opts = {
            layout_config = {
              width = 0.9,
              height = 0.8,
              preview_width = 0.6,
            },
            layout_strategy = "horizontal",
          },
        },
      },
    })

    require("telescope").load_extension("heading")

    -- Keybindings
    vim.keymap.set("n", "<leader>th", function()
      require("telescope").extensions.heading.heading()
    end, { desc = "[T]elescope [H]eadings" })

    -- Alternative keybinding
    vim.keymap.set("n", "<leader>fh", function()
      require("telescope").extensions.heading.heading()
    end, { desc = "[F]ind [H]eadings" })
  end,
}
