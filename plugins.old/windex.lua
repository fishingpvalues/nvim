return {
  "declancm/windex.nvim",
  config = function()
    require("windex").setup({
      default_keymaps = true,
      extra_keymaps = true,
      save_buffers = true,
      warnings = true,
    })
  end,
}