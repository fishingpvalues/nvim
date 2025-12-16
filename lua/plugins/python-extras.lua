-- ============================================================================
-- Python Extra Tools
-- ============================================================================

return {
  -- Swenv (virtual environment switcher - alternative to venv-selector)
  {
    "AckslD/swenv.nvim",
    ft = "python",
    keys = {
      { "<leader>pv", function() require("swenv.api").pick_venv() end, desc = "Pick Python Venv", ft = "python" },
    },
    opts = {
      post_set_venv = function()
        vim.cmd("LspRestart")
      end,
    },
  },
}
