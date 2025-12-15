return {
  'vzze/cmdline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Optional, for icons
  },
  config = function()
    require('cmdline').setup({
      -- Your custom configuration options go here
      -- For example:
      -- theme = 'default', -- 'default', 'catppuccin', 'tokyonight', etc.
      -- prompt_prefix = '❯ ',
      -- auto_close = true,
      -- preview = {
      --   delay = 100,
      --   max_height = 10,
      -- },
    })
  end,
  -- Or, if you prefer to use 'opts' table for configuration (lazy.nvim recommended)
  -- opts = {
  --   theme = 'default',
  --   prompt_prefix = '❯ ',
  --   auto_close = true,
  --   preview = {
  --     delay = 100,
  --     max_height = 10,
  --   },
  -- },
}
