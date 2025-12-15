-- instant.nvim: Collaborative editing in Neovim
return {
  "jbyuki/instant.nvim",
  cmd = { "InstantStartSingle", "InstantJoinSingle", "InstantStartServer", "InstantJoinServer" },
  keys = {
    { "<leader>is", desc = "Instant: Start Session" },
    { "<leader>ij", desc = "Instant: Join Session" },
  },
  init = function()
    -- Configure instant.nvim settings
    vim.g.instant_username = vim.fn.systemlist("whoami")[1] or "user"
    -- Share only files in current working directory for security
    vim.g.instant_only_cwd = true
  end,
}
