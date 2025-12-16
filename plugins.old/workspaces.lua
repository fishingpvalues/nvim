-- workspaces.nvim: Manage workspace directories
-- GitHub: https://github.com/natecraddock/workspaces.nvim
return {
  "natecraddock/workspaces.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("workspaces").setup({
      -- Path where workspace data is stored
      path = vim.fn.expand("~/.local/share/nvim/workspaces"),
      -- How to change directory: "global" (:cd), "local" (:lcd), "tab" (:tcd)
      cd_type = "global",
      -- Sorting options
      sort = true,
      mru_sort = true,
      -- Auto-open workspace when opening Neovim in that directory
      auto_open = false,
      -- Auto-activate when changing directories outside the plugin
      auto_dir = false,
      -- Display notifications
      notify_info = true,
      -- Hooks for workspace operations
      hooks = {
        open = {},
        open_pre = {},
      },
    })

    require("telescope").load_extension("workspaces")

    -- Keybindings
    vim.keymap.set("n", "<leader>wo", function()
      require("telescope").extensions.workspaces.workspaces()
    end, { desc = "[W]orkspaces [O]pen" })

    vim.keymap.set("n", "<leader>wa", function()
      vim.cmd("WorkspacesAdd")
    end, { desc = "[W]orkspaces [A]dd" })
  end,
}
