-- Structural Search and Replace using Tree-sitter
-- GitHub: https://github.com/cshuaimin/ssr.nvim
return {
  'cshuaimin/ssr.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('ssr').setup({
      border = 'rounded',
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      adjust_window = true,
      keymaps = {
        close = 'q',
        next_match = 'n',
        prev_match = 'N',
        replace_confirm = '<cr>',
        replace_all = '<C-a>',
      },
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>sr', function()
      require('ssr').open()
    end, { desc = '[S]tructural [R]eplace' })
  end,
}
