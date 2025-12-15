return {
  'famiu/bufdelete.nvim',
  name = 'bufdelete',
  keys = {
    { '<leader>bd', '<cmd>Bufdelete<CR>', desc = 'Delete buffer' },
  },
  opts = {}, -- Configuration options for bufdelete.nvim go here, if any
  -- For example:
  -- opts = {
  --   bufdelete_next_buffer = function()
  --     return require('bufdelete').bufdelete(0, false, false, true)
  --   end,
  -- },
}