-- muren.nvim: Multiple replacements through interactive UI
-- GitHub: https://github.com/AckslD/muren.nvim
return {
  "AckslD/muren.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("muren").setup({
      -- UI configuration
      patterns_width = 35,
      patterns_height = 10,
      options_width = 20,
      preview_height = 12,

      -- Window positioning
      anchor = "center",
      vertical_offset = 0,
      horizontal_offset = 0,

      -- Default options
      defaults = {
        two_step = false,
        preview = true,
        all_on_line = false,
      },

      -- Custom keymaps
      keymaps = {
        close = "q",
        toggle_search = "<Tab>",
        toggle_replace = "<C-Tab>",
        toggle_options = "o",
        execute = "<CR>",
        preview = "p",
      },

      -- File glob patterns
      files = "**/*",
    })

    -- Keybinding to open muren
    vim.keymap.set("n", "<leader>mr", function()
      require("muren").open()
    end, { desc = "[M]uren [R]eplace interactive" })

    -- Command for muren
    vim.api.nvim_create_user_command("Muren", function()
      require("muren").open()
    end, { desc = "Open Muren for interactive multi-file replace" })
  end,
}
