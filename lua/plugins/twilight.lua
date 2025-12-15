-- twilight.nvim: Dim inactive portions of code
-- GitHub: https://github.com/folke/twilight.nvim
return {
  "folke/twilight.nvim",
  event = "VeryLazy",
  config = function()
    require("twilight").setup({
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
      },
      context = 10,
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {},
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>tw", function()
      vim.cmd("Twilight")
    end, { desc = "[T]wilight toggle" })
  end,
}
