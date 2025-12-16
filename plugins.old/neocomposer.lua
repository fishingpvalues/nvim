-- NeoComposer.nvim: Enhanced macro management with persistence
return {
  "ecthelionvi/NeoComposer.nvim",
  dependencies = { "kkharji/sqlite.lua" },
  keys = {
    { "q", desc = "Macro: Toggle Recording" },
    { "Q", desc = "Macro: Play Queued" },
    { "yq", desc = "Macro: Yank Macro" },
    { "<leader>mq", desc = "Macro: Edit" },
    { "<leader>mm", desc = "Macro: Menu (Telescope)" },
  },
  opts = {
    notify = true,
    delay_timer = 150,
    queue_most_recent = false,
    window = {
      width = 60,
      height = 10,
      border = "rounded",
      winhl = {
        Normal = "ComposerNormal",
      },
    },
    colors = {
      bg = "#16161e",
      fg = "#ff9e64",
      red = "#ec5f67",
      blue = "#5fb3b3",
      green = "#99c794",
    },
    keymaps = {
      play_macro = "Q",
      yank_macro = "yq",
      stop_macro = "cq",
      toggle_record = "q",
      cycle_next = "<c-n>",
      cycle_prev = "<c-p>",
      toggle_macro_menu = "<m-q>",
    },
  },
  config = function(_, opts)
    require("NeoComposer").setup(opts)

    -- Setup Telescope extension if available
    pcall(function()
      require('telescope').load_extension('macros')
    end)
  end,
}
