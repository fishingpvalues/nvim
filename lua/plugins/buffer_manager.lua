-- Smart buffer management
-- GitHub: https://github.com/j-morano/buffer_manager.nvim
return {
  'j-morano/buffer_manager.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('buffer_manager').setup({
      line_keys = 'jkasdfuiopqwert',
      height = 20,
      width = 40,
      correction_offset = 2,
      modulo_keys = 'jk',
      command_keys = { 'c', 'v', 'd' },
      search_prefix = '#',
      letters = 'abcdefghijklmnopqrstuvwxyz',
      numbers = '',
      bold = true,
      highlight = 'BufferManagerBorder',
    })

    local bm = require('buffer_manager.ui')
    if bm.toggle_quick_menu then
      vim.keymap.set('n', '<leader>bm', bm.toggle_quick_menu, { desc = '[B]uffer [M]anager toggle' })
    end
    if bm.nav_file_previous then
      vim.keymap.set('n', '<leader>bn', bm.nav_file_previous, { desc = '[B]uffer [N]avigation previous' })
    end
    if bm.nav_file_next then
      vim.keymap.set('n', '<leader>bp', bm.nav_file_next, { desc = '[B]uffer [P]revious navigation next' })
    end
  end,
}
