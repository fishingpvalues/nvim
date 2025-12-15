-- telescope-rooter.nvim: Auto-change to project root in Telescope
-- GitHub: https://github.com/desdic/telescope-rooter.nvim
return {
  "desdic/telescope-rooter.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        rooter = {
          enable = true,
          patterns = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod", "Makefile" },
        },
      },
    })

    require("telescope").load_extension("rooter")

    -- Keybindings
    vim.keymap.set("n", "<leader>tr", function()
      vim.cmd("Telescope rooter toggle")
    end, { desc = "[T]elescope [R]ooter toggle" })
  end,
}
