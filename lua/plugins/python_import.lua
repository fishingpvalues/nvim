-- Add Python import statements automatically
-- GitHub: https://github.com/kiyoon/python-import.nvim
return {
  'kiyoon/python-import.nvim',
  ft = 'python',
  event = 'VeryLazy',
  config = function()
    -- python-import.nvim doesn't require explicit setup
    -- Just provide keybindings for the available commands
    vim.keymap.set('n', '<leader>pi', '<cmd>PythonImportAdd<CR>', { desc = '[P]ython [I]mport add' })
    vim.keymap.set('n', '<leader>pr', '<cmd>PythonImportRemoveUnused<CR>', { desc = '[P]ython [R]emove unused imports' })
    vim.keymap.set('n', '<leader>pf', '<cmd>PythonImportFixAll<CR>', { desc = '[P]ython [F]ix all imports' })
  end,
}
