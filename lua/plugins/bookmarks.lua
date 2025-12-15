-- bookmarks.nvim: Bookmarks with global file storage
-- GitHub: https://github.com/tomasky/bookmarks.nvim
return {
  "tomasky/bookmarks.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("bookmarks").setup({
      -- Save location for bookmarks
      save_file = vim.fn.expand("~") .. "/.bookmarks",
      -- Keywords for categorizing bookmarks
      keywords = {
        ["@t"] = "TODO",
        ["@w"] = "WARN",
        ["@f"] = "FIX",
        ["@n"] = "NOTE",
      },
      -- Sign priority for display
      sign_priority = 8,
    })

    -- Load Telescope extension
    pcall(function()
      require("telescope").load_extension("bookmarks")
    end)

    -- Keybindings for bookmark operations
    vim.keymap.set("n", "<leader>bm", function()
      require("bookmarks").bookmark_toggle()
    end, { desc = "[B]ookmark toggle [M]ark" })

    vim.keymap.set("n", "<leader>bi", function()
      require("bookmarks").bookmark_ann()
    end, { desc = "[B]ookmark add [I]nnotation" })

    vim.keymap.set("n", "<leader>bc", function()
      require("bookmarks").bookmark_clean()
    end, { desc = "[B]ookmark [C]lean all" })

    vim.keymap.set("n", "<leader>bl", function()
      require("bookmarks").bookmark_list()
    end, { desc = "[B]ookmark [L]ist" })

    vim.keymap.set("n", "<leader>bn", function()
      require("bookmarks").bookmark_next()
    end, { desc = "[B]ookmark next" })

    vim.keymap.set("n", "<leader>bp", function()
      require("bookmarks").bookmark_prev()
    end, { desc = "[B]ookmark previous" })

    vim.keymap.set("n", "<leader>bx", function()
      require("bookmarks").bookmark_clear_current_buf()
    end, { desc = "[B]ookmark clear buffer" })

    -- Telescope command for bookmarks
    vim.api.nvim_create_user_command("BookmarksList", function()
      require("telescope").extensions.bookmarks.list()
    end, { desc = "List all bookmarks with Telescope" })
  end,
}
