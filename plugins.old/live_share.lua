return {
  'azratul/live-share.nvim',
  lazy = true,
  cmd = {
    'LiveShare',
    'LiveShareHost',
    'LiveShareJoin',
    'LiveShareLeave',
    'LiveShareFocus',
    'LiveShareUnfocus',
    'LiveShareStart',
    'LiveShareStop',
    'LiveShareDebug',
  },
  config = function()
    require('live-share').setup({
      -- Your configuration options here.
      -- For example:
      -- debug = false,
      -- host_url = "https://liveshare.example.com",
    })
  end,
  -- If you want to load it on specific events, e.g.,
  -- event = { "VimEnter" },
  -- ft = { "lua", "python" },
}