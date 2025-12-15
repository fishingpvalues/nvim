-- reactive.nvim: Set highlights based on mode/operator changes
-- GitHub: https://github.com/rasulomaroff/reactive.nvim
return {
  "rasulomaroff/reactive.nvim",
  event = "VeryLazy",
  config = function()
    require("reactive").setup({
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    })
  end,
}
