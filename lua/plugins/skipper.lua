-- skipper.nvim: Jump between functions in a file with ease
-- GitHub: https://github.com/Beargruug/skipper.nvim
return {
  "Beargruug/skipper.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("skipper").setup({})

    -- Keybinding to show functions window
    vim.keymap.set("n", "<leader>cf", function()
      vim.cmd(":ShowFunctionsWindow")
    end, { desc = "[C]ode show [F]unctions" })

    -- Alternative keybinding
    vim.keymap.set("n", "<leader>fn", function()
      vim.cmd(":ShowFunctionsWindow")
    end, { desc = "[F]unction [N]avigation" })

    -- Command to show functions
    vim.api.nvim_create_user_command("SkipperShow", function()
      vim.cmd(":ShowFunctionsWindow")
    end, { desc = "Show skipper functions window" })
  end,
}
