-- arrow.nvim: Like harpoon but with different UX, single keybinding, statusline support
-- GitHub: https://github.com/otavioschwanck/arrow.nvim
return {
  "otavioschwanck/arrow.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    show_icons = true,
    leader_key = ";",
    buffer_leader_key = "m",
    separate_by_branch = false,
  },
  config = function(_, opts)
    require("arrow").setup(opts)

    -- Keybinding to open arrow menu
    vim.keymap.set("n", opts.leader_key, function()
      require("arrow.ui").openMenu()
    end, { desc = "Arrow menu" })

    -- Keybinding to add current file
    vim.keymap.set("n", "<leader>aa", function()
      require("arrow.ui").addFile()
    end, { desc = "[A]rrow [A]dd file" })

    -- Keybinding to open previous file
    vim.keymap.set("n", "<leader>ap", function()
      require("arrow.ui").openPreviousInSplit()
    end, { desc = "[A]rrow [P]revious in split" })

    -- Statusline integration for lualine (optional)
    pcall(function()
      require("lualine").setup({
        sections = {
          lualine_x = {
            function()
              return require("arrow.statusline").text()
            end,
          },
        },
      })
    end)
  end,
}
