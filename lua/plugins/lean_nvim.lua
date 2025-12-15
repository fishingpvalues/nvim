-- Lean theorem prover support
-- GitHub: https://github.com/Julian/lean.nvim
return {
  'Julian/lean.nvim',
  ft = 'lean',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('lean').setup({
      abbreviations = { enable = true },
      mappings = true,
    })

    -- Configure LSP using vim.lsp.config (new API)
    vim.lsp.config('leanls', {
      init_options = {
        editDelay = 75,
        hasWidgets = true,
        autoImplicit = true,
        checkTactics = true,
      },
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>lp', '<cmd>LeanEvaluate<CR>', vim.tbl_extend('force', { desc = '[L]ean [P]lus evaluate' }, opts))
  end,
}
