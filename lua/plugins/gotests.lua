-- Generate Go tests with gotests
-- GitHub: https://github.com/yanskun/gotests.nvim
return {
  'yanskun/gotests.nvim',
  ft = 'go',
  event = 'VeryLazy',
  config = function()
    require('gotests').setup({
      template = nil,
      template_dir = nil,
      named = true,
      subtests = true,
      all = false,
      excl = nil,
      exported = false,
      noformat = false,
      parallel = false,
      only_return_types = false,
    })

    vim.keymap.set('n', '<leader>gta', '<cmd>GoTestsAll<CR>', { noremap = true, silent = true, desc = '[G]o [T]ests [A]ll' })
    vim.keymap.set('n', '<leader>gtf', '<cmd>GoTestsFunc<CR>', { noremap = true, silent = true, desc = '[G]o [T]ests [F]unc' })
    vim.keymap.set('n', '<leader>gte', '<cmd>GoTestsExported<CR>', { noremap = true, silent = true, desc = '[G]o [T]ests [E]xported' })
  end,
}
