-- buffer-sticks.nvim: Visual buffer indicator & picker
return {
  "ahkohd/buffer-sticks.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>j",
      function()
        BufferSticks.jump()
      end,
      desc = "Buffer: Jump to buffer",
    },
    {
      "<leader>buq",
      function()
        BufferSticks.close()
      end,
      desc = "Buffer: Close buffer",
    },
    {
      "<leader>bup",
      function()
        BufferSticks.list({
          action = function(buffer, leave)
            print("Selected: " .. buffer.name)
            leave()
          end,
        })
      end,
      desc = "Buffer: Picker",
    },
  },
  config = function()
    local sticks = require("buffer-sticks")
    sticks.setup({
      filter = { buftypes = { "terminal" } },
      highlights = {
        active = { link = "Statement" },
        alternate = { link = "StorageClass" },
        inactive = { link = "Whitespace" },
        active_modified = { link = "Constant" },
        alternate_modified = { link = "Constant" },
        inactive_modified = { link = "Constant" },
        label = { link = "Comment" },
        filter_selected = { link = "Statement" },
        filter_title = { link = "Comment" },
      },
    })
    -- Don't auto-show on startup to avoid "E36: Not enough room" errors
    -- Use <leader>j to jump or <leader>bup to open picker instead
  end,
}
