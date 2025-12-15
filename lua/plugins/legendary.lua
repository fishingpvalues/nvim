-- Command palette for keybindings and commands
-- GitHub: https://github.com/mrjones2014/legendary.nvim
return {
  'mrjones2014/legendary.nvim',
  event = 'VeryLazy',
  priority = 10,
  dependencies = { 'kkharji/sqlite.lua', 'nvim-telescope/telescope.nvim' },
  config = function()
    pcall(function()
      require('legendary').setup({
        keymaps = {
          useDefaults = true,
        },
        include_builtin = true,
        extensions = {
          lazy_nvim = true,
          which_key = {
            auto_register = true,
            bind = true,
          },
        },
      })
    end)

    vim.keymap.set('n', '<leader>lc', '<cmd>Legendary<cr>', { desc = '[L]egendary [C]ommand palette' })
  end,
}
