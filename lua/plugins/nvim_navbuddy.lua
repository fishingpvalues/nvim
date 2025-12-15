-- Breadcrumb navigation using LSP
-- GitHub: https://github.com/SmiteshP/nvim-navbuddy
return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  config = function()
    local navbuddy = require('nvim-navbuddy')
    local actions = require('nvim-navbuddy.actions')

    navbuddy.setup({
      window = {
        border = 'single',
        size = '60%',
        position = '50%',
        sections = {
          left = { size = '20%', border = nil },
          mid = { size = '40%', border = nil },
          right = { border = nil, preview = 'leaf' },
        },
      },
      node_markers = {
        enabled = true,
        icons = {
          leaf = ' ',
          leaf_selected = ' → ',
          branch = ' ',
        },
      },
      use_default_mappings = true,
      lsp = {
        auto_attach = false,
        preference = nil,
      },
      source_buffer = {
        follow_node = true,
        highlight = true,
        reorient = 'smart',
      },
    })

    vim.keymap.set('n', '<leader>nb', '<cmd>Navbuddy<CR>', { desc = '[N]av[B]uddy' })
  end,
}
