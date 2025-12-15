-- no-go.nvim: Verbose error handling in Go? That's a no-go from me!
-- Intelligently collapses Go error handling blocks into a single line
return {
  "TheNoeTrevino/no-go.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = "go",
  opts = {
    -- Enable the plugin behavior by default
    enabled = false,

    -- Identifiers to match in if statements (e.g., "if err != nil", "if error != nil")
    identifiers = { "err", "error" },

    -- Virtual text for collapsed error handling (Jetbrains GoLand style)
    virtual_text = {
      prefix = ": ",
      content_separator = " ",
      return_character = "󱞿 ",
      suffix = "",
    },

    -- Highlight group for the collapsed text
    highlight_group = "NoGoZone",

    -- Default highlight colors
    highlight = {
      bg = "#2A2A37",
    },

    -- Auto-update on these events
    update_events = {
      "BufEnter",
      "BufWritePost",
      "TextChanged",
      "TextChangedI",
      "InsertLeave",
    },

    -- Reveal concealed lines when cursor is on the if err != nil line
    reveal_on_cursor = true,
  },
  config = function(_, opts)
    require("no-go").setup(opts)
  end,
}