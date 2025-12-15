-- Go call hierarchy UI tree
-- GitHub: https://github.com/crusj/hierarchy-tree-go.nvim
return {
  'crusj/hierarchy-tree-go.nvim',
  ft = 'go',
  event = 'VeryLazy',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('hierarchy-tree-go').setup({
      icons = {
        default = ' ',
      },
    })

    vim.keymap.set('n', '<leader>ghc', '<cmd>Cht<CR>', { noremap = true, silent = true, desc = '[G]o [H]ierarchy [C]all tree' })
    vim.keymap.set('n', '<leader>ghi', '<cmd>Cht incomingcalls<CR>', { noremap = true, silent = true, desc = '[G]o [H]ierarchy [I]ncoming calls' })
    vim.keymap.set('n', '<leader>gho', '<cmd>Cht outgoingcalls<CR>', { noremap = true, silent = true, desc = '[G]o [H]ierarchy [O]utgoing calls' })
  end,
}
