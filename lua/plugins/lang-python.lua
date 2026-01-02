-- ============================================================================
-- Python Language Support
-- ============================================================================

return {
  -- Python DAP
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = "python",
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
      require("dap-python").test_runner = "pytest"
    end,
  },

  -- Virtual environment selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "ibhagwan/fzf-lua", -- Use fzf-lua instead of Telescope
      "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    branch = "regexp",
    opts = {},
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
    },
  },
}
