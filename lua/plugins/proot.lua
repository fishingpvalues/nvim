-- proot.nvim: Lightweight project navigator with telescope
-- GitHub: https://github.com/zongben/proot.nvim
return {
  "zongben/proot.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local proot = require("proot")

    proot.setup({
      opts = {
        events = {
          entered = function()
            -- Optional: close all buffers and restart LSP when switching projects
            -- vim.cmd("bufdo bd")
            -- for _, client in pairs(vim.lsp.get_clients()) do
            --   vim.lsp.stop_client(client)
            -- end
          end,
        },
      },
    })

    require("telescope").load_extension("proot")

    -- Keybindings
    vim.keymap.set("n", "<leader>pr", function()
      require("telescope").extensions.proot.open_picker()
    end, { desc = "[P]root open [P]icker" })

    vim.api.nvim_create_user_command("Proot", function()
      require("telescope").extensions.proot.open_picker()
    end, { desc = "Open proot picker" })
  end,
}
