-- spelunk.nvim: Stack-based bookmarks with friendly UI
-- GitHub: https://github.com/EvWilson/spelunk.nvim
return {
  "EvWilson/spelunk.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("spelunk").setup({
      enable_persist = true,
      orientation = "vertical",
      statusline_prefix = "🔖",
      cursor_character = ">",
      -- Auto-open UI
      auto_open = false,
      -- Default configuration
      max_bookmarks = 100,
    })

    -- Keybindings for spelunk operations
    vim.keymap.set("n", "<leader>st", function()
      require("spelunk").toggle_ui()
    end, { desc = "[S]pelunk [T]oggle UI" })

    vim.keymap.set("n", "<leader>sa", function()
      require("spelunk").add_bookmark()
    end, { desc = "[S]pelunk [A]dd bookmark" })

    vim.keymap.set("n", "<leader>sd", function()
      require("spelunk").delete_bookmark()
    end, { desc = "[S]pelunk [D]elete bookmark" })

    vim.keymap.set("n", "<leader>sn", function()
      require("spelunk").next_bookmark()
    end, { desc = "[S]pelunk [N]ext bookmark" })

    vim.keymap.set("n", "<leader>sp", function()
      require("spelunk").prev_bookmark()
    end, { desc = "[S]pelunk [P]revious bookmark" })

    vim.keymap.set("n", "<leader>sc", function()
      require("spelunk").clear_bookmarks()
    end, { desc = "[S]pelunk [C]lear all bookmarks" })

    -- Commands
    vim.api.nvim_create_user_command("SpelunkToggle", function()
      require("spelunk").toggle_ui()
    end, { desc = "Toggle spelunk UI" })

    vim.api.nvim_create_user_command("SpelunkAdd", function()
      require("spelunk").add_bookmark()
    end, { desc = "Add spelunk bookmark" })

    vim.api.nvim_create_user_command("SpelunkList", function()
      require("spelunk").toggle_ui()
    end, { desc = "List spelunk bookmarks" })
  end,
}
