-- haskell-snippets.nvim: Haskell snippets for LuaSnip
-- GitHub: https://github.com/mrcjkb/haskell-snippets.nvim
return {
  "mrcjkb/haskell-snippets.nvim",
  ft = "haskell",
  event = "VeryLazy",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local haskell_snippets = require("haskell-snippets").all
    local ls = require("luasnip")
    ls.add_snippets("haskell", haskell_snippets, { key = "haskell" })
  end,
}
