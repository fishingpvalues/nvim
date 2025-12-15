return {
  "saghen/blink.indent",
  opts = {
    -- Default configuration with rainbow-style indent guides
    blocked = {
      buftypes = { include_defaults = true },
      filetypes = { include_defaults = true },
    },
    mappings = {
      border = "both",
      object_scope = "ii",
      object_scope_with_border = "ai",
      goto_top = "[i",
      goto_bottom = "]i",
    },
    static = {
      enabled = true,
      char = "▎",
      priority = 1,
      highlights = { "BlinkIndent" },
    },
    scope = {
      enabled = true,
      char = "▎",
      priority = 1000,
      highlights = { 
        "BlinkIndentOrange", 
        "BlinkIndentViolet", 
        "BlinkIndentBlue" 
      },
      underline = {
        enabled = false,
        highlights = { 
          "BlinkIndentOrangeUnderline", 
          "BlinkIndentVioletUnderline", 
          "BlinkIndentBlueUnderline" 
        },
      },
    },
  },
  config = function(_, opts)
    require("blink.indent").setup(opts)
  end,
}