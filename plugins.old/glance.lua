-- glance.nvim: VSCode-like peek preview for LSP
return {
  'dnlhc/glance.nvim',
  cmd = 'Glance',
  keys = {
    { 'gD', '<CMD>Glance definitions<CR>', desc = 'LSP: Glance Definitions' },
    { 'gR', '<CMD>Glance references<CR>', desc = 'LSP: Glance References' },
    { 'gY', '<CMD>Glance type_definitions<CR>', desc = 'LSP: Glance Type Definitions' },
    { 'gM', '<CMD>Glance implementations<CR>', desc = 'LSP: Glance Implementations' },
  },
  opts = {
    height = 18,
    zindex = 45,
    preview_win_opts = {
      cursorline = true,
      number = true,
      wrap = true,
    },
    border = {
      enable = true,
      top_char = '―',
      bottom_char = '―',
    },
    list = {
      position = 'right',
      width = 0.33,
    },
    theme = {
      enable = true,
      mode = 'auto',
    },
    mappings = {
      list = {
        ['j'] = 'next',
        ['k'] = 'previous',
        ['<Down>'] = 'next',
        ['<Up>'] = 'previous',
        ['<Tab>'] = 'next_location',
        ['<S-Tab>'] = 'previous_location',
        ['<C-u>'] = 'preview_scroll_win(5)',
        ['<C-d>'] = 'preview_scroll_win(-5)',
        ['v'] = 'jump_vsplit',
        ['s'] = 'jump_split',
        ['t'] = 'jump_tab',
        ['<CR>'] = 'jump',
        ['o'] = 'jump',
        ['l'] = 'open_fold',
        ['h'] = 'close_fold',
        ['<leader>l'] = 'enter_win("preview")',
        ['q'] = 'close',
        ['Q'] = 'close',
        ['<Esc>'] = 'close',
      },
      preview = {
        ['Q'] = 'close',
        ['<Tab>'] = 'next_location',
        ['<S-Tab>'] = 'previous_location',
        ['<leader>l'] = 'enter_win("list")',
      },
    },
    hooks = {},
    folds = {
      fold_closed = '',
      fold_open = '',
      folded = true,
    },
    indent_lines = {
      enable = true,
      icon = '│',
    },
    winbar = {
      enable = true,
    },
  },
}
