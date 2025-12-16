-- Manage struct field tags in Go
-- GitHub: https://github.com/romus204/go-tagger.nvim
return {
  'romus204/go-tagger.nvim',
  ft = 'go',
  event = 'VeryLazy',
  config = function()
    require('go-tagger').setup({
      auto_tag = false,
      languages = {
        go = {
          enabled = true,
          options = 'json,yaml,db,form',
          skip_unknown_fields = true,
        },
      },
    })

    local opts = { noremap = true, silent = true, desc = '[G]o [T]ag add' }
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTagAdd json,yaml<CR>', opts)
    vim.keymap.set('n', '<leader>gT', '<cmd>GoTagRemove<CR>', { noremap = true, silent = true, desc = '[G]o [T]ag remove' })
  end,
}
