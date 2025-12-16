-- navimark.nvim: Easy and powerful bookmark manager with telescope
-- GitHub: https://github.com/zongben/navimark.nvim
return {
  "zongben/navimark.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("navimark").setup({
      persist = true,
      stack_mode = "auto",
      title_pos = "above",
      -- Auto-create stacks for detected projects
      auto_create_stack = true,
      -- Maximum bookmarks per stack
      max_bookmarks = 100,
    })

    -- Load Telescope extension
    pcall(function()
      require("telescope").load_extension("navimark")
    end)

    local navimark = require("navimark")

    -- Keybindings for navimark operations
    vim.keymap.set("n", "<leader>nm", function()
      navimark.mark_toggle()
    end, { desc = "[N]avimark toggle [M]ark" })

    vim.keymap.set("n", "<leader>nn", function()
      navimark.goto_next()
    end, { desc = "[N]avimark [N]ext" })

    vim.keymap.set("n", "<leader>np", function()
      navimark.goto_prev()
    end, { desc = "[N]avimark [P]revious" })

    vim.keymap.set("n", "<leader>nd", function()
      navimark.delete_current()
    end, { desc = "[N]avimark [D]elete current" })

    vim.keymap.set("n", "<leader>nc", function()
      navimark.clear_current_stack()
    end, { desc = "[N]avimark [C]lear stack" })

    vim.keymap.set("n", "<leader>nl", function()
      require("telescope").extensions.navimark.navimark()
    end, { desc = "[N]avimark [L]ist with Telescope" })

    vim.keymap.set("n", "<leader>ns", function()
      navimark.select_stack()
    end, { desc = "[N]avimark [S]elect stack" })

    -- Commands
    vim.api.nvim_create_user_command("NavimarkToggle", function()
      navimark.mark_toggle()
    end, { desc = "Toggle navimark" })

    vim.api.nvim_create_user_command("NavimarkList", function()
      require("telescope").extensions.navimark.navimark()
    end, { desc = "List navimarks with Telescope" })

    vim.api.nvim_create_user_command("NavimarkSelectStack", function()
      navimark.select_stack()
    end, { desc = "Select navimark stack" })
  end,
}
