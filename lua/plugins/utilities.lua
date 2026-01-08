-- ============================================================================
-- Utilities: Overseer, Trouble, Persistence, and More
-- ============================================================================

return {
  -- Overseer (task runner)
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
    keys = {
      { "<leader>to", "<cmd>OverseerToggle<cr>", desc = "Overseer" },
      { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run task" },
    },
    opts = {},
  },

  -- Trouble (diagnostics)
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
    opts = {},
  },

  -- Session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      { "<leader>tg", function() require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" }):toggle() end, desc = "Lazygit" },
    },
    opts = {
      open_mapping = [[<C-/>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },

  -- Project management
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "go.mod" },
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("fzf-lua").register_ui_select()
    end,
  },

  -- Better quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Illuminate (highlight word under cursor)
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  -- Marks
  {
    "chentoast/marks.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Bookmarks
  {
    "tomasky/bookmarks.nvim",
    event = "VeryLazy",
    keys = {
      { "mm", "<cmd>BookmarksMark<cr>", desc = "Mark current line" },
      { "mo", "<cmd>BookmarksGoto<cr>", desc = "Go to bookmark" },
      { "ma", "<cmd>BookmarksCommands<cr>", desc = "Bookmark commands" },
      { "mg", "<cmd>BookmarksGotoRecent<cr>", desc = "Go to recent bookmark" },
    },
    opts = {
      on_attach = function(bufnr)
        local bm = require("bookmarks")
        local map = vim.keymap.set
        map("n", "mm", bm.bookmark_toggle, { buffer = bufnr, desc = "Toggle bookmark" })
        map("n", "mi", bm.bookmark_ann, { buffer = bufnr, desc = "Add/Edit bookmark annotation" })
        map("n", "mc", bm.bookmark_clean, { buffer = bufnr, desc = "Clean bookmarks" })
        map("n", "mn", bm.bookmark_next, { buffer = bufnr, desc = "Next bookmark" })
        map("n", "mp", bm.bookmark_prev, { buffer = bufnr, desc = "Prev bookmark" })
      end,
    },
  },

  -- Calculator
  {
    "necrom4/calcium.nvim",
    cmd = { "Calcium" },
    keys = {
      { "<leader>=", "<cmd>Calcium<cr>", desc = "Calculate", mode = { "n", "v" } },
      { "<leader>==", "<cmd>Calcium scratchpad<cr>", desc = "Calculator scratchpad" },
    },
    opts = {
      notifications = true,
      default_mode = "append",
      scratchpad = {
        border = "rounded",
        virtual_text = {
          format = "= %s",
          highlight_group = "Comment",
        },
        result_variable = "ans",
      },
    },
  },

  -- Better folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },

  -- Improved LSP rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      { "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, expr = true, desc = "Rename" },
    },
    config = true,
  },

  -- Removed nvim-spectre - functionality replaced by grug-far.nvim (see lua/plugins/search-replace.lua)

  -- Mini modules
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local hi = require("mini.hipatterns")
      return {
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color(),
        },
      }
    end,
  },

  -- Better code action menu
  {
    "aznhe21/actions-preview.nvim",
    keys = {
      { "<leader>ca", function() require("actions-preview").code_actions() end, mode = { "n", "v" }, desc = "Code Action Preview" },
    },
  },

  -- Glance (LSP references/definitions with better UI)
  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    keys = {
      -- Changed from g* to <leader>g* to avoid conflicts with native LSP (see lua/plugins/lsp.lua)
      { "<leader>gd", "<cmd>Glance definitions<cr>", desc = "Glance definitions" },
      { "<leader>gr", "<cmd>Glance references<cr>", desc = "Glance references" },
      { "<leader>gy", "<cmd>Glance type_definitions<cr>", desc = "Glance type definitions" },
      { "<leader>gi", "<cmd>Glance implementations<cr>", desc = "Glance implementations" },
    },
    opts = {},
  },

  -- Goto preview
  {
    "rmagatti/goto-preview",
    keys = {
      { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", desc = "Preview definition" },
      { "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>", desc = "Preview type definition" },
      { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", desc = "Preview implementation" },
      { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", desc = "Preview references" },
      { "gP", "<cmd>lua require('goto-preview').close_all_win()<cr>", desc = "Close all preview windows" },
    },
    opts = {},
  },

  -- Fidget (LSP progress)
  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  -- Dressing (better UI)
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
