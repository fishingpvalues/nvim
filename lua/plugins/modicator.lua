-- modicator.nvim: Cursor line number mode indicator
-- GitHub: https://github.com/mawkler/modicator.nvim
return {
  "mawkler/modicator.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  config = function()
    require("modicator").setup({
      show_warnings = false,
    })
  end,
}
