-- ============================================================================
-- Mini.nvim Modules - Comprehensive Collection
-- ============================================================================

return {
  -- Mini.nvim (multiple modules)
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      -- Mini.ai (already configured separately but included here)
      -- Mini.bufremove (already configured separately)

      -- Mini.clue - Show next key clues
      require("mini.clue").setup({
        triggers = {
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-x>" },
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },
        clues = {
          require("mini.clue").gen_clues.builtin_completion(),
          require("mini.clue").gen_clues.g(),
          require("mini.clue").gen_clues.marks(),
          require("mini.clue").gen_clues.registers(),
          require("mini.clue").gen_clues.windows(),
          require("mini.clue").gen_clues.z(),
        },
        window = {
          delay = 200,
          config = {
            width = "auto",
            border = "rounded",
          },
        },
      })

      -- Mini.surround
      require("mini.surround").setup({
        mappings = {
          add = "gsa",
          delete = "gsd",
          find = "gsf",
          find_left = "gsF",
          highlight = "gsh",
          replace = "gsr",
          update_n_lines = "gsn",
        },
      })

      -- Mini.fuzzy - Fuzzy matching
      require("mini.fuzzy").setup()

      -- Mini.snippets
      require("mini.snippets").setup({
        snippets = {
          require("mini.snippets").gen_loader.from_file("~/.config/nvim/snippets"),
        },
      })
    end,
  },
}
