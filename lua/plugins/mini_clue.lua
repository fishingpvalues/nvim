return {
  "nvim-mini/mini.clue",
  event = "VeryLazy",
  config = function()
    local miniclue = require('mini.clue')
    
    -- Configure mini.clue to complement which-key.nvim
    -- Focus on built-in vim keys and let which-key handle <leader> mappings
    miniclue.setup({
      -- Array of opt-in triggers which start custom key query process
      triggers = {
        -- Built-in completion (which-key doesn't handle these well)
        { mode = 'i', keys = '<C-x>' },
        { mode = 'c', keys = '<C-x>' },
        
        -- Built-in vim keys that benefit from clue system
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        
        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },
        
        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },
        
        -- Window commands
        { mode = 'n', keys = '<C-w>' },
        
        -- Fold commands
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
        
        -- Navigation brackets
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        
        -- Search navigation
        { mode = 'n', keys = '*' },
        { mode = 'n', keys = '#' },
        
        -- Macro recording (but not q itself to avoid conflicts)
        { mode = 'n', keys = '@' },
        
        -- Custom plugin triggers that which-key doesn't cover
        { mode = 'n', keys = 's' },     -- Flash.nvim
        { mode = 'x', keys = 's' },     -- Flash.nvim visual
        { mode = 'o', keys = 'r' },     -- Flash.nvim operator
      },

      -- Array of extra clues to show
      clues = {
        -- Built-in clue generators for vim keys
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        
        -- Flash.nvim clues
        { mode = 'n', keys = 's', desc = 'Flash: Jump to location' },
        { mode = 'x', keys = 's', desc = 'Flash: Jump to location' },
        { mode = 'o', keys = 'r', desc = 'Flash: Remote jump' },
        { mode = 'n', keys = 'S', desc = 'Flash: Treesitter jump' },
        { mode = 'x', keys = 'S', desc = 'Flash: Treesitter jump' },
        { mode = 'o', keys = 'R', desc = 'Flash: Treesitter remote' },
        
        -- Enhanced LSP navigation clues
        { mode = 'n', keys = 'gD', desc = 'LSP: Go to definition' },
        { mode = 'n', keys = 'gd', desc = 'LSP: Go to definition' },
        { mode = 'n', keys = 'gR', desc = 'LSP: Go to references' },
        { mode = 'n', keys = 'gr', desc = 'LSP: Go to references' },
        { mode = 'n', keys = 'gI', desc = 'LSP: Go to implementation' },
        { mode = 'n', keys = 'gi', desc = 'LSP: Go to implementation' },
        { mode = 'n', keys = 'gY', desc = 'LSP: Go to type definition' },
        { mode = 'n', keys = 'gy', desc = 'LSP: Go to type definition' },
        { mode = 'n', keys = 'K', desc = 'LSP: Hover documentation' },
        { mode = 'n', keys = 'gK', desc = 'LSP: Hover documentation (alternative)' },
        
        -- Git navigation clues
        { mode = 'n', keys = ']c', desc = 'Git: Next hunk' },
        { mode = 'n', keys = '[c', desc = 'Git: Previous hunk' },
        { mode = 'n', keys = ']g', desc = 'Git: Next git change' },
        { mode = 'n', keys = '[g', desc = 'Git: Previous git change' },
        
        -- Quickfix/location list navigation
        { mode = 'n', keys = ']q', desc = 'Quickfix: Next item' },
        { mode = 'n', keys = '[q', desc = 'Quickfix: Previous item' },
        { mode = 'n', keys = ']l', desc = 'Location: Next item' },
        { mode = 'n', keys = '[l', desc = 'Location: Previous item' },
        
        -- Diagnostic navigation
        { mode = 'n', keys = ']d', desc = 'Diagnostic: Next error' },
        { mode = 'n', keys = '[d', desc = 'Diagnostic: Previous error' },
        { mode = 'n', keys = ']e', desc = 'Diagnostic: Next error/warning' },
        { mode = 'n', keys = '[e', desc = 'Diagnostic: Previous error/warning' },
        
        -- Buffer navigation
        { mode = 'n', keys = ']b', desc = 'Buffer: Next buffer' },
        { mode = 'n', keys = '[b', desc = 'Buffer: Previous buffer' },
        { mode = 'n', keys = ']t', desc = 'Tab: Next tab' },
        { mode = 'n', keys = '[t', desc = 'Tab: Previous tab' },
        
        -- Argument/motion navigation
        { mode = 'n', keys = ']a', desc = 'Argument: Next argument' },
        { mode = 'n', keys = '[a', desc = 'Argument: Previous argument' },
        
        -- Enhanced fold clues
        { mode = 'n', keys = 'zR', desc = 'Fold: Open all folds' },
        { mode = 'n', keys = 'zM', desc = 'Fold: Close all folds' },
        { mode = 'n', keys = 'zr', desc = 'Fold: Open more folds' },
        { mode = 'n', keys = 'zm', desc = 'Fold: Close more folds' },
        { mode = 'n', keys = 'zo', desc = 'Fold: Open fold under cursor' },
        { mode = 'n', keys = 'zc', desc = 'Fold: Close fold under cursor' },
        { mode = 'n', keys = 'za', desc = 'Fold: Toggle fold under cursor' },
        { mode = 'n', keys = 'zA', desc = 'Fold: Toggle all folds under cursor' },
        { mode = 'n', keys = 'zv', desc = 'Fold: Show cursor line' },
        { mode = 'n', keys = 'zx', desc = 'Fold: Update folds' },
        { mode = 'n', keys = 'zX', desc = 'Fold: Update folds recursively' },
        { mode = 'n', keys = 'zn', desc = 'Fold: Fold none' },
        { mode = 'n', keys = 'zN', desc = 'Fold: Fold normal' },
        { mode = 'n', keys = 'zi', desc = 'Fold: Toggle foldenable' },
        
        -- Window management clues
        { mode = 'n', keys = '<C-w>s', desc = 'Window: Split horizontal' },
        { mode = 'n', keys = '<C-w>v', desc = 'Window: Split vertical' },
        { mode = 'n', keys = '<C-w>c', desc = 'Window: Close window' },
        { mode = 'n', keys = '<C-w>o', desc = 'Window: Close other windows' },
        { mode = 'n', keys = '<C-w>q', desc = 'Window: Quit window' },
        { mode = 'n', keys = '<C-w>h', desc = 'Window: Move left' },
        { mode = 'n', keys = '<C-w>j', desc = 'Window: Move down' },
        { mode = 'n', keys = '<C-w>k', desc = 'Window: Move up' },
        { mode = 'n', keys = '<C-w>l', desc = 'Window: Move right' },
        { mode = 'n', keys = '<C-w>H', desc = 'Window: Move far left' },
        { mode = 'n', keys = '<C-w>J', desc = 'Window: Move far down' },
        { mode = 'n', keys = '<C-w>K', desc = 'Window: Move far up' },
        { mode = 'n', keys = '<C-w>L', desc = 'Window: Move far right' },
        { mode = 'n', keys = '<C-w>w', desc = 'Window: Next window' },
        { mode = 'n', keys = '<C-w>W', desc = 'Window: Previous window' },
        { mode = 'n', keys = '<C-w>t', desc = 'Window: Top window' },
        { mode = 'n', keys = '<C-w>b', desc = 'Window: Bottom window' },
        { mode = 'n', keys = '<C-w>p', desc = 'Window: Previous window' },
        { mode = 'n', keys = '<C-w>r', desc = 'Window: Rotate windows' },
        { mode = 'n', keys = '<C-w>R', desc = 'Window: Rotate windows backwards' },
        { mode = 'n', keys = '<C-w>x', desc = 'Window: Exchange windows' },
        { mode = 'n', keys = '<C-w>=', desc = 'Window: Equal size' },
        { mode = 'n', keys = '<C-w>_', desc = 'Window: Max height' },
        { mode = 'n', keys = '<C-w>|', desc = 'Window: Max width' },
        { mode = 'n', keys = '<C-w>+', desc = 'Window: Increase height' },
        { mode = 'n', keys = '<C-w>-', desc = 'Window: Decrease height' },
        { mode = 'n', keys = '<C-w>>', desc = 'Window: Increase width' },
        { mode = 'n', keys = '<C-w><', desc = 'Window: Decrease width' },
        
        -- Macro clues
        { mode = 'n', keys = '@', desc = 'Macro: Execute macro' },
        { mode = 'n', keys = '@@', desc = 'Macro: Repeat last macro' },
        { mode = 'n', keys = 'q', desc = 'Macro: Start recording (or which-key)' },
        { mode = 'n', keys = 'Q', desc = 'Macro: Play queued macros (NeoComposer)' },

        -- Atone.nvim (Undo Tree) clues
        { mode = 'n', keys = '<leader>u', desc = 'Atone: Toggle Undo Tree' },
        { mode = 'n', keys = '<leader>U', desc = 'Atone: Open Undo Tree' },

        -- Git-needy (GitHub Workflows) clues  
        { mode = 'n', keys = '<leader>w', desc = 'GitHub Workflows' },
        { mode = 'n', keys = '<leader>wf', desc = 'Open GitHub Workflows' },

        -- nvim-dap-envfile (Debug with .env) clues
        { mode = 'n', keys = '<leader>de', desc = 'Debug with .env file' },
      },

      -- Clue window settings
      window = {
        -- Floating window config
        config = {
          border = 'rounded',
          style = 'minimal',
          title = ' Mini.clue ',
          title_pos = 'center',
        },
        
        -- Delay before showing clue window (ms) - faster than which-key
        delay = 300,
        
        -- Keys to scroll inside the clue window
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
      },
    })
  end,
}