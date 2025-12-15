-- Seamless navigation between Neovim and tmux
-- GitHub: https://github.com/numToStr/Navigator.nvim
return {
  'numToStr/Navigator.nvim',
  event = 'VeryLazy',
  config = function()
    require('Navigator').setup({
      auto_save = nil,
      disable_on_zoom = false,
    })

    vim.keymap.set('n', '<C-h>', '<CMD>NavigatorLeft<CR>', { desc = 'Navigate left' })
    vim.keymap.set('n', '<C-l>', '<CMD>NavigatorRight<CR>', { desc = 'Navigate right' })
    vim.keymap.set('n', '<C-k>', '<CMD>NavigatorUp<CR>', { desc = 'Navigate up' })
    vim.keymap.set('n', '<C-j>', '<CMD>NavigatorDown<CR>', { desc = 'Navigate down' })
    vim.keymap.set('n', '<C-\\>', '<CMD>NavigatorPrevious<CR>', { desc = 'Navigate previous' })

    vim.keymap.set('t', '<C-h>', '<CMD>NavigatorLeft<CR>', { desc = 'Navigate left' })
    vim.keymap.set('t', '<C-l>', '<CMD>NavigatorRight<CR>', { desc = 'Navigate right' })
    vim.keymap.set('t', '<C-k>', '<CMD>NavigatorUp<CR>', { desc = 'Navigate up' })
    vim.keymap.set('t', '<C-j>', '<CMD>NavigatorDown<CR>', { desc = 'Navigate down' })
    vim.keymap.set('t', '<C-\\>', '<CMD>NavigatorPrevious<CR>', { desc = 'Navigate previous' })
  end,
}
