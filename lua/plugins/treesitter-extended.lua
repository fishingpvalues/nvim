-- ============================================================================
-- Treesitter Extended - Additional Treesitter Features
-- ============================================================================

return {
  -- Treesitter playground
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    keys = {
      { "<leader>tp", "<cmd>TSPlaygroundToggle<cr>", desc = "Treesitter Playground" },
      { "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<cr>", desc = "Highlight Captures" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Treesitter textsubjects
  {
    "RRethy/nvim-treesitter-textsubjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.config").setup({
        textsubjects = {
          enable = true,
          prev_selection = ",",
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["i;"] = "textsubjects-container-inner",
          },
        },
      })
    end,
  },
}
