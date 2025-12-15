-- Enhanced symbols outline
-- GitHub: https://github.com/hedyhli/outline.nvim
return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = {
    { '<leader>o', '<cmd>Outline<CR>', desc = '[O]utline' },
  },
  opts = {
    outline_window = {
      position = 'right',
      width = 25,
      auto_close = false,
      focus_on_open = true,
    },
    symbols = {
      filter = nil,
      icon_source = 'lspkind',
    },
    symbol_folding = {
      autofold_depth = 1,
    },
    keymaps = {
      show_help = '?',
      close = { 'q', '<Esc>' },
      goto_location = '<Cr>',
      peek_location = 'o',
      toggle_preview = 'K',
      rename_symbol = 'r',
      code_actions = 'a',
      fold = 'h',
      unfold = 'l',
      fold_all = 'W',
      unfold_all = 'E',
    },
  },
}
