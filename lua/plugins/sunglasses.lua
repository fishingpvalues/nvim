-- sunglasses.nvim: Dynamic colorscheme/highlight adjuster on window switching
-- GitHub: https://github.com/miversen33/sunglasses.nvim
return {
  "miversen33/sunglasses.nvim",
  event = "VeryLazy",
  config = function()
    require("sunglasses").setup({
      filter_percent = 0.65,
      filter_type = "SHADE",
      excluded_filetypes = {
        "dashboard",
        "telescope",
        "neo-tree",
        "netrw",
        "help",
        "qf",
      },
    })
  end,
}
