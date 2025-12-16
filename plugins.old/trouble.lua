-- Pretty diagnostics list
-- GitHub: https://github.com/folke/trouble.nvim
return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[X]X Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = '[X]X Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = '[C]ode [S]ymbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = '[C]ode LSP Definitions / references (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = '[X]L Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = '[X]Q Quickfix List (Trouble)',
    },
  },
  opts = {
    modes = {
      lsp = {
        win = { type = 'split', relative = 'win', position = 'right', size = 0.3 },
      },
    },
    focus = false,
    max_items = 200,
    auto_preview = false,
  },
}
