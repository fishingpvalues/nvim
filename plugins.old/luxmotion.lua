-- nvim-luxmotion: Smooth cursor movement and scrolling animations
return {
  "LuxVim/nvim-luxmotion",
  config = function()
    require("luxmotion").setup({
      cursor = {
        duration = 250,       -- Cursor animation duration (ms)
        easing = "ease-out",  -- Cursor easing function
        enabled = true,
      },
      scroll = {
        duration = 400,       -- Scroll animation duration (ms)
        easing = "ease-out",  -- Scroll easing function
        enabled = true,
      },
      performance = {
        enabled = false,      -- Enable performance mode
      },
      keymaps = {
        cursor = true,        -- Enable cursor motion keymaps
        scroll = true,        -- Enable scroll motion keymaps
      },
    })
  end,
}