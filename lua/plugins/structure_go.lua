-- Better structured display of Go symbols
-- GitHub: https://github.com/crusj/structrue-go.nvim
return {
  'crusj/structrue-go.nvim',
  ft = 'go',
  event = 'VeryLazy',
  config = function()
    require('structrue-go').setup({
      disable_mapping = false,
      package_path = 'github.com/crusj/structrue-go',
    })

    vim.keymap.set('n', '<leader>gs', '<cmd>GoStructCreateTree<CR>', { noremap = true, silent = true, desc = '[G]o [S]tructure tree' })
  end,
}
