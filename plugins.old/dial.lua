return {
  "monaqa/dial.nvim",
  keys = {
    { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement" },
    { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, desc = "Increment globally" },
    { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, desc = "Decrement globally" },
    { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = "x", desc = "Increment in visual" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = "x", desc = "Decrement in visual" },
    { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "x", desc = "Increment globally in visual" },
    { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "x", desc = "Decrement globally in visual" },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group{
      -- default augends used when no group name is specified
      default = {
        augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
        augend.constant.alias.bool,    -- boolean value (true <-> false)
        augend.constant.alias.alpha,   -- lowercase alphabet letter (word)
        augend.constant.alias.Alpha,   -- uppercase alphabet letter (word)
        augend.semver.alias.semver,  -- semantic version (1.0.0, 1.1.0, etc.)
      },
      
      -- augends used for visual mode only
      only_in_visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
      
      -- augends for specific file types
      typescript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new{ elements = {"let", "const"} },
      },
      
      javascript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new{ elements = {"let", "const"} },
      },
      
      python = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new{ elements = {"True", "False"} },
      },
      
      css = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.hexcolor.new{
          case = "lower",
        },
      },
      
      json = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
      },
      
      yaml = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
      },
      
      markdown = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y-%m-%d"],
      },
    }
  end,
}