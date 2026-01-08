-- ============================================================================
-- Git: Gitsigns, Neogit, CodeDiff, Fugitive
-- ============================================================================

return {
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      current_line_blame = false,
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Commit" },
    },
    opts = {
      kind = "tab",
      integrations = {
        fzf_lua = true,
      },
    },
  },

  -- CodeDiff (VSCode-style diff with two-tier highlighting)
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    keys = {
      { "<leader>gd", "<cmd>CodeDiff<cr>", desc = "CodeDiff Explorer" },
      { "<leader>gh", "<cmd>CodeDiff file HEAD<cr>", desc = "File History" },
    },
    config = function()
      require("codediff").setup({
        -- Highlight configuration (auto-adapts to colorscheme)
        highlights = {
          line_insert = "DiffAdd",      -- Line-level insertions
          line_delete = "DiffDelete",   -- Line-level deletions
          char_insert = nil,            -- Auto-derive from line_insert (1.4x brighter for dark, 0.92x darker for light)
          char_delete = nil,            -- Auto-derive from line_delete
          char_brightness = nil,        -- Auto-detect based on vim.o.background
        },

        -- Diff view behavior
        diff = {
          disable_inlay_hints = true,         -- Disable inlay hints for cleaner diff view
          max_computation_time_ms = 5000,     -- Max time for diff computation
          hide_merge_artifacts = false,       -- Hide merge tool temp files
        },

        -- Explorer panel configuration
        explorer = {
          position = "left",        -- "left" or "bottom"
          width = 40,               -- Width when position is "left"
          height = 15,              -- Height when position is "bottom"
          indent_markers = true,    -- Show indent markers in tree view
          icons = {
            folder_closed = "",
            folder_open = "",
          },
          view_mode = "list",       -- "list" or "tree"
          file_filter = {
            ignore = {},            -- Glob patterns to hide
          },
        },

        -- Keymaps in diff view
        keymaps = {
          view = {
            quit = "q",                     -- Close diff tab
            toggle_explorer = "<leader>b",  -- Toggle explorer visibility
            next_hunk = "]c",               -- Jump to next change
            prev_hunk = "[c",               -- Jump to previous change
            next_file = "]f",               -- Next file in explorer
            prev_file = "[f",               -- Previous file in explorer
            diff_get = "do",                -- Get change from other buffer
            diff_put = "dp",                -- Put change to other buffer
          },
          explorer = {
            select = "<CR>",        -- Open diff for selected file
            hover = "K",            -- Show file diff preview
            refresh = "R",          -- Refresh git status
            toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
          },
          conflict = {
            accept_incoming = "<leader>ct",  -- Accept incoming (theirs) change
            accept_current = "<leader>co",   -- Accept current (ours) change
            accept_both = "<leader>cb",      -- Accept both changes
            discard = "<leader>cx",          -- Discard both, keep base
            next_conflict = "]x",            -- Jump to next conflict
            prev_conflict = "[x",            -- Jump to previous conflict
            diffget_incoming = "2do",        -- Get hunk from incoming buffer
            diffget_current = "3do",         -- Get hunk from current buffer
          },
        },
      })
    end,
  },

  -- Fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename" },
    keys = {
      { "<leader>gG", "<cmd>Git<cr>", desc = "Fugitive" },
    },
  },
}
