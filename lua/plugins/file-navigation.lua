-- ============================================================================
-- File and Buffer Navigation Tools
-- ============================================================================

return {
  -- Arrow (quick file bookmarks)
  {
    "otavioschwanck/arrow.nvim",
    keys = {
      { "H", function() require("arrow.persist").previous() end, desc = "Arrow Previous" },
      { "L", function() require("arrow.persist").next() end, desc = "Arrow Next" },
      { "<leader>m", function() require("arrow.ui").openMenu() end, desc = "Arrow Menu" },
    },
    opts = {
      show_icons = true,
      leader_key = ";",
      buffer_leader_key = "m",
    },
  },

  -- Portal (jump list navigation)
  {
    "cbochs/portal.nvim",
    dependencies = {
      "cbochs/grapple.nvim",
      "ThePrimeagen/harpoon",
    },
    keys = {
      { "<leader>o", "<cmd>Portal jumplist backward<cr>", desc = "Portal Backward" },
      { "<leader>i", "<cmd>Portal jumplist forward<cr>", desc = "Portal Forward" },
    },
    opts = {},
  },

  -- Trailblazer (navigate marks and trails)
  {
    "LeonHeidelbach/trailblazer.nvim",
    keys = {
      { "<A-l>", "<cmd>TrailBlazerNewTrailMark<cr>", desc = "New Trail Mark" },
      { "<A-b>", "<cmd>TrailBlazerTrackBack<cr>", desc = "Track Back" },
      { "<A-J>", "<cmd>TrailBlazerPeekMovePreviousUp<cr>", desc = "Move Previous Up" },
      { "<A-K>", "<cmd>TrailBlazerPeekMoveNextDown<cr>", desc = "Move Next Down" },
    },
    opts = {
      trail_options = {
        mark_symbol = "•",
        newest_mark_symbol = "⬤",
        cursor_mark_symbol = "⬤",
        next_mark_symbol = "⬤",
        previous_mark_symbol = "⬤",
      },
    },
  },

  -- Buffer manager
  {
    "j-morano/buffer_manager.nvim",
    keys = {
      { "<leader>bm", function() require("buffer_manager.ui").toggle_quick_menu() end, desc = "Buffer Manager" },
    },
    opts = {
      select_menu_item_commands = {
        v = {
          key = "<C-v>",
          command = "vsplit",
        },
        h = {
          key = "<C-h>",
          command = "split",
        },
      },
    },
  },

  -- Bufdelete (better buffer deletion)
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
    keys = {
      { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete Buffer" },
      { "<leader>bw", "<cmd>Bwipeout<cr>", desc = "Wipeout Buffer" },
    },
  },

  -- Yazi (file manager)
  {
    "mikavilpas/yazi.nvim",
    keys = {
      { "<leader>y", "<cmd>Yazi<cr>", desc = "Yazi" },
      { "<leader>Y", "<cmd>Yazi cwd<cr>", desc = "Yazi (cwd)" },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },

  -- Workspaces (manage workspaces)
  {
    "natecraddock/workspaces.nvim",
    cmd = { "WorkspacesList", "WorkspacesAdd", "WorkspacesRemove", "WorkspacesOpen" },
    keys = {
      { "<leader>wl", "<cmd>WorkspacesList<cr>", desc = "List Workspaces" },
      { "<leader>wa", "<cmd>WorkspacesAdd<cr>", desc = "Add Workspace" },
      { "<leader>wo", "<cmd>WorkspacesOpen<cr>", desc = "Open Workspace" },
    },
    opts = {
      hooks = {
        open = { "FzfLua files" },
      },
    },
  },

  -- Neoscroll (smooth scrolling)
  {
    "karb94/neoscroll.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local neoscroll = require("neoscroll")
      neoscroll.setup({
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = "quadratic",
      })

      -- Custom key mappings (new non-deprecated way)
      local keymap = {
        ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250 }) end,
        ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250 }) end,
        ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450 }) end,
        ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450 }) end,
        ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
        ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
        ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end,
        ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end,
        ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end,
      }

      local modes = { "n", "v", "x" }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end,
  },

  -- Registers (show register contents)
  {
    "tversteeg/registers.nvim",
    cmd = "Registers",
    keys = {
      { '"', mode = { "n", "v" } },
      { "<C-R>", mode = "i" },
    },
    opts = {
      bind_keys = {
        normal = '"',
        visual = '"',
        insert = "<C-R>",
      },
    },
  },

  -- Peekup (register preview)
  {
    "gennaro-tedesco/nvim-peekup",
    keys = {
      { "<leader>r", "<cmd>lua require('nvim-peekup').peekup_open()<cr>", desc = "Peekup Registers" },
    },
    opts = {},
  },
}
