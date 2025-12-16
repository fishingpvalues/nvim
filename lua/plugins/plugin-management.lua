-- ============================================================================
-- Plugin Management and Development
-- ============================================================================

return {
  -- LazyDev (already in lsp-enhancements, keeping reference)

  -- Plenary (dependency library)
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- NUI (UI library)
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  -- Guihua (UI library for ray-x plugins)
  {
    "ray-x/guihua.lua",
    build = "cd lua/fzy && make",
    lazy = true,
  },

  -- SQLite (for various plugins)
  {
    "kkharji/sqlite.lua",
    lazy = true,
  },

  -- Promises
  {
    "kevinhwang91/promise-async",
    lazy = true,
  },

  -- Hydra (create custom modes)
  {
    "nvimtools/hydra.nvim",
    lazy = true,
  },

  -- Cmd parser
  {
    "winston0410/cmd-parser.nvim",
    lazy = true,
  },

  -- Grapple (complement to harpoon)
  {
    "cbochs/grapple.nvim",
    lazy = true,
  },

  -- Fix cursor hold (for neotest and others)
  {
    "antoinemadec/FixCursorHold.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },

  -- nvim-nio (async I/O for DAP UI)
  {
    "nvim-neotest/nvim-nio",
    lazy = true,
  },
}
