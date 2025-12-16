-- lazydev.nvim: Better Lua LS development experience
return {
  'folke/lazydev.nvim',
  ft = 'lua',
  dependencies = {
    {
      'DrKJeff16/wezterm-types',
      lazy = true,
      version = false,
    },
  },
  opts = {
    library = {
      { path = 'wezterm-types', mods = { 'wezterm' } },
    },
  },
}
