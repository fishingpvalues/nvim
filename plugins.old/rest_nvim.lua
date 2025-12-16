-- REST client for HTTP testing
-- GitHub: https://github.com/rest-nvim/rest.nvim
return {
  'rest-nvim/rest.nvim',
  event = 'VeryLazy',
  ft = 'http',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('rest-nvim').setup({
      -- Open request results in a horizontal split
      result = {
        split = true,
        split_direction = 'vertical',
        stay_in_current_window_after_split = false,
        -- Show statistics such as bytes read, time taken, etc
        show_statistics = false,
        -- Titles of displayed columns in the response handler
        statistics_winbar_title = 'Statistics',
        response_winbar_title = 'Response',
      },
      -- Log request and response payloads
      skip_ssl_verification = false,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      _punch_card = {
        enabled = true,
      },
    })

    -- Load Telescope extension for environment variable selection
    pcall(function()
      require('telescope').load_extension('rest')
    end)

    vim.keymap.set('n', '<leader>rr', '<Plug>RestNvim', { desc = '[R]un [R]est request' })
    vim.keymap.set('n', '<leader>rp', '<Plug>RestNvimPreview', { desc = '[R]est [P]review request' })
    vim.keymap.set('n', '<leader>rl', '<Plug>RestNvimLast', { desc = '[R]est [L]ast request' })
    vim.keymap.set('n', '<leader>re', '<Cmd>Telescope rest select_env<CR>', { desc = '[R]est select [E]nv file' })
  end,
}
