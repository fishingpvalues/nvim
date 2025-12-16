-- pacer.nvim: Reading pacer by highlighting one word at a time
-- GitHub: https://github.com/3ZsForInsomnia/pacer.nvim
return {
  "3ZsForInsomnia/pacer.nvim",
  cmd = { "PacerStart", "PacerResume", "PacerValidate" },
  config = function()
    require("pacer").setup({
      wpm = 300,
      focus_mode = false,
      cursor_movement = true,
      -- Highlight colors for current word
      hl_group = "PacerHighlight",
      -- Dimming for surrounding text
      dim_group = "PacerDim",
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>ps", function()
      vim.cmd("PacerStart")
    end, { desc = "[P]acer [S]tart" })

    vim.keymap.set("n", "<leader>pr", function()
      vim.cmd("PacerResume")
    end, { desc = "[P]acer [R]esume" })
  end,
}
