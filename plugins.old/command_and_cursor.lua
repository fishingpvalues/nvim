-- command-and-cursor.nvim: Highlight cursor and selections in command mode
-- GitHub: https://github.com/moyiz/command-and-cursor.nvim
return {
  "moyiz/command-and-cursor.nvim",
  event = "VeryLazy",
  opts = {
    hl_group = "TermCursor",  -- Highlight group for cursor
    hl_priority = 300,         -- Highlight priority
    inclusive = true,          -- Include cursor in visual selection
    debug_position = false,    -- Don't show position notifications
  },
}
