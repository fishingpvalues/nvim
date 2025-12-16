-- Java language server integration
-- GitHub: https://github.com/mfussenegger/nvim-jdtls
return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  dependencies = {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local config = {
      cmd = { 'jdtls' },
      root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = 'fernflower',
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          codeGeneration = {
            toString = {
              template = '${object}.toString()',
            },
            hashCodeEquals = {
              useJava7Objects = true,
            },
            useBlocks = true,
          },
        },
      },
      init_options = {
        bundles = {},
      },
    }

    -- Setup on_attach
    config.on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Java-specific commands
      vim.keymap.set('n', '<A-o>', require('jdtls').organize_imports, opts)
      vim.keymap.set('n', 'crv', require('jdtls').extract_variable, opts)
      vim.keymap.set('v', 'crv', '<Esc><cmd>lua require("jdtls").extract_variable(true)<CR>', opts)
      vim.keymap.set('n', 'crc', require('jdtls').extract_constant, opts)
      vim.keymap.set('v', 'crc', '<Esc><cmd>lua require("jdtls").extract_constant(true)<CR>', opts)
      vim.keymap.set('v', 'crm', '<Esc><cmd>lua require("jdtls").extract_method(true)<CR>', opts)

      -- Standard LSP keybindings
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end

    require('jdtls').start_or_attach(config)
  end,
}
