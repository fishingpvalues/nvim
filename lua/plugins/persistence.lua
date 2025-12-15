return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- or "BufRead" to load immediately
  config = function()
    require("persistence").setup {
      -- Customize options here, for example:
      -- dir = vim.fn.expand("~/.local/state/nvim/sessions/"), -- Directory where sessions are saved
      -- options = { "buffers", "curdir", "tabpages", "winsize" }, -- What to save
      -- -- Restore session on startup (if there's a last session)
      -- autosave = true,
      -- autoclean = true, -- remove unused session files
      -- -- exclude_dirs = {}, -- directories to exclude from session saving
      -- -- exclude_files = {}, -- file patterns to exclude
    }

    -- Optional: Keymaps for persistence.nvim
    vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore last session" })
    vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
    vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't save current session" })
    vim.keymap.set("n", "<leader>qr", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
    vim.keymap.set("n", "<leader>qw", function() require("persistence").save() end, { desc = "Save current session" })
  end,
}
