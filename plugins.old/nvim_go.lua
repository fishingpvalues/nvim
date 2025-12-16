-- Go development plugin
-- GitHub: https://github.com/crispgm/nvim-go
return {
  'crispgm/nvim-go',
  ft = 'go',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('go').setup({
      auto_format = true,
      formatter = 'goimports',
      auto_lint = true,
      linter = 'revive',
      test_flags = { '-v' },
      test_timeout = '30s',
      test_popup = true,
    })

    vim.keymap.set('n', '<leader>go', '<cmd>GoOrganizeImports<CR>', { noremap = true, silent = true, desc = '[G]o [O]rganize imports' })
    vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<CR>', { noremap = true, silent = true, desc = '[G]o [B]uild' })
    vim.keymap.set('n', '<leader>gr', '<cmd>GoRun<CR>', { noremap = true, silent = true, desc = '[G]o [R]un' })
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTest<CR>', { noremap = true, silent = true, desc = '[G]o [T]est' })
  end,
}
