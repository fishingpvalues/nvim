-- Fuzzy search Go packages/symbols and view docs
-- GitHub: https://github.com/fredrikaverpil/godoc.nvim
return {
  'fredrikaverpil/godoc.nvim',
  ft = 'go',
  event = 'VeryLazy',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('godoc').setup({
      picker = 'telescope',
    })

    vim.keymap.set('n', '<leader>gd', '<cmd>GoDoc<CR>', { noremap = true, silent = true, desc = '[G]o [D]oc search' })
    vim.keymap.set('n', '<leader>gD', '<cmd>GoDocWord<CR>', { noremap = true, silent = true, desc = '[G]o [D]oc current word' })
  end,
}
