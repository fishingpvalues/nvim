-- barbecue.nvim: VS Code like winbar/breadcrumbs
-- GitHub: https://github.com/utilyre/barbecue.nvim
return {
  "utilyre/barbecue.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("barbecue").setup({
      show_dirname = true,
      show_basename = true,
      show_navic = true,
      show_modified = false,
      attach_navic = true,
      create_autocmd = true,
      lead_custom_section = function()
        return " "
      end,
      custom_area = function()
        return " "
      end,
      theme = "auto",
    })
  end,
}
