-- colorful-menu.nvim: Colorize completion menu using Tree-sitter
-- GitHub: https://github.com/xzbdmw/colorful-menu.nvim
return {
  "xzbdmw/colorful-menu.nvim",
  event = "VeryLazy",
  config = function()
    require("colorful-menu").setup({
      fallback = true,
      fallback_highlight = "@variable",
      max_width = 60,
      -- Language-specific settings
      lua_ls = {
        arguments_hl = "@comment",
      },
      gopls = {
        align_type_to_right = true,
        preserve_type_when_truncate = true,
      },
    })
  end,
}
