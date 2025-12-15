-- Colorscheme switcher
-- GitHub: https://github.com/zaldih/themery.nvim
return {
  'zaldih/themery.nvim',
  event = 'VeryLazy',
  lazy = false,
  priority = 999,
  config = function()
    require('themery').setup({
      themes = {
        { name = 'github_light', colorscheme = 'github-theme' },
        { name = 'github_dark', colorscheme = 'github-theme' },
        { name = 'tokyonight', colorscheme = 'tokyonight-night' },
        { name = 'onedark', colorscheme = 'onedark' },
        { name = 'monokai', colorscheme = 'monokai' },
        { name = 'gruvbox', colorscheme = 'gruvbox' },
        { name = 'nord', colorscheme = 'nord' },
        { name = 'dracula', colorscheme = 'dracula' },
      },
      livePreview = true,
    })

    vim.keymap.set('n', '<leader>tm', '<cmd>Themery<cr>', { desc = '[T]heme [M]anager' })
  end,
}
