-- ============================================================================
-- Colorscheme: GitHub Plus Theme
-- ============================================================================

return {
  {
    "tommarien/github-plus.nvim",
    lazy = false,
    priority = 1000,
    version = "*",
    opts = {
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = {},
        variables = {},
      },
    },
    config = function(_, opts)
      require("github_plus").setup(opts)
      vim.cmd("colorscheme github_plus")
    end,
  },
}
