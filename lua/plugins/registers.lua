-- registers.nvim: Non-obtrusive minimal preview of Vim registers
-- GitHub: https://github.com/tversteeg/registers.nvim
return {
  "tversteeg/registers.nvim",
  event = "VeryLazy",
  config = function()
    require("registers").setup({
      show_empty = true,
      register_user_command = true,
      system_clipboard = true,
      trim_whitespace = true,
      hide_registers = "",

      -- Window settings
      window = {
        border = "none",
        max_width = 100,
        transparency = 10,
      },

      -- Display settings
      show_register_types = true,
      normal_before = "",
      normal_after = "",
      line_before = "",
      line_after = "",
      visual_before = "",
      visual_after = "",
      multi_line = true,

      -- Custom symbols
      symbols = {
        newline = "⏎",
        tab = "·",
        space = " ",
        register = " ",
      },

      -- Keybindings in registers window
      keys = {
        apply = "y",
        clear = "d",
        delete = "x",
        edit = "e",
        paste = "p",
        yank = "Y",
      },
    })

    -- Keybindings to open registers
    vim.keymap.set("n", '"', function()
      require("registers").show()
    end, { desc = "Show registers" })

    vim.keymap.set("v", '"', function()
      require("registers").show()
    end, { desc = "Show registers" })

    vim.keymap.set("i", "<C-R>", function()
      require("registers").show()
    end, { desc = "Show registers" })

    -- Command for accessing registers
    vim.api.nvim_create_user_command("Registers", function()
      require("registers").show()
    end, { desc = "Show registers" })
  end,
}
