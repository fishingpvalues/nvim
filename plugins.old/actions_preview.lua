-- LSP code actions preview
-- GitHub: https://github.com/aznhe21/actions-preview.nvim
return {
  'aznhe21/actions-preview.nvim',
  event = 'VeryLazy',
  config = function()
    require('actions-preview').setup({
      diff = {
        ctxlen = 3,
        algorithm = 'patience',
        ignore_whitespace = true,
      },
      backend = { 'telescope' },
      telescope = require('telescope.themes').get_dropdown({
        preview = true,
        layout_config = {
          width = 0.8,
          height = 0.9,
        },
      }),
    })
    vim.keymap.set({ 'v', 'n' }, '<leader>ca', require('actions-preview').code_actions, { desc = '[C]ode [A]ctions' })
  end,
  dependencies = { 'nvim-telescope/telescope.nvim' },
}
