-- whaler.nvim: Move between directories blazingly fast
-- GitHub: https://github.com/SalOrak/whaler.nvim
return {
  "SalOrak/whaler.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        whaler = {
          directories = {
            vim.fn.expand("~/projects"),
            vim.fn.expand("~/.config"),
          },
          oneoff_directories = {
            vim.fn.expand("~/.config/nvim"),
          },
          auto_cwd = true,
          auto_file_explorer = true,
          file_explorer = "neotree",
          theme = {
            layout_strategy = "center",
            previewer = false,
            border = true,
            layout_config = {
              height = 0.4,
              width = 0.5,
            },
          },
        },
      },
    })

    require("telescope").load_extension("whaler")

    -- Keybindings
    vim.keymap.set("n", "<leader>fw", function()
      require("telescope").extensions.whaler.whaler()
    end, { desc = "[F]uzzy [W]haler directories" })
  end,
}
