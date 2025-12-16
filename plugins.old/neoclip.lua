-- Clipboard manager with telescope integration
-- GitHub: https://github.com/AckslD/nvim-neoclip.lua
return {
  'AckslD/nvim-neoclip.lua',
  event = 'VeryLazy',
  requires = {
    { 'kkharji/sqlite.lua', module = 'sqlite' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    local function is_whitespace(line)
      return vim.fn.match(line, [[^\s*$]]) ~= -1
    end

    require('neoclip').setup({
      default_register = '"',
      default_register_macros = 'q',
      enable_macro_history = true,
      length_limit = 1000000,
      history = 1000,
      preview = true,
      prompt = 'Clipboard> ',
      default_macros_register = 'q',
      keys = {
        telescope = {
          i = {
            select = '<cr>',
            paste = '<c-p>',
            paste_behind = '<c-k>',
            replay = '<c-q>',
            delete = '<c-d>',
            edit = '<c-e>',
            custom = {},
          },
          n = {
            select = '<cr>',
            paste = 'p',
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
            edit = 'e',
            custom = {},
          },
        },
      },
      content_spec_column = false,
      on_select = {
        prepend_newline = false,
        pre_hook = nil,
        post_hook = nil,
      },
      on_paste = {
        set_reg = false,
        truncate = false,
        pre_hook = nil,
        post_hook = nil,
      },
      on_replay = {
        set_reg = false,
        pre_hook = nil,
        post_hook = nil,
      },
      enable_cyclical_yank = false,
      filter = function(data)
        if not data or not data.regcontents or type(data.regcontents) ~= 'table' or #data.regcontents == 0 then
          return false
        end
        return not is_whitespace(data.regcontents[1])
      end,
    })

    require('telescope').load_extension('neoclip')
    vim.keymap.set('n', '<leader>cn', function() require('telescope').extensions.neoclip.default() end, { desc = '[C]lipboard [N]eoclip' })
    vim.keymap.set('n', '<leader>cm', function() require('telescope').extensions.neoclip.macros() end, { desc = '[C]lipboard [M]acros' })
  end,
}
