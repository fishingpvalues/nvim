-- statuscol.nvim: Configurable statuscolumn with builtin segments
-- GitHub: https://github.com/luukvbaal/statuscol.nvim
return {
  "luukvbaal/statuscol.nvim",
  event = "VeryLazy",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      thousands = false,
      relculright = false,
      clickmod = "c",
      ft_ignore = { "help", "dashboard", "telescope", "neo-tree" },
      bt_ignore = { "terminal" },
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
      },
    })
  end,
}
