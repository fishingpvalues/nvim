-- hml.nvim: H/M/L indicators in line numbers
-- GitHub: https://github.com/mawkler/hml.nvim
return {
  "mawkler/hml.nvim",
  event = "VeryLazy",
  config = function()
    require("hml").setup({
      signs = {
        H = "H",
        M = "M",
        L = "L",
      },
    })
  end,
}
