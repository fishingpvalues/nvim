-- lspmark.nvim: Sane project-wise bookmarks with persistent LSP storage
-- GitHub: https://github.com/tristone13th/lspmark.nvim
return {
  "tristone13th/lspmark.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("lspmark").setup({})

    -- Load Telescope extension
    pcall(function()
      require("telescope").load_extension("lspmark")
    end)

    local lspmark = require("lspmark")

    -- Keybindings for lspmark operations
    vim.keymap.set("n", "<leader>lm", function()
      lspmark.toggle_bookmark()
    end, { desc = "[L]SPMark toggle [M]ark" })

    vim.keymap.set("n", "<leader>le", function()
      lspmark.modify_comment()
    end, { desc = "[L]SPMark [E]dit comment" })

    vim.keymap.set("n", "<leader>ls", function()
      lspmark.show_comment()
    end, { desc = "[L]SPMark [S]how comment" })

    vim.keymap.set("n", "<leader>ld", function()
      lspmark.delete_line()
    end, { desc = "[L]SPMark [D]elete line bookmark" })

    vim.keymap.set("n", "<leader>lp", function()
      lspmark.paste_text()
    end, { desc = "[L]SPMark [P]aste text" })

    vim.keymap.set("v", "<leader>ld", function()
      lspmark.delete_visual_selection()
    end, { desc = "[L]SPMark [D]elete visual selection" })

    vim.keymap.set("n", "<leader>ll", function()
      require("telescope").extensions.lspmark.marks()
    end, { desc = "[L]SPMark [L]ist with Telescope" })

    -- Auto-load bookmarks when changing directories
    vim.api.nvim_create_autocmd("DirChanged", {
      callback = function()
        pcall(function()
          require("lspmark.bookmarks").load_bookmarks()
        end)
      end,
      pattern = "*",
    })

    -- Commands
    vim.api.nvim_create_user_command("LSPMarkToggle", function()
      lspmark.toggle_bookmark()
    end, { desc = "Toggle LSPMark bookmark" })

    vim.api.nvim_create_user_command("LSPMarkList", function()
      require("telescope").extensions.lspmark.marks()
    end, { desc = "List LSPMark bookmarks" })
  end,
}
