return {
  'miversen33/netman.nvim',
  -- Optional: Specify when to load the plugin.
  -- 'BufEnter' or 'VimEnter' are common events, or use a command.
  event = 'VimEnter', 
  -- or
  -- cmd = 'NetmanToggle',

  -- Optional: If netman.nvim has any dependencies, list them here.
  -- For example, if it depends on 'nvim-tree/nvim-web-devicons' for icons.
  -- dependencies = {
  --   'nvim-tree/nvim-web-devicons', -- For file icons (optional)
  --   'ibhagwan/fzf-lua', -- Example if it integrates with fzf (check netman docs)
  -- },

  -- Configuration function that runs after the plugin is loaded.
  config = function()
    require('netman').setup({
      -- Your netman.nvim configuration options go here.
      -- Refer to netman.nvim's documentation for available options.
      -- Example (these are hypothetical, check actual docs):
      -- width = 40,
      -- auto_close = true,
      -- mappings = {
      --   toggle = '<leader>nm',
      --   open_file = '<CR>',
      --   delete_file = 'd',
      -- },
    })

    -- Optional: Set up keymaps if netman.nvim doesn't do it by default or you want custom ones.
    -- vim.keymap.set('n', '<leader>nm', '<cmd>NetmanToggle<CR>', { desc = 'Toggle Netman' })
  end,
}
