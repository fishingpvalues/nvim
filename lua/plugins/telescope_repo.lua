-- telescope-repo.nvim: Find and open repositories
-- GitHub: https://github.com/cljoly/telescope-repo.nvim
return {
  "cljoly/telescope-repo.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        repo = {
          list = {
            fd_opts = { "--no-ignore-vcs" },
            search_dirs = {
              vim.fn.expand("~"),
            },
          },
          settings = {
            auto_lcd = true,
          },
        },
      },
    })

    require("telescope").load_extension("repo")

    -- Keybindings
    vim.keymap.set("n", "<leader>fr", function()
      require("telescope").extensions.repo.list()
    end, { desc = "[F]ind [R]epositories" })
  end,
}
