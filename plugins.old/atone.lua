return {
  "XXiaoA/atone.nvim",
  cmd = "Atone",
  opts = {
    layout = {
      -- Position of the undo tree
      direction = "left",
      -- Width of the tree window (0.25 = 25% of screen width)
      width = 0.25,
    },
    -- Diff configuration for node under cursor
    diff_cur_node = {
      enabled = true,
      -- Height of diff window as percentage of tree window height
      split_percent = 0.3,
    },
    -- Auto-attach to buffers
    auto_attach = {
      enabled = true,
      -- Exclude these filetypes from auto-attach
      excluded_ft = { "oil", "neo-tree", "NvimTree", "toggleterm" },
    },
    -- Keymap configuration
    keymaps = {
      tree = {
        quit = { "<C-c>", "q" },
        next_node = "j", -- supports v:count
        pre_node = "k", -- supports v:count
        undo_to = "<CR>",
        help = { "?", "g?" },
      },
      auto_diff = {
        quit = { "<C-c>", "q" },
        help = { "?", "g?" },
      },
      help = {
        quit_help = { "<C-c>", "q" },
      },
    },
    -- UI configuration
    ui = {
      border = "rounded", -- matches your other plugins
      compact = false, -- use full graph style for better visibility
    },
  },
  config = function(_, opts)
    require("atone").setup(opts)
    
    -- Add keymaps for quick access
    vim.keymap.set("n", "<leader>u", "<cmd>Atone toggle<CR>", { desc = "Toggle Undo Tree" })
    vim.keymap.set("n", "<leader>U", "<cmd>Atone<CR>", { desc = "Open Undo Tree" })
    
    -- Add to which-key
    local wk = require("which-key")
    wk.add({
      { "<leader>u", desc = "Undo Tree" },
      { "<leader>U", desc = "Open Undo Tree" },
    })
  end,
}