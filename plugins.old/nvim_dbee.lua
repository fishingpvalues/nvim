-- Database client for SQL/database exploration
-- GitHub: https://github.com/kndndrj/nvim-dbee
return {
  'kndndrj/nvim-dbee',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup({
      drawer = {
        disable_help = false,
        disable_indicator = false,
        width = 40,
      },
      editor = {
        close_on_execute = false,
        close_on_error = false,
      },
      result = {
        ---@type "by_line" | "by_column"
        layout = 'by_column',
        wrap = false,
        show_null_as_italic = true,
      },
      bin_locations = {
        -- posixly_correct = 1 will be set in the process env
        psql = nil,
        mysql = nil,
        mongo = nil,
      },
      conn_template = {
        sqlite = 'sqlite://{{path}}',
        mysql = 'mysql://{{user}}{{password_prompt}}@{{host}}:{{port}}/{{database}}',
        postgres = 'postgres://{{user}}{{password_prompt}}@{{host}}:{{port}}/{{database}}',
        mongodb = 'mongodb://{{user}}{{password_prompt}}@{{host}}:{{port}}/{{database}}',
      },
    })

    vim.keymap.set('n', '<leader>dbo', require('dbee').open, { desc = '[DB] Open' })
    vim.keymap.set('n', '<leader>dbt', require('dbee').toggle, { desc = '[DB] Toggle' })
    vim.keymap.set('n', '<leader>dbc', require('dbee').execute, { desc = '[DB] Execute' })
  end,
}
