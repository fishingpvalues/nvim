-- ============================================================================
-- Smooth Cursor Movement: LuxVim/nvim-luxmotion
-- ============================================================================

return {
  "LuxVim/nvim-luxmotion",
  event = "VeryLazy",
  keys = {
    -- Toggle commands for smooth motion
    { "<leader>us", "<cmd>LuxMotionToggle<cr>", desc = "Toggle smooth motion" },
    { "<leader>uc", "<cmd>LuxMotionToggleCursor<cr>", desc = "Toggle cursor animation" },
    { "<leader>uS", "<cmd>LuxMotionToggleScroll<cr>", desc = "Toggle scroll animation" },
    { "<leader>up", "<cmd>LuxMotionPerformanceToggle<cr>", desc = "Toggle performance mode" },
  },
  opts = {
    cursor = {
      duration = 180,       -- Cursor animation duration (ms) - reduced for smoother feel
      easing = "ease-out",  -- Cursor easing function (linear, ease-out, ease-out-quad)
      enabled = true,
    },
    scroll = {
      duration = 300,       -- Scroll animation duration (ms) - reduced for smoother feel
      easing = "ease-out",  -- Scroll easing function
      enabled = true,
    },
    performance = {
      enabled = false,      -- Enable performance mode if needed for better performance
    },
    keymaps = {
      cursor = true,        -- Enable cursor motion keymaps
      scroll = true,        -- Enable scroll motion keymaps
    },
  },
}