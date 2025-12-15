-- nvim-search-and-replace: Search and replace in multiple files
-- GitHub: https://github.com/s1n7ax/nvim-search-and-replace
return {
  "s1n7ax/nvim-search-and-replace",
  event = "VeryLazy",
  config = function()
    require("nvim-search-and-replace").setup({
      -- Default behavior
      ignore = {
        "node_modules",
        ".git",
        ".gitignore",
        ".gitmodules",
        "build",
        "dist",
      },
      -- Auto-update files
      update_changes = false,
      -- Keybindings
      replace_keymap = "<leader>gr",
      replace_all_keymap = "<leader>gR",
      replace_and_save_keymap = "<leader>gu",
      replace_all_and_save_keymap = "<leader>gU",
    })

    -- Custom keybindings
    vim.keymap.set("n", "<leader>gr", function()
      require("nvim-search-and-replace").replace()
    end, { desc = "[G]lobal [R]eplace in files" })

    vim.keymap.set("n", "<leader>gR", function()
      require("nvim-search-and-replace").replace_all()
    end, { desc = "[G]lobal [R]eplace all in files" })

    vim.keymap.set("n", "<leader>gu", function()
      require("nvim-search-and-replace").replace_and_save()
    end, { desc = "[G]lobal replace and s[U]pdate" })

    vim.keymap.set("n", "<leader>gU", function()
      require("nvim-search-and-replace").replace_all_and_save()
    end, { desc = "[G]lobal replace all and [U]pdate" })
  end,
}
