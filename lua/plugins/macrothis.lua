-- macrothis.nvim: Save and load macros/registers
-- GitHub: https://github.com/desdic/macrothis.nvim
return {
  "desdic/macrothis.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    -- Directory to save macros
    macroDir = vim.fn.stdpath("config") .. "/macros",
    -- Default register for operations
    default_register = "q",
    -- Group macros by filetype
    group_by_filetype = true,
  },
  keys = {
    -- Delete macro
    { "<leader>mkd", function() require("macrothis").delete() end, desc = "[M]acro [K] [D]elete" },
    -- Edit macro
    { "<leader>mke", function() require("macrothis").edit() end, desc = "[M]acro [K] [E]dit" },
    -- Load macro
    { "<leader>mkl", function() require("macrothis").load() end, desc = "[M]acro [K] [L]oad" },
    -- Save macro
    { "<leader>mks", function() require("macrothis").save() end, desc = "[M]acro [K] [S]ave" },
    -- List macros with Telescope
    { "<leader>mkf", function() require("telescope").extensions.macrothis.default() end, desc = "[M]acro [K] [F]ind" },
  },
  config = function(_, opts)
    require("macrothis").setup(opts)

    -- Load Telescope extension
    pcall(function()
      require("telescope").load_extension("macrothis")
    end)

    -- Create macros directory if it doesn't exist
    local macro_dir = opts.macroDir
    if vim.fn.isdirectory(macro_dir) == 0 then
      vim.fn.mkdir(macro_dir, "p")
    end

    -- Commands for macro management
    vim.api.nvim_create_user_command("MacroLoad", function()
      require("macrothis").load()
    end, { desc = "Load macro" })

    vim.api.nvim_create_user_command("MacroSave", function()
      require("macrothis").save()
    end, { desc = "Save macro" })

    vim.api.nvim_create_user_command("MacroDelete", function()
      require("macrothis").delete()
    end, { desc = "Delete macro" })

    vim.api.nvim_create_user_command("MacroEdit", function()
      require("macrothis").edit()
    end, { desc = "Edit macro" })
  end,
}
