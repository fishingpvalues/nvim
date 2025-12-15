-- 30+ additional text objects extending vim's default ones
-- GitHub: https://github.com/chrisgrieser/nvim-various-textobjs
return {
  'chrisgrieser/nvim-various-textobjs',
  event = 'VeryLazy',
  config = function()
    require('various-textobjs').setup({
      keymaps = {
        useDefaults = true,
      },
      disableKeymaps = {},
    })

    -- Additional keymaps for reference:
    -- al/il = (a/inner) line
    -- ai/ii = (a/inner) indentation
    -- aC/iC = (a/inner) class
    -- aF/iF = (a/inner) function
    -- ao/io = (a/inner) outside/object/
    -- aa/ia = (a/inner) argument
    -- aS/iS = (a/inner) subword/camelCase
    -- ae/ie = (a/inner) entire buffer
  end,
}
