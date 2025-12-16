-- grug-far.nvim: Buffer-based live search and replace with rg power
-- GitHub: https://github.com/MagicDuck/grug-far.nvim
return {
  "MagicDuck/grug-far.nvim",
  event = "VeryLazy",
  config = function()
    require("grug-far").setup({
      -- Set localleader if not already configured
      -- vim.g.maplocalleader = " ",

      -- Window configuration
      windowCreationCommand = "split",
      minSearchInputLength = 2,
      maxSearchMatches = 100000,

      -- Behavior
      wrap = false,
      startInInsertMode = false,
      transientShowErrorsInline = true,

      -- Buffer name
      bufferName = "grug-far",

      -- Signs and icons
      icons = {
        enabled = true,
      },

      -- History
      historySize = 50,

      -- Shortcuts
      prefills = {
        -- cword = false,
        -- cWORD = false,
        -- c = false,
        -- s = false,
      },
    })

    -- Keybindings for grug-far
    vim.keymap.set("n", "<leader>gf", function()
      require("grug-far").open()
    end, { desc = "[G]rug [F]ar open" })

    vim.keymap.set("v", "<leader>gf", function()
      require("grug-far").open({ prefill = { search = true } })
    end, { desc = "[G]rug [F]ar with selection" })

    -- Sync local keybindings in grug-far buffer
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "grug-far",
      callback = function()
        -- Map localleader + t to toggle
        vim.keymap.set("n", "<localleader>t", require("grug-far").toggleShowCommand, {
          buffer = true,
          desc = "Toggle command",
        })
      end,
    })

    -- Command
    vim.api.nvim_create_user_command("GrugFar", function()
      require("grug-far").open()
    end, { desc = "Open grug-far search and replace" })
  end,
}
