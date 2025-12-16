-- mini.nvim: Collection of minimal, fast, and featureful plugins
return {
  'echasnovski/mini.nvim',
  version = false,
  event = { "VeryLazy" },
  config = function()
    -- mini.ai: Extended text objects
    require('mini.ai').setup({
      n_lines = 500,
      search_method = 'cover_or_next',
    })

    -- mini.comment: Smart commenting (alternative to Comment.nvim)
    -- Uncomment if you want to replace Comment.nvim
    -- require('mini.comment').setup()

    -- mini.surround: Add/delete/replace surroundings
    require('mini.surround').setup({
      mappings = {
        add = 'sa',            -- Add surrounding in Normal and Visual modes
        delete = 'sd',         -- Delete surrounding
        find = 'sf',           -- Find surrounding (to the right)
        find_left = 'sF',      -- Find surrounding (to the left)
        highlight = 'sh',      -- Highlight surrounding
        replace = 'sr',        -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`
      },
      search_method = 'cover_or_next',
    })

    -- mini.move: Move selections and lines
    require('mini.move').setup({
      mappings = {
        -- Move visual selection in Visual mode
        left = '<M-h>',
        right = '<M-l>',
        down = '<M-j>',
        up = '<M-k>',

        -- Move current line in Normal mode
        line_left = '<M-h>',
        line_right = '<M-l>',
        line_down = '<M-j>',
        line_up = '<M-k>',
      },
    })

    -- mini.bufremove: Better buffer deletion
    require('mini.bufremove').setup()

    -- mini.indentscope: Visualize and operate on indent scope
    require('mini.indentscope').setup({
      symbol = '│',
      options = { try_as_border = true },
      draw = {
        delay = 100,
        animation = require('mini.indentscope').gen_animation.none(),
      },
    })

    -- mini.trailspace: Highlight and remove trailing whitespace
    require('mini.trailspace').setup()

    -- mini.align: Interactive text alignment
    require('mini.align').setup({
      -- Options for mini.align go here, consult its documentation
      mappings = {
        start = 'ga', -- start interactive aligning in Visual mode
        start_with_preview = 'gA', -- start interactive aligning with live preview
      },
      duration = 250, -- duration of the animation in ms
      keep_preceding_space = true, -- if true, space before first matched pattern is kept
    })

    -- mini.splitjoin: Split and join blocks of code
    require('mini.splitjoin').setup({
      -- More options can be found in the documentation
      mappings = {
        split = 'gss',
        join = 'gsj',
      },
    })

    -- mini.operators: A framework for creating custom operators
    require('mini.operators').setup({
      -- No specific setup needed to get started
    })

    -- mini.doc: Generate documentation for Lua code
    require('mini.doc').setup({
      -- No specific setup needed to get started
    })

    -- mini.test: A testing framework for Lua code
    require('mini.test').setup({
      -- No specific setup needed to get started
    })
  end,
  keys = {
    { "<leader>mt", "<cmd>lua MiniTrailspace.trim()<CR>", desc = "Mini: Trim Trailing Whitespace" },
    { "<leader>bd", "<cmd>lua MiniBufremove.delete()<CR>", desc = "Mini: Delete Buffer" },
    { "<leader>bw", "<cmd>lua MiniBufremove.wipeout()<CR>", desc = "Mini: Wipeout Buffer" },
  },
}
