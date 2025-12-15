-- Go language development tools
-- Uses native LSP + gopls
return {
  'ray-x/go.nvim',
  ft = 'go',
  event = 'VeryLazy',
  dependencies = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup({
      goimport = 'goimports',
      gofmt = 'gofumpt',
      max_line_len = 120,
      tag_transform = false,
      test_template = '',
      test_template_dir = '',
      comment_placeholder = ' ',
      icons = true,
      sign_priority = 6,
      lsp_inlay_hints = {
        enable = true,
        style = 'inlay',
        only_current_line = false,
      },
      lsp_keymaps = false,
      lsp_codelens = true,
    })

    local opts = { noremap = true, silent = true }

    -- Go specific keybindings
    vim.keymap.set('n', '<leader>gi', '<cmd>GoImports<CR>', vim.tbl_extend('force', { desc = '[G]o [I]mports' }, opts))
    vim.keymap.set('n', '<leader>gf', '<cmd>GoFmt<CR>', vim.tbl_extend('force', { desc = '[G]o [F]ormat' }, opts))
    vim.keymap.set('n', '<leader>ge', '<cmd>GoErr<CR>', vim.tbl_extend('force', { desc = '[G]o handle [E]rror' }, opts))
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTest<CR>', vim.tbl_extend('force', { desc = '[G]o [T]est' }, opts))
    vim.keymap.set('n', '<leader>ga', '<cmd>GoAlt<CR>', vim.tbl_extend('force', { desc = '[G]o toggle [A]lt file' }, opts))
    vim.keymap.set('n', '<leader>gc', '<cmd>GoCoverage<CR>', vim.tbl_extend('force', { desc = '[G]o [C]overage' }, opts))
    vim.keymap.set('n', '<leader>gl', '<cmd>GoLint<CR>', vim.tbl_extend('force', { desc = '[G]o [L]int' }, opts))
  end,
}
