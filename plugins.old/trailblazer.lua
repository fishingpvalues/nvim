-- trailblazer.nvim: Stack-based mark system for dynamic workflows
-- GitHub: https://github.com/LeonHeidelbach/trailblazer.nvim
return {
  "LeonHeidelbach/trailblazer.nvim",
  event = "VeryLazy",
  config = function()
    require("trailblazer").setup({
      -- Enable/disable features
      auto_save_trailblazer_state_on_exit = true,
      auto_load_trailblazer_state_on_enter = true,

      -- Trail mark priority
      trail_mark_priority = 10001,

      -- Available selection modes
      selection_modes = {
        global_chron = { display_name = "Global Chronological" },
        global_buf_line_sorted = { display_name = "Global Buffer Line Sorted" },
        global_fpath_line_sorted = { display_name = "Global File Path Line Sorted" },
        buf_chron = { display_name = "Buffer Chronological" },
        buf_line_sorted = { display_name = "Buffer Line Sorted" },
        stack = { display_name = "Stack" },
      },

      -- Default mode
      default_selection_mode = "global_chron",

      -- Marks and stacks
      mark_symbol = "●",
      newest_mark_symbol = "◆",
      cursor_mark_symbol = "◇",

      -- Highlight groups
      mark_list_hl_group = "TrailBlazerMarkListMatch",
      trail_mark_in_text_hl_group = "TrailBlazerTrailMark",
      trail_mark_list_hl_group = "TrailBlazerTrailMarkListMatch",

      -- Keybindings
      keymaps = {
        new_trail_mark = "<A-l>",
        track_back = "<A-b>",
        set_trail_mark_stack_ptr_move_down = "<A-j>",
        set_trail_mark_stack_ptr_move_up = "<A-k>",
        get_trail_mark_stack_ptr = "<A-h>",
        move_to_nearest_trail_mark_up = "<A-p>",
        move_to_nearest_trail_mark_down = "<A-n>",
        move_to_previous_up_trail_mark = "<A-P>",
        move_to_previous_down_trail_mark = "<A-N>",
        stack_buf_indices = "<A-m>",
        toggle_trail_mark_list = "<A-a>",
        set_selection_mode = "<A-s>",
      },

      -- Whether to show number of marks in stacks
      stack_sort_by_line_number = true,

      -- Disable by file type
      trail_mark_list_hl_group_target = "TrailBlazerTrailMarkListTarget",
    })

    -- Optional: Create custom stacks for different project types
    local trailblazer = require("trailblazer")

    -- Create a stack for TODOs
    vim.keymap.set("n", "<leader>mt", function()
      trailblazer.new_trail_mark()
    end, { desc = "[M]ark [T]rail" })

    -- Navigate marks
    vim.keymap.set("n", "<leader>mb", function()
      trailblazer.track_back()
    end, { desc = "[M]ark [B]ack" })
  end,
}
