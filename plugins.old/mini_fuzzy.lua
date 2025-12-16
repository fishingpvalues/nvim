-- mini.fuzzy: Fuzzy matching from mini.nvim
-- GitHub: https://github.com/echasnovski/mini.nvim
return {
  "echasnovski/mini.fuzzy",
  enabled = false, -- Disabled to avoid duplicate fuzzy logic with Telescope
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.fuzzy").setup({
      -- Recency weight for fuzzy matching
      window = {
        relative = "editor",
        anchor = "NW",
        row = 1,
        col = 1,
        width = math.floor(0.9 * vim.o.columns),
        height = math.floor(0.9 * vim.o.lines),
        zindex = 100,
      },
    })

    -- Use as Telescope sorter
    require("telescope").setup({
      defaults = {
        file_sorter = require("mini.fuzzy").get_telescope_sorter(),
      },
    })
  end,
}
