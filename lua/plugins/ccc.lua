-- ccc.nvim: Super powerful color picker and colorizer
-- GitHub: https://github.com/uga-rosa/ccc.nvim
return {
  "uga-rosa/ccc.nvim",
  event = "VeryLazy",
  config = function()
    require("ccc").setup({
      -- Default output format: "hex", "hsl", "rgb"
      default_format = "hex",
      -- Picker options
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
      -- History file location
      history_file = vim.fn.stdpath("data") .. "/ccc_history",
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>cp", function()
      vim.cmd("CccPick")
    end, { desc = "[C]olor [P]icker" })

    vim.keymap.set("n", "<leader>cc", function()
      vim.cmd("CccConvert")
    end, { desc = "[C]olor [C]onvert" })
  end,
}
