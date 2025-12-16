-- ============================================================================
-- Blink.cmp Additional Sources - All Sources from new.txt
-- ============================================================================

return {
  -- Blink conventional commits
  {
    "Davincible/blink-cmp-conventional-commits",
    ft = "gitcommit",
    dependencies = { "saghen/blink.cmp" },
    opts = {},
  },

  -- Blink emoji source
  {
    "moyiz/blink-emoji.nvim",
    dependencies = { "saghen/blink.cmp" },
    opts = {},
  },

  -- Blink env source
  {
    "xzbdmw/blink-cmp-env",
    dependencies = { "saghen/blink.cmp" },
    opts = {},
  },

  -- Blink git source
  {
    "Snikimonkd/blink-cmp-git",
    dependencies = { "saghen/blink.cmp" },
    ft = "gitcommit",
    opts = {},
  },

  -- Blink LaTeX source
  {
    "mikavilpas/blink-ripgrep.nvim",
    dependencies = { "saghen/blink.cmp" },
    opts = {},
  },

  -- Blink tmux source
  {
    "xzbdmw/blink-cmp-tmux",
    enabled = function()
      return os.getenv("TMUX") ~= nil
    end,
    dependencies = { "saghen/blink.cmp" },
    opts = {},
  },
}
