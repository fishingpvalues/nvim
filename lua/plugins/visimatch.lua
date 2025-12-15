-- visimatch.nvim: Highlight all matches of current selection in visual mode
-- GitHub: https://github.com/wurli/visimatch.nvim
return {
  "wurli/visimatch.nvim",
  event = "VeryLazy",
  config = function()
    require("visimatch").setup({
      -- Highlight group to use for matches
      hl_group = "Search",
      -- Minimum characters selected to trigger highlighting
      min_chars = 6,
      -- Maximum lines to search for performance
      max_lines = 30,
      -- Enable/disable matches even with different spacing
      strict_spacing = false,
      -- Buffer scope: "current", "filetype"
      scope = "filetype",
      -- Case sensitivity settings per filetype
      case_sensitive = {
        markdown = false,
        text = false,
        help = false,
        -- other filetypes default to case-sensitive
      },
      -- Exclude filetypes from matching
      exclude = {
        "NvimTree",
        "TelescopePrompt",
        "terminal",
      },
    })
  end,
}
