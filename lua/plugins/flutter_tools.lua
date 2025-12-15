-- Flutter and Dart development
-- GitHub: https://github.com/nvim-flutter/flutter-tools.nvim
return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = true,
  ft = 'dart',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    require('flutter-tools').setup({
      ui = {
        enable_devtools = true,
        enable_devtools_server_port_override = true,
        devtools_port = 9100,
        devtools_device_port = 9101,
        custom_devices = {},
        pipelines = {
          {
            device = 'linux',
            command = 'flutter',
            args = { 'run', '-d', 'linux' },
          },
        },
      },
      decorations = {
        statusline = {
          device = true,
          project_config = true,
        },
      },
      widget_guides = {
        enabled = false,
      },
      closing_tags = {
        highlight = 'ErrorMsg',
        prefix = '//',
        enabled = true,
      },
      lsp = {
        color = { enabled = false },
        on_attach = nil,
        capabilities = nil,
        settings = {
          showTodos = true,
          renameFilesWithClasses = 'prompt',
          enableSnippets = true,
          updateImportsOnRename = true,
          completionBudgetMilliseconds = 500,
          analysisExcludedFolders = {},
          enableAssists = true,
        },
      },
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>fr', '<cmd>FlutterRun<CR>', vim.tbl_extend('force', { desc = '[F]lutter [R]un' }, opts))
    vim.keymap.set('n', '<leader>fR', '<cmd>FlutterRestart<CR>', vim.tbl_extend('force', { desc = '[F]lutter [R]estart' }, opts))
    vim.keymap.set('n', '<leader>fq', '<cmd>FlutterQuit<CR>', vim.tbl_extend('force', { desc = '[F]lutter [Q]uit' }, opts))
    vim.keymap.set('n', '<leader>fd', '<cmd>FlutterDevices<CR>', vim.tbl_extend('force', { desc = '[F]lutter [D]evices' }, opts))
  end,
}
