-- ============================================================================
-- Productivity Tools - Macros, Snippets, Templates
-- ============================================================================

return {
  -- Macrothis (macro manager)
  {
    "kr40/nvim-macros",
    cmd = { "MacroSave", "MacroYank", "MacroSelect", "MacroDelete" },
    keys = {
      { "<leader>ms", "<cmd>MacroSave<cr>", desc = "Save Macro" },
      { "<leader>my", "<cmd>MacroYank<cr>", desc = "Yank Macro" },
      { "<leader>ml", "<cmd>MacroSelect<cr>", desc = "Load Macro" },
      { "<leader>md", "<cmd>MacroDelete<cr>", desc = "Delete Macro" },
    },
    opts = {
      json_file_path = vim.fs.normalize(vim.fn.stdpath("config") .. "/macros.json"),
      default_macro_register = "q",
    },
  },

  -- Debugprint (insert debug print statements)
  {
    "andrewferrier/debugprint.nvim",
    keys = {
      { "g?p", mode = "n" },
      { "g?P", mode = "n" },
      { "g?v", mode = { "n", "x" } },
      { "g?V", mode = { "n", "x" } },
      { "g?o", mode = "n" },
      { "g?O", mode = "n" },
    },
    opts = {
      keymaps = {
        normal = {
          plain_below = "g?p",
          plain_above = "g?P",
          variable_below = "g?v",
          variable_above = "g?V",
          variable_below_alwaysprompt = nil,
          variable_above_alwaysprompt = nil,
          textobj_below = "g?o",
          textobj_above = "g?O",
          toggle_comment_debug_prints = nil,
          delete_debug_prints = nil,
        },
        visual = {
          variable_below = "g?v",
          variable_above = "g?V",
        },
      },
      commands = {
        toggle_comment_debug_prints = "ToggleCommentDebugPrints",
        delete_debug_prints = "DeleteDebugPrints",
      },
    },
  },

  -- Esqueleto (file templates)
  {
    "cvigilv/esqueleto.nvim",
    opts = {
      directories = { vim.fn.stdpath("config") .. "/skeletons" },
    },
  },

  -- Scissors (snippet manager)
  {
    "chrisgrieser/nvim-scissors",
    dependencies = { "nvim-telescope/telescope.nvim", "L3MON4D3/LuaSnip" },
    keys = {
      { "<leader>se", function() require("scissors").editSnippet() end, desc = "Edit Snippet" },
      { "<leader>sa", function() require("scissors").addNewSnippet() end, mode = { "n", "x" }, desc = "Add Snippet" },
    },
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
  },

  -- Snippet converter
  {
    "smjonas/snippet-converter.nvim",
    cmd = "ConvertSnippets",
    opts = {
      templates = {
        {
          sources = {
            ultisnips = {
              vim.fn.stdpath("config") .. "/UltiSnips",
            },
          },
          output = {
            vscode_luasnip = {
              vim.fn.stdpath("config") .. "/snippets",
            },
          },
        },
      },
    },
  },

  -- Easypick (custom pickers)
  {
    "axkirillov/easypick.nvim",
    dependencies = { "ibhagwan/fzf-lua" },
    cmd = "Easypick",
    keys = {
      { "<leader>fp", "<cmd>Easypick<cr>", desc = "Easy Pick" },
    },
    opts = function()
      local easypick = require("easypick")
      return {
        pickers = {
          {
            name = "ls",
            command = "ls",
            previewer = easypick.previewers.default(),
          },
          {
            name = "changed_files",
            command = "git diff --name-only $(git merge-base HEAD origin/main)",
            previewer = easypick.previewers.file_diff(),
          },
        },
      }
    end,
  },

  -- Carbon (code screenshots)
  {
    "ellisonleao/carbon-now.nvim",
    cmd = "CarbonNow",
    keys = {
      { "<leader>cn", ":CarbonNow<cr>", mode = "v", desc = "Carbon Now" },
    },
    opts = {
      base_url = "https://carbon.now.sh/",
      options = {
        theme = "monokai",
        font_family = "Hack",
        font_size = "18px",
      },
    },
  },

  -- Rayso (code screenshots)
  {
    "TobinPalmer/rayso.nvim",
    cmd = { "Rayso" },
    keys = {
      { "<leader>rs", mode = "v", desc = "Ray.so" },
    },
    opts = {
      open_cmd = "chromium",
      options = {
        theme = "midnight",
      },
    },
  },

  -- Venn (draw diagrams)
  {
    "jbyuki/venn.nvim",
    keys = {
      { "<leader>v", "<cmd>lua require('venn').toggle()<cr>", desc = "Toggle Venn" },
    },
  },

  -- Track (track time on projects)
  {
    "dharmx/track.nvim",
    cmd = { "Track", "TrackResetCurrent", "TrackResetAll" },
    keys = {
      { "<leader>Tt", "<cmd>Track<cr>", desc = "Track Time" },
    },
    opts = {},
  },

  -- Gesture (mouse gestures)
  {
    "notomo/gesture.nvim",
    event = "VeryLazy",
    config = function()
      local gesture = require("gesture")
      gesture.register({
        name = "scroll to bottom",
        inputs = { gesture.down() },
        action = "normal! G",
      })
      gesture.register({
        name = "scroll to top",
        inputs = { gesture.up() },
        action = "normal! gg",
      })
    end,
  },
}
