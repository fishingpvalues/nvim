-- vimade: Dim, fade, tint, animate colors in windows and buffers
-- GitHub: https://github.com/TaDaa/vimade
return {
  "TaDaa/vimade",
  event = "VeryLazy",
  config = function()
    require("vimade").setup({
      recipe = { "default", { animate = true } },
      ncmode = "buffers",
      fadelevel = 0.4,
      enablesigns = true,
      signshl = "FadeSign",
      hlgroups = {},
      basebg = nil,
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>vf", function()
      vim.cmd("VimadeFocus")
    end, { desc = "[V]imade [F]ocus" })

    vim.keymap.set("n", "<leader>vc", function()
      vim.cmd("VimadeClear")
    end, { desc = "[V]imade [C]lear" })
  end,
}
