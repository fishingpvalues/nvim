-- tiny-devicons-auto-colors.nvim: Auto-update devicon colors based on colorscheme
-- GitHub: https://github.com/rachartier/tiny-devicons-auto-colors.nvim
return {
  "rachartier/tiny-devicons-auto-colors.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  enabled = false,  -- Disabled due to internal cache indexing bug in the plugin
}
