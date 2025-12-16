-- ============================================================================
-- YAML and Helm Support
-- ============================================================================

return {
  -- YAML Companion (Kubernetes schemas)
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "ibhagwan/fzf-lua" }, -- Use fzf-lua via vim.ui.select
    },
    config = function()
      local cfg = require("yaml-companion").setup({
        -- Configuration options
        builtin_matchers = {
          kubernetes = { enabled = true },
          cloud_init = { enabled = true },
        },
      })
      require("lspconfig")["yamlls"].setup(cfg)
    end,
    keys = {
      { "<leader>ys", function() require("yaml-companion").open_ui_select() end, desc = "Select YAML Schema" },
    },
  },

  -- Kubectl integration
  {
    "Ramilito/kubectl.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Kubectl" },
    keys = {
      { "<leader>k", "<cmd>Kubectl<cr>", desc = "Kubectl" },
    },
    config = function()
      require("kubectl").setup()
    end,
  },

  -- Helm LSP enhanced integration
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      conceal_templates = {
        enabled = true,
      },
      indent_hints = {
        enabled = true,
        only_for_current_line = true,
      },
      action_highlight = {
        enabled = true,
      },
    },
  },

  -- Helm syntax support
  {
    "towolf/vim-helm",
    ft = "helm",
  },
}
