-- nvim-macros: Easy way to save and load macros with backup and formatting
-- GitHub: https://github.com/kr40/nvim-macros
return {
  "kr40/nvim-macros",
  event = "VeryLazy",
  config = function()
    require("nvim-macros").setup({
      -- Path to store macros in JSON format
      json_file_path = vim.fn.stdpath("config") .. "/macros.json",
      -- Default register to use for macro operations
      default_macro_register = "q",
    })

    -- Keybindings for macro operations
    vim.keymap.set("n", "<leader>ms", function()
      require("nvim-macros").save()
    end, { desc = "[M]acro [S]ave to file" })

    vim.keymap.set("n", "<leader>ml", function()
      require("nvim-macros").load()
    end, { desc = "[M]acro [L]oad from file" })

    vim.keymap.set("n", "<leader>mL", function()
      require("nvim-macros").loadAndApply()
    end, { desc = "[M]acro [L]oad and apply" })

    vim.keymap.set("n", "<leader>md", function()
      require("nvim-macros").deleteFromFile()
    end, { desc = "[M]acro [D]elete from file" })

    vim.keymap.set("n", "<leader>mr", function()
      require("nvim-macros").renameInFile()
    end, { desc = "[M]acro [R]ename in file" })

    vim.keymap.set("n", "<leader>mv", function()
      require("nvim-macros").viewMacros()
    end, { desc = "[M]acro [V]iew all" })

    -- Commands
    vim.api.nvim_create_user_command("MacroSaveToFile", function()
      require("nvim-macros").save()
    end, { desc = "Save macro to file" })

    vim.api.nvim_create_user_command("MacroLoadFromFile", function()
      require("nvim-macros").load()
    end, { desc = "Load macro from file" })

    vim.api.nvim_create_user_command("MacroViewAll", function()
      require("nvim-macros").viewMacros()
    end, { desc = "View all saved macros" })

    -- Create macros directory and file if they don't exist
    local macro_dir = vim.fn.stdpath("config")
    local macro_file = macro_dir .. "/macros.json"
    if vim.fn.filereadable(macro_file) == 0 then
      local f = io.open(macro_file, "w")
      if f then
        f:write("{}\n")
        f:close()
      end
    end

    -- Create backup directory
    local backup_dir = vim.fn.expand("~") .. "/.config/nvim/macro_backups"
    if vim.fn.isdirectory(backup_dir) == 0 then
      vim.fn.mkdir(backup_dir, "p")
    end
  end,
}
