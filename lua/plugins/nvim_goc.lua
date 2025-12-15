-- Go code coverage highlighting
-- GitHub: https://github.com/rafaelsq/nvim-goc.lua
return {
  'rafaelsq/nvim-goc.lua',
  ft = 'go',
  event = 'VeryLazy',
  config = function()
    local goc = require('nvim-goc')
    goc.setup({ verticalSplit = false })

    vim.keymap.set('n', '<leader>gcf', goc.Coverage, { noremap = true, silent = true, desc = '[G]o [C]overage [F]ile' })
    vim.keymap.set('n', '<leader>gct', goc.CoverageFunc, { noremap = true, silent = true, desc = '[G]o [C]overage [T]est' })
    vim.keymap.set('n', '<leader>gcc', goc.ClearCoverage, { noremap = true, silent = true, desc = '[G]o [C]overage [C]lear' })
  end,
}
