-- Auto-generate debug print statements
-- GitHub: https://github.com/andrewferrier/debugprint.nvim
return {
  'andrewferrier/debugprint.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
  },
  config = function()
    require('debugprint').setup({
      -- How to print in different languages
      filetypes = {
        python = {
          left = 'print("',
          right = '")',
          mid_var = '", ',
          right_var = ')',
        },
        javascript = {
          left = 'console.log("',
          right = '")',
          mid_var = '", ',
          right_var = ')',
        },
        typescript = {
          left = 'console.log("',
          right = '")',
          mid_var = '", ',
          right_var = ')',
        },
        go = {
          left = 'fmt.Println("',
          right = '")',
          mid_var = '", ',
          right_var = ')',
        },
        rust = {
          left = 'println!("',
          right = '");',
          mid_var = '", ',
          right_var = ');',
        },
        lua = {
          left = 'print("',
          right = '")',
          mid_var = '", ',
          right_var = ')',
        },
      },
      move_to_debugline = false,
      print_var_statements = true,
    })

    vim.keymap.set('n', '<leader>dp', function()
      require('debugprint').debugprint()
    end, { desc = '[D]ebug [P]rint variable' })

    vim.keymap.set('n', '<leader>dP', function()
      require('debugprint').debugprint({ variable = true })
    end, { desc = '[D]ebug [P]rint (verbose)' })

    vim.keymap.set('v', '<leader>dp', function()
      require('debugprint').debugprint()
    end, { desc = '[D]ebug [P]rint selected' })

    vim.keymap.set('n', '<leader>dd', function()
      require('debugprint').deleteprints()
    end, { desc = '[D]ebug [D]elete prints' })
  end,
}
