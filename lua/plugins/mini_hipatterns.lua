-- mini.hipatterns: Highlight patterns in text
-- GitHub: https://github.com/echasnovski/mini.nvim (mini.hipatterns module)
return {
  "echasnovski/mini.hipatterns",
  version = false,
  event = "VeryLazy",
  config = function()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        -- Highlight hex colors
        hex_color = hipatterns.gen_highlighter.hex_color({ priority = 200 }),
        -- Highlight TODO/FIXME/HACK comments
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      },
    })
  end,
}
