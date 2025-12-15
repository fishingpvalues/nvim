-- NeoColumn.nvim: Toggleable colorcolumn highlighting
-- GitHub: https://github.com/ecthelionvi/NeoColumn.nvim
return {
  "ecthelionvi/NeoColumn.nvim",
  event = "VeryLazy",
  config = function()
    require("NeoColumn").setup({
      NeoColumn = "80",
      always_on = false,
      excluded_ft = { "text", "markdown", "help" },
      custom_NeoColumn = {
        python = "88",
        ruby = "120",
        java = { "80", "100" },
      },
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>nc", function()
      vim.cmd("ToggleNeoColumn")
    end, { desc = "[N]eo [C]olumn toggle" })
  end,
}
