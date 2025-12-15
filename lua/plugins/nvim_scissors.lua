-- nvim-scissors: Automagical snippet creation and editing
-- GitHub: https://github.com/chrisgrieser/nvim-scissors
return {
  "chrisgrieser/nvim-scissors",
  event = "VeryLazy",
  cmd = { "ScissorsAddNewSnippet", "ScissorsEditSnippet" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    -- Create snippet directory if needed
    local snippet_dir = vim.fn.stdpath("config") .. "/snippets"
    if vim.fn.isdirectory(snippet_dir) == 0 then
      vim.fn.mkdir(snippet_dir, "p")
    end

    -- Keybindings for snippet creation and editing
    vim.keymap.set("n", "<leader>se", function()
      require("scissors").editSnippet()
    end, { desc = "[S]nippet [E]dit existing" })

    vim.keymap.set({ "n", "x" }, "<leader>sa", function()
      require("scissors").addNewSnippet()
    end, { desc = "[S]nippet [A]dd new" })
  end,
}
