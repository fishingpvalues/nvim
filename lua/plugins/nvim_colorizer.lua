-- nvim-colorizer.lua: High-performance color highlighter
-- GitHub: https://github.com/catgoose/nvim-colorizer.lua
return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        names = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
        tailwind = false,
      },
    })
  end,
}
