-- ============================================================================
-- Treesitter Extended - Additional Treesitter Features
-- ============================================================================

return {
  -- Treesitter playground (disabled - incompatible with modern treesitter)
  {
    "nvim-treesitter/playground",
    enabled = false,
    -- Requires old nvim-treesitter.configs API
    -- Use :Inspect and :InspectTree built into Neovim instead
  },

  -- Treesitter textsubjects (disabled - incompatible with modern treesitter)
  {
    "RRethy/nvim-treesitter-textsubjects",
    enabled = false,
    -- Requires nvim-treesitter.query module which no longer exists
    -- Use built-in text objects or mini.ai as alternative
  },
}
