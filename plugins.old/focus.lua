return {
  "nvim-focus/focus.nvim",
  version = false, -- or use a specific tag like "v1.0.0"
  config = function()
    require("focus").setup({
      -- Options go here. These are some common examples,
      -- you can customize them based on your preferences.
      autocmd = {
        enabled = true, -- Enable or disable the automatic focusing behavior
        -- You can specify events that trigger focus here.
        -- For example, to focus on BufWinEnter and InsertLeave
        -- events = { "BufWinEnter", "InsertLeave" },
      },
      ui = {
        -- You can customize the UI elements like borders, transparency, etc.
        -- For example, to use a different border for focused windows
        -- focused = {
        --   border = { style = "double" },
        -- },
        -- unfocused = {
        --   border = { style = "single" },
        --   opacity = 0.5, -- Make unfocused windows semi-transparent
        -- },
      },
      -- Example of setting keymaps (optional)
      -- If you want to manually toggle focus
      -- keymaps = {
      --   toggle_focus = "<leader>zf",
      -- },
    })
  end,
  -- You can also add dependencies here if focus.nvim has any specific ones
  -- dependencies = {
  --   "nvim-tree/nvim-web-devicons", -- Example dependency
  -- }
}