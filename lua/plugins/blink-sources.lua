-- ============================================================================
-- Blink.cmp Additional Sources - Comprehensive SOTA Sources
-- ============================================================================

return {
  -- Blink conventional commits
  {
    "disrupted/blink-cmp-conventional-commits",
    ft = "gitcommit",
    dependencies = { "saghen/blink.cmp" },
    lazy = true,
  },

  -- Blink emoji source
  {
    "moyiz/blink-emoji.nvim",
    dependencies = { "saghen/blink.cmp" },
    lazy = true,
  },

  -- Blink env source
  {
    "bydlw98/blink-cmp-env",
    dependencies = { "saghen/blink.cmp" },
    lazy = true,
  },

  -- Blink git source
  {
    "Kaiser-Yang/blink-cmp-git",
    dependencies = { "saghen/blink.cmp" },
    ft = "gitcommit",
    lazy = true,
  },

  -- Blink ripgrep source (fast fuzzy completion from project)
  {
    "mikavilpas/blink-ripgrep.nvim",
    dependencies = { "saghen/blink.cmp" },
    lazy = true,
    opts = {
      prefix_min_len = 3,
      get_command = function()
        return { "rg", "--no-config", "--json" }
      end,
    },
  },

  -- Blink tmux source
  {
    "xzbdmw/blink-cmp-tmux",
    enabled = function()
      return os.getenv("TMUX") ~= nil
    end,
    dependencies = { "saghen/blink.cmp" },
    lazy = true,
  },

  -- Blink compat for compatibility with nvim-cmp sources
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
  },
}