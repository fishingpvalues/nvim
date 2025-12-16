return {
  "lewis6991/satellite.nvim",
  event = "VeryLazy",
  config = function()
    require("satellite").setup({
      current_only = false,
      winblend = 50,
      zindex = 40,
      width = 2,
      handlers = {
        cursor = { enable = true, symbols = { "⎺", "⎻", "⎼", "⎽" } },
        search = { enable = true },
        diagnostic = { enable = true, signs = { "-", "=", "≡" } },
        gitsigns = { enable = true }, -- Integrates with your gitsigns
        marks = { enable = true, show_builtins = false },
        quickfix = { enable = true },
      },
    })
  end,
}