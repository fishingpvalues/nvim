-- bars.nvim: Guide/starting point for custom statusline, statuscolumn, tabline, winbar
-- GitHub: https://github.com/OXY2DEV/bars.nvim
return {
  "OXY2DEV/bars.nvim",
  event = "VeryLazy",
  config = function()
    -- bars.nvim serves as a reference guide for building custom UI components
    -- Enable per-module configuration as needed
    require("bars").setup({
      global = false,
    })
  end,
}
