-- telescope-egrepify.nvim: Better rg flags for live_grep
-- GitHub: https://github.com/fdschmidt93/telescope-egrepify.nvim
return {
  "fdschmidt93/telescope-egrepify.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        egrepify = {
          -- enable AND, NOT operators
          AND = true,
          permutations = false,
          lnum = true,
          lnum_hl = "EgrepifyLnum",
          col = false,
          col_hl = "EgrepifyCol",
          title = true,
          filename_hl = "EgrepifyFile",
          show_line = false,
          show_context = false,
          -- Treesitter highlighting
          results_ts_hl = { telescope = true, wintype = "split" },
        },
      },
    })

    require("telescope").load_extension("egrepify")

    -- Keybindings
    vim.keymap.set("n", "<leader>eg", function()
      require("telescope").extensions.egrepify.egrepify()
    end, { desc = "[E]grepify [G]rep" })
  end,
}
