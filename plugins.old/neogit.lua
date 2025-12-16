return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Open Neogit UI" }, -- Changed to <leader>gn to avoid conflicts
  },
  config = function()
    require("neogit").setup({
      integrations = {
        telescope = true,
        diffview = true,
      },
    })
  end,
}