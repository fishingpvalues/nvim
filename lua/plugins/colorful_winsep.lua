return {
  "nvim-zh/colorful-winsep.nvim",
  event = "VeryLazy", -- Or "VimResized", depending on when you want it to activate
  config = function()
    require("colorful-winsep").setup({
      -- Your configuration options here.
      -- For example:
      -- separator_style = "double",
      -- highlight_active_window = "WinSeparatorActive",
      -- highlight_inactive_window = "WinSeparatorInactive",
      -- colors = nil, -- You can provide a table of colors if you want custom ones
    })
  end,
}
