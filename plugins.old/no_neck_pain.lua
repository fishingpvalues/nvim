-- Center the buffer for reduced eye strain on wide screens
-- GitHub: https://github.com/shortcuts/no-neck-pain.nvim
return {
  'shortcuts/no-neck-pain.nvim',
  event = 'VeryLazy',
  config = function()
    require('no-neck-pain').setup({
      enabled = false,
      buffers = {
        left = nil,
        right = nil,
        wo = {
          fcs = 'eob: ',
        },
      },
      autocmds = {
        skipList = {},
      },
      colors = {
        background = 'NormalNC',
        NormalNC = nil,
      },
      width = 120,
      documentBuffer = {
        enabled = true,
        autoCmd = true,
      },
      -- margins between the document buffer and left/right buffer
      margins = {
        left = 10,
        right = 10,
      },
    })

    vim.keymap.set('n', '<leader>tnp', function()
      require('no-neck-pain').toggle()
    end, { desc = '[T]oggle [N]o [P]ain mode' })
  end,
}
