-- Complete Go development plugin
-- GitHub: https://github.com/olexsmir/gopher.nvim
return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('gopher').setup({
      commands = {
        go = 'go',
        gomodifytags = 'gomodifytags',
        gotests = 'gotests',
        impl = 'impl',
        iferr = 'iferr',
      },
    })

    vim.keymap.set('n', '<leader>gsj', '<cmd>GoTagAdd json<CR>', { noremap = true, silent = true, desc = '[G]o tag [J]son' })
    vim.keymap.set('n', '<leader>gsy', '<cmd>GoTagAdd yaml<CR>', { noremap = true, silent = true, desc = '[G]o tag [Y]aml' })
    vim.keymap.set('n', '<leader>gsd', '<cmd>GoTagAdd db<CR>', { noremap = true, silent = true, desc = '[G]o tag [D]b' })
    vim.keymap.set('n', '<leader>gsf', '<cmd>GoTagAdd form<CR>', { noremap = true, silent = true, desc = '[G]o tag [F]orm' })
    vim.keymap.set('n', '<leader>gsR', '<cmd>GoTagRm<CR>', { noremap = true, silent = true, desc = '[G]o tag [R]emove' })
    vim.keymap.set('n', '<leader>gie', '<cmd>GoIfErr<CR>', { noremap = true, silent = true, desc = '[G]o [I]f [E]rr' })
    vim.keymap.set('n', '<leader>gim', '<cmd>GoImpl<CR>', { noremap = true, silent = true, desc = '[G]o [I]mplement [M]ethod' })
    vim.keymap.set('v', '<leader>gim', '<cmd>GoImpl<CR>', { noremap = true, silent = true, desc = '[G]o [I]mplement [M]ethod' })
  end,
}
