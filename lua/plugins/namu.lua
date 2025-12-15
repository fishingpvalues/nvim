-- namu.nvim: Flexible fuzzy picker and LSP symbol navigator
-- GitHub: https://github.com/bassamsdata/namu.nvim
return {
  "bassamsdata/namu.nvim",
  enabled = false, -- Disabled to avoid fuzzy-finder overlap
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("namu").setup({
      global = {
        layout_config = {
          height = 0.8,
          width = 0.8,
        },
      },

      namu_symbols = {
        enable = true,
        options = {
          -- Symbol filtering by kind
          show_kinds = true,
          -- Display mode: "icon" or "raw"
          display = "icon",
          -- Window position
          position = "center",
        },
      },
    })

    -- Keybindings for namu
    vim.keymap.set("n", "<leader>ss", function()
      vim.cmd("Namu symbols")
    end, { desc = "[S]ymbols [S]earch" })

    vim.keymap.set("n", "<leader>sw", function()
      vim.cmd("Namu workspace")
    end, { desc = "[S]ymbols [W]orkspace" })

    vim.keymap.set("n", "<leader>sl", function()
      vim.cmd("Namu lsp")
    end, { desc = "[S]ymbols [L]SP" })

    -- Commands
    vim.api.nvim_create_user_command("NamuSymbols", function()
      vim.cmd("Namu symbols")
    end, { desc = "Namu buffer symbols" })

    vim.api.nvim_create_user_command("NamuWorkspace", function()
      vim.cmd("Namu workspace")
    end, { desc = "Namu workspace symbols" })
  end,
}
