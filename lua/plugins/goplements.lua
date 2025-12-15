-- Visualize Go struct/interface implementations
-- GitHub: https://github.com/maxandron/goplements.nvim
return {
  'maxandron/goplements.nvim',
  ft = 'go',
  event = 'VeryLazy',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('goplements').setup({
      prefixes = {
        interface = '⤷ ',
        implementation = '┖ ',
      },
    })

    vim.keymap.set('n', '<leader>gpi', '<cmd>GoimplementsInterface<CR>', { noremap = true, silent = true, desc = '[G]o [P]lements [I]nterface' })
    vim.keymap.set('n', '<leader>gpp', '<cmd>GoimplemensMethod<CR>', { noremap = true, silent = true, desc = '[G]o [P]lements [P]rotocol' })
  end,
}
