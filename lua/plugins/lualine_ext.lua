-- lualine-ext.nvim: Extensions for lualine.nvim
-- GitHub: https://github.com/Mr-LLLLL/lualine-ext.nvim
return {
  "Mr-LLLLL/lualine-ext.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-lualine/lualine.nvim",
  },
  config = function()
    require("lualine-ext").setup({
      separator = {
        left = "",
        right = "",
      },
      init_tab_project = {
        disabled = false,
        tabs_color = {
          inactive = {
            fg = "#9da9a0",
            bg = "#4f5b58",
          },
        },
      },
      init_lsp = {
        disabled = false,
      },
      init_tab_date = true,
    })
  end,
}
