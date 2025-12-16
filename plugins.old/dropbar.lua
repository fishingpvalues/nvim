-- dropbar.nvim: IDE-like breadcrumbs with dropdown menus
-- GitHub: https://github.com/Bekaboo/dropbar.nvim
return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  config = function()
    require("dropbar").setup({})

    -- Keybindings
    local dropbar_api = require("dropbar.api")
    vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Dropbar pick" })
    vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Goto context start" })
    vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
  end,
}
