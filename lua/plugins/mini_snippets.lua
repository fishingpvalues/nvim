-- mini.snippets: Module of mini.nvim to manage and expand snippets
-- GitHub: https://github.com/nvim-mini/mini.nvim
return {
  "echasnovski/mini.snippets",
  version = false,
  event = "VeryLazy",
  config = function()
    local gen_loader = require("mini.snippets").gen_loader
    require("mini.snippets").setup({
      -- Loaders for snippet sources
      snippets = {
        gen_loader.from_lang(),
      },
      -- Keymapping settings
      mappings = {
        -- Expand snippet or jump to next stop
        expand = "<C-j>",
        -- Jump to previous stop
        jump_prev = "<C-k>",
      },
    })
  end,
}
