-- Scala language server integration
-- GitHub: https://github.com/scalameta/nvim-metals
return {
  'scalameta/nvim-metals',
  ft = { 'scala', 'sbt', 'java' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
  },
  config = function()
    local metals_config = require('metals').bare_config()

    metals_config.on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Metals specific commands
      vim.keymap.set('n', '<leader>ws', require('metals').workspace_symbol, opts)
      vim.keymap.set('n', '<leader>dc', require('metals').commands, opts)
      vim.keymap.set('n', '<leader>sc', require('metals').source_code_actions, opts)

      -- Standard LSP keybindings
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end

    metals_config.init_options.statusBarProvider = 'on'

    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'scala', 'sbt', 'java' },
      callback = function()
        require('metals').initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })

    -- Format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = nvim_metals_group,
      buffer = 0,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
