return {
  'mrjones2014/smart-splits.nvim',
  lazy = true,
  -- Configure default keymaps for smart-splits
  -- Change these to your preferred keymaps
  config = function()
    require('smart-splits').setup({
      -- Your custom configuration options here
      -- For example:
      -- default_navigation_map = '<C-h>',
      -- default_resize_map = '<A-h>',
    })
  end,
  keys = {
    -- Navigation
    { "<leader>h", function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
    { "<leader>j", function() require("smart-splits").move_cursor_down() end, desc = "Move to down split" },
    { "<leader>k", function() require("smart-splits").move_cursor_up() end, desc = "Move to up split" },
    { "<leader>l", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    -- Resize (optional, adjust as needed)
    { "<leader>H", function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    { "<leader>J", function() require("smart-splits").resize_down() end, desc = "Resize split down" },
    { "<leader>K", function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    { "<leader>L", function() require("smart-splits").resize_right() end, desc = "Resize split right" },
  },
}