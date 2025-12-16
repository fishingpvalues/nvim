-- Haskell language server integration
-- GitHub: https://github.com/mrcjkb/haskell-tools.nvim
return {
  'mrcjkb/haskell-tools.nvim',
  version = '^6',
  lazy = false,
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'mfussenegger/nvim-dap',
  },
  config = function()
    vim.g.haskell_tools = {
      tools = {
        hover = {
          enable = true,
          border = {
            { '╭', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╮', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '╯', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╰', 'FloatBorder' },
            { '│', 'FloatBorder' },
          },
          stylize_markdown = false,
          auto_focus = false,
        },
        definition = {
          hoogle_signature_fallback = true,
        },
        repl = {
          handler = 'toggleterm',
        },
      },
      hls = {
        on_attach = function(client, bufnr, ht)
          local opts = { noremap = true, silent = true, buffer = bufnr }

          -- Haskell-specific keybindings
          vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
          vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
          vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
          vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
          vim.keymap.set('n', '<leader>rf', function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
          end, opts)
          vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)

          -- Standard LSP keybindings
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
        settings = {
          haskell = {
            plugin = {
              stan = {
                globalOn = true,
              },
            },
          },
        },
      },
      dap = {},
    }
  end,
}
