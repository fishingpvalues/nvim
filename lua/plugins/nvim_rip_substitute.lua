-- nvim-rip-substitute: Modern substitute with ripgrep and modern UI
-- GitHub: https://github.com/chrisgrieser/nvim-rip-substitute
return {
  "chrisgrieser/nvim-rip-substitute",
  event = "VeryLazy",
  cmd = "RipSubstitute",
  config = function()
    require("rip-substitute").setup({
      -- Popup window configuration
      popupWin = {
        title = " Rip Substitute ",
        border = "rounded",
        winblend = 20,
        matchCountHl = "Search",
      },

      -- Prefill behavior
      prefill = {
        normal = "cword",
        visual = "selection",
        startInReplaceLineIfPrefilled = true,
      },

      -- Regex and case sensitivity
      regexOptions = {
        pcre2 = true,
        multiline = true,
        singleline = false,
        caseInsensitive = false,
      },

      -- Capture group handling
      autoBraceSimpleCaptureGroups = true,

      -- Keymaps
      keymaps = {
        confirm = "<CR>",
        abort = "q",
        toggleRegex = "<C-r>",
        toggleCase = "<C-c>",
        toggleMultiline = "<C-m>",
      },

      -- Notification settings
      notification = {
        onSuccess = true,
      },
    })

    -- Keybindings for rip-substitute
    vim.keymap.set("n", "<leader>rs", function()
      vim.cmd("RipSubstitute")
    end, { desc = "[R]ip [S]ubstitute" })

    vim.keymap.set("v", "<leader>rs", function()
      vim.cmd("RipSubstitute")
    end, { desc = "[R]ip [S]ubstitute visual" })
  end,
}
