-- Distraction-free coding environment
-- GitHub: https://github.com/folke/zen-mode.nvim
return {
  'folke/zen-mode.nvim',
  event = 'VeryLazy',
  dependencies = { 'folke/twilight.nvim' },
  config = function()
    require('zen-mode').setup({
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = 'no',
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = '0',
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = {
          enabled = false,
          font = '+2',
        },
        alacritty = {
          enabled = false,
          font = '14',
        },
        wezterm = {
          enabled = false,
          font = '+2',
        },
      },
      on_open = function(_)
        vim.keymap.set('n', '<leader>z', require('zen-mode').close, { buffer = true, desc = 'Toggle Zen Mode' })
      end,
      on_close = function() end,
    })

    vim.keymap.set('n', '<leader>z', require('zen-mode').toggle, { desc = 'Toggle Zen Mode' })
  end,
}
