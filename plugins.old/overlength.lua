-- overlength.nvim: Highlight lines that are too long
-- GitHub: https://github.com/lcheylus/overlength.nvim
return {
  "lcheylus/overlength.nvim",
  event = "VeryLazy",
  config = function()
    require("overlength").setup({
      enabled = true,
      colors = {
        ctermfg = nil,
        ctermbg = "darkgrey",
        fg = nil,
        bg = "#8B0000",
      },
      textwidth_mode = 2,
      default_overlength = 80,
      grace_length = 1,
      highlight_to_eol = true,
      disable_ft = {
        "qf",
        "help",
        "man",
        "checkhealth",
        "lazy",
        "packer",
        "NvimTree",
        "Telescope",
        "TelescopePrompt",
        "TelescopeResults",
        "WhichKey",
      },
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>ol", function()
      vim.cmd("OverlengthToggle")
    end, { desc = "[O]verlength toggle" })
  end,
}
