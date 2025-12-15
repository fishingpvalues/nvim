-- nvim-hlslens: Better search glance and seamless jump
-- GitHub: https://github.com/kevinhwang91/nvim-hlslens
return {
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  config = function()
    local hlslens = require("hlslens")
    hlslens.setup({
      calm_down = true,
      nearest_only = true,
      nearest_float_when = "auto",
      enable_incsearch = true,
      preview_position = "right",
      lsp_progressive_enable = false,
    })

    -- Keybindings for search with hlslens
    local map = vim.keymap.set

    -- Map n and N to use hlslens
    map("n", "n", function()
      hlslens.start()
      return "n"
    end, { noremap = true, expr = true, desc = "Next search with hlslens" })

    map("n", "N", function()
      hlslens.start()
      return "N"
    end, { noremap = true, expr = true, desc = "Previous search with hlslens" })

    -- Map search motions
    map("n", "*", function()
      hlslens.start()
      return "*"
    end, { noremap = true, expr = true, desc = "Search word with hlslens" })

    map("n", "#", function()
      hlslens.start()
      return "#"
    end, { noremap = true, expr = true, desc = "Search word backward with hlslens" })

    map("n", "g*", function()
      hlslens.start()
      return "g*"
    end, { noremap = true, expr = true, desc = "Search word partial with hlslens" })

    map("n", "g#", function()
      hlslens.start()
      return "g#"
    end, { noremap = true, expr = true, desc = "Search word partial backward with hlslens" })

    -- Clear search highlighting
    map("n", "<leader>lh", "<cmd>noh<CR>", { noremap = true, silent = true, desc = "[L]earn [H]ighlight off" })

    -- Telescope integration
    pcall(function()
      require("telescope").load_extension("hlslens")
    end)
  end,
}
