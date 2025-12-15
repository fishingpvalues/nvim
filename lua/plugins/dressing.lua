return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',
  opts = {
    select = {
      backend = { 'telescope', 'fzf_lua', 'fzf', 'builtin' },
      telescope = {
        -- Options for the Telescope backend
      },
    },
  },
}