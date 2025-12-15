-- nerdy.nvim: Find and insert Nerd Font glyphs
-- GitHub: https://github.com/2KAbhishek/nerdy.nvim
return {
  "2KAbhishek/nerdy.nvim",
  cmd = "Nerdy",
  dependencies = {
    "folke/snacks.nvim",
  },
  config = function()
    require("nerdy").setup({
      max_recents = 30,
      add_default_keybindings = true,
      copy_to_clipboard = false,
      copy_register = "+",
    })
  end,
}
