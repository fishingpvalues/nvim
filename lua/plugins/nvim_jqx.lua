-- Interactive interface for JSON files
-- GitHub: https://github.com/gennaro-tedesco/nvim-jqx
return {
  'gennaro-tedesco/nvim-jqx',
  ft = 'json',
  event = 'VeryLazy',
  config = function()
    -- nvim-jqx doesn't require setup, just provide keybindings
    vim.keymap.set('n', '<leader>jq', '<cmd>JqxList<CR>', { desc = '[J]son [Q]query explorer' })
    vim.keymap.set('n', '<leader>jx', '<cmd>JqxQuery<CR>', { desc = '[J]son [X]query execute' })
  end,
}
