-- nvim-peekup: Dynamically interact with Vim registers
-- GitHub: https://github.com/gennaro-tedesco/nvim-peekup
return {
  "gennaro-tedesco/nvim-peekup",
  event = "VeryLazy",
  config = function()
    require("nvim-peekup.config").geometry = {
      height = 0.8,
      width = 0.9,
      x = 0.5,
      y = 0.5,
    }

    require("nvim-peekup.config").on_keystroke = {
      autoclose = true,
      delay = "300ms",
    }

    require("nvim-peekup.config").paste_on_pop = {
      paste_after = true,
      autoclose = true,
    }

    -- Keybindings for register peeking and pasting
    vim.keymap.set("n", '""', function()
      require("nvim-peekup").peekup()
    end, { desc = "Peekup registers" })

    -- Direct paste operations
    vim.keymap.set("n", "<leader>P", function()
      require("nvim-peekup").peekup_paste_before()
    end, { desc = "Peekup paste before" })

    vim.keymap.set("n", "<leader>p", function()
      require("nvim-peekup").peekup_paste_after()
    end, { desc = "Peekup paste after" })

    -- Navigation in peekup window
    vim.keymap.set("n", "<leader>pe", function()
      require("nvim-peekup").peekup_empty()
    end, { desc = "Peekup empty registers" })
  end,
}
