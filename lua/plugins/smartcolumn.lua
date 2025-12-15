-- smartcolumn.nvim: Hide colorcolumn when unneeded
-- GitHub: https://github.com/m4xshen/smartcolumn.nvim
return {
  "m4xshen/smartcolumn.nvim",
  event = "VeryLazy",
  config = function()
    require("smartcolumn").setup({
      colorcolumn = "80",
      disabled_filetypes = { "help", "text", "markdown", "dashboard", "lazy" },
      scope = "file",
      custom_colorcolumn = {
        python = "88",
        ruby = "120",
      },
      editorconfig = true,
    })
  end,
}
