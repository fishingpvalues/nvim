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
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
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

  -- Helm support
  {
    "towolf/vim-helm",
    ft = "helm",
  },
}
