-- range-highlight.nvim: Highlight ranges in command mode
-- GitHub: https://github.com/winston0410/range-highlight.nvim
return {
  "winston0410/range-highlight.nvim",
  event = "CmdlineEnter",
  config = function()
    require("range-highlight").setup({
      highlight = {
        group = "Visual",
        priority = 10,
        to_eol = false,
      },
      excluded = {
        cmd = {},
      },
      debounce = {
        wait = 100,
      },
    })
  end,
}
