-- Code outline for quick navigation
-- GitHub: https://github.com/stevearc/aerial.nvim
return {
  'stevearc/aerial.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    on_attach = function(bufnr)
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, desc = 'Previous symbol' })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, desc = 'Next symbol' })
    end,
    layout = {
      max_width = { 40, 0.2 },
      min_width = 10,
      default_direction = 'prefer_right',
      placement = 'window',
      resize_to_content = true,
    },
    backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },
    filter_kind = {
      'Class',
      'Constructor',
      'Enum',
      'Function',
      'Interface',
      'Module',
      'Method',
      'Struct',
    },
    lsp = { update_delay = 300 },
    treesitter = { update_delay = 300 },
    disable_max_lines = 10000,
    disable_max_size = 2000000,
    post_jump_cmd = 'normal! zz',
    close_on_select = false,
  },
  config = function(_, opts)
    require('aerial').setup(opts)
    vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>', { desc = '[A]erial toggle' })
  end,
}
