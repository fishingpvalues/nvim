-- karen-yank.nvim: More intentional register handling with delete, cut and yank mappings
-- GitHub: https://github.com/tenxsoydev/karen-yank.nvim
return {
  "tenxsoydev/karen-yank.nvim",
  event = "VeryLazy",
  config = function()
    require("karen-yank").setup({
      -- Main key for cut operations (default: 'y' - use with delete keys like 'd')
      karen_key = "y",

      -- Enable number registers for tracking delete/cut history
      register_number = {
        enabled = true,
        -- Prevent populating multiple number registers with the same content
        deduplicate = true,
      },

      -- Keymaps configuration
      mappings = {
        -- Enable/disable specific keymaps
        enabled = true,
        -- Disabled mappings (e.g., 's' and 'S' are often used by surround plugins)
        disable = { "s", "S" },
        -- Invert functionality (turn cut into delete, delete into cut)
        invert = false,
      },

      -- Whether to use system clipboard
      use_system_clipboard = true,
    })

    -- Optional: Additional keybindings for clarity
    vim.keymap.set("n", "<leader>yd", function()
      vim.cmd('normal! yd')
    end, { desc = "Cut (yank delete) motion" })

    vim.keymap.set("n", "<leader>yD", function()
      vim.cmd('normal! yD')
    end, { desc = "Cut (yank delete) to end of line" })

    vim.keymap.set("n", "<leader>yc", function()
      vim.cmd('normal! yc')
    end, { desc = "Cut (yank change) motion" })

    vim.keymap.set("n", "<leader>yC", function()
      vim.cmd('normal! yC')
    end, { desc = "Cut (yank change) to end of line" })

    -- Regular delete/yank still work as expected
    vim.keymap.set("n", "<leader>dd", function()
      vim.cmd('normal! dd')
    end, { desc = "Delete line" })

    vim.keymap.set("n", "<leader>yy", function()
      vim.cmd('normal! yy')
    end, { desc = "Yank line" })
  end,
}
