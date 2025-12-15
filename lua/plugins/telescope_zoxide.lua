-- telescope-zoxide: Telescope integration for zoxide directory navigation
-- GitHub: https://github.com/jvgrootveld/telescope-zoxide
return {
  "jvgrootveld/telescope-zoxide",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("zoxide")

    -- Keybindings for zoxide
    vim.keymap.set("n", "<leader>zd", function()
      require("telescope").extensions.zoxide.list()
    end, { desc = "[Z]oxide [D]irectory" })

    -- Alternative keybindings for common patterns
    vim.keymap.set("n", "<leader>zc", function()
      require("telescope").extensions.zoxide.list({
        action = function(selection)
          vim.cmd("cd " .. selection.path)
          vim.cmd("Neotree")
        end,
      })
    end, { desc = "[Z]oxide [C]d and open tree" })
  end,
}
