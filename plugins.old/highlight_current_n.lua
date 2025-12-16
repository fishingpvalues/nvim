-- highlight-current-n.nvim: Highlight current match when pressing n or N
-- GitHub: https://github.com/rktjmp/highlight-current-n.nvim
return {
  "rktjmp/highlight-current-n.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("highlight_current_n").setup({
      highlight_group = "IncSearch",
    })

    -- Map n and N with proper highlighting
    local nnoremap = function(key, cmd, opts)
      vim.keymap.set("n", key, cmd, opts or {})
    end

    -- Highlight on search
    vim.api.nvim_set_keymap("c", "<CR>", "<CR><Cmd>call highlight_current_n#highlight_current_n()<CR>", { noremap = true })

    -- Navigate with n/N
    nnoremap(
      "n",
      "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>call highlight_current_n#highlight_current_n()<CR>",
      { noremap = true, silent = true, desc = "Next search with highlight" }
    )

    nnoremap(
      "N",
      "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>call highlight_current_n#highlight_current_n()<CR>",
      { noremap = true, silent = true, desc = "Previous search with highlight" }
    )

    -- Clear highlight on manual search
    vim.api.nvim_create_autocmd("CmdlineLeave", {
      pattern = "/",
      callback = function()
        pcall(function()
          require("highlight_current_n").highlight_current_n()
        end)
      end,
    })
  end,
}
