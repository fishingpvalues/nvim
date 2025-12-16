-- agrolens.nvim: Navigate via Tree-sitter nodes using Telescope or FZF
-- GitHub: https://github.com/desdic/agrolens.nvim
return {
  "desdic/agrolens.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("agrolens").setup({
      debug = false,
      same_type = true,
      include_hidden_buffers = false,
      disable_indentation = false,
      aliases = {
        functions = "query=functions",
        classes = "query=classes",
        variables = "query=variables",
        types = "query=types",
        imports = "query=imports",
      },
    })

    -- Load Telescope extension
    pcall(function()
      require("telescope").load_extension("agrolens")
    end)

    -- Optional: Add key mappings for common queries
    vim.keymap.set("n", "<leader>tf", "<Cmd>Telescope agrolens query=functions<CR>", { desc = "[T]elescope [F]unctions" })
    vim.keymap.set("n", "<leader>tc", "<Cmd>Telescope agrolens query=classes<CR>", { desc = "[T]elescope [C]lasses" })
    vim.keymap.set("n", "<leader>tv", "<Cmd>Telescope agrolens query=variables<CR>", { desc = "[T]elescope [V]ariables" })
    vim.keymap.set("n", "<leader>tt", "<Cmd>Telescope agrolens query=types<CR>", { desc = "[T]elescope [T]ypes" })
  end,
}
