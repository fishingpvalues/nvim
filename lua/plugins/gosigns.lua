-- Visualize Go hints and implementations
-- GitHub: https://github.com/Yu-Leo/gosigns.nvim
return {
  'Yu-Leo/gosigns.nvim',
  ft = 'go',
  event = 'VeryLazy',
  config = function()
    require('gosigns').setup({
      icons = {
        interface = '«',
        struct = '▫',
        method = '»',
      },
    })
  end,
}
