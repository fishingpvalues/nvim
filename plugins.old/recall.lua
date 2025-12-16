-- recall.nvim: Refined global marks with enhanced visibility
-- GitHub: https://github.com/fnune/recall.nvim
return {
  "fnune/recall.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("recall").setup({})

    -- Load Telescope extension
    pcall(function()
      require("telescope").load_extension("recall")
    end)

    local recall = require("recall")

    -- Keybindings for recall operations
    vim.keymap.set("n", "<leader>rm", function()
      recall.toggle()
    end, { desc = "[R]ecall toggle [M]ark" })

    vim.keymap.set("n", "<leader>rn", function()
      recall.goto_next()
    end, { desc = "[R]ecall next [M]ark" })

    vim.keymap.set("n", "<leader>rp", function()
      recall.goto_prev()
    end, { desc = "[R]ecall previous [M]ark" })

    vim.keymap.set("n", "<leader>rc", function()
      recall.clear()
    end, { desc = "[R]ecall [C]lear all marks" })

    vim.keymap.set("n", "<leader>rl", function()
      require("telescope").extensions.recall.recall()
    end, { desc = "[R]ecall [L]ist with Telescope" })

    -- Commands
    vim.api.nvim_create_user_command("RecallToggle", function()
      recall.toggle()
    end, { desc = "Toggle recall mark on current line" })

    vim.api.nvim_create_user_command("RecallNext", function()
      recall.goto_next()
    end, { desc = "Go to next recall mark" })

    vim.api.nvim_create_user_command("RecallPrev", function()
      recall.goto_prev()
    end, { desc = "Go to previous recall mark" })

    vim.api.nvim_create_user_command("RecallList", function()
      require("telescope").extensions.recall.recall()
    end, { desc = "List all recall marks" })
  end,
}
