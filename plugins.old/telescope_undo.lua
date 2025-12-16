-- Telescope extension for undo history visualization
-- GitHub: https://github.com/debugloop/telescope-undo.nvim
return {
  'debugloop/telescope-undo.nvim',
  enabled = false,
  event = 'VeryLazy',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').load_extension('undo')

    vim.keymap.set('n', '<leader>su', '<cmd>Telescope undo<cr>', { desc = '[S]earch [U]ndo history' })
  end,
}
