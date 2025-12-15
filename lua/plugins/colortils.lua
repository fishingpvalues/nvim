-- colortils.nvim: Plugin providing utils to work with colors
-- GitHub: https://github.com/max397574/colortils.nvim
return {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function()
    require("colortils").setup({
      register = "+",
      color_preview = "█ %s",
      default_format = "hex",
      default_color = "#000000",
      mappings = {
        h = "decrease",
        l = "increase",
        H = "decrease_large",
        L = "increase_large",
      },
    })
  end,
}
