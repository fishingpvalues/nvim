return {
  "sindrets/winshift.nvim",
  tag = "v1.1.0", -- Or latest version/commit
  config = function()
    require("winshift").setup({
      -- Your configuration options here
      -- For example:
      winshift_modes = {
        -- 'default' mode does not have a keymap, this is just to show how to override a mode keymap
        default = {
          enable = true, -- can be disabled with `enable = false`
          kind = "ratio", -- 'ratio' (default) or 'fixed'
          -- Optionally, you can set a custom keymap for the default mode
          -- keymap = "<leader>ws",
        },
        -- Example of a custom mode
        big_left = {
          enable = true,
          kind = "fixed",
          -- Define the size and position for this mode
          -- This example makes the window take 70% of the screen width on the left
          size = {
            width = 0.7,
            height = 1,
          },
          position = {
            row = 0,
            col = 0,
          },
          -- Keymap for this mode
          keymap = "<leader>wl",
        },
      },
      -- You can also configure other settings like messages and keybinds
      messages = {
        enabled = true,
        -- The timeout in ms for how long a message is displayed
        -- Set to `nil` to disable timeout (message will stay until another one is displayed)
        timeout = 1000,
      },
      keybinds = {
        -- Keybind to toggle winshift
        toggle_shift = "<leader>wS",
        -- Keybinds for specific directions
        shift_left = "<leader>h",
        shift_right = "<leader>l",
        shift_up = "<leader>k",
        shift_down = "<leader>j",
        -- Keybind to cycle through modes
        cycle_modes = "<leader>wm",
      },
      -- You can also set custom ratios for the 'ratio' kind
      ratios = {
        -- Example: default ratios
        { 1, 1 }, -- Full screen
        { 0.5, 1 }, -- Half screen
        { 0.75, 1 }, -- Three quarters screen
      },
    })
  end,
}
