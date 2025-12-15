-- hlsearch.nvim: Auto remove search highlight and rehighlight on n or N
-- GitHub: https://github.com/nvimdev/hlsearch.nvim
return {
  "nvimdev/hlsearch.nvim",
  enabled = false,
  event = "BufRead",
  config = function()
    require("hlsearch").setup()

    -- Optional: Clear hlsearch on escape
    vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })

    -- Optional: Clear hlsearch on moving cursor
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = function()
        if vim.fn.getcmdwintype() == "" and vim.fn.getcmdline() == "" then
          vim.cmd("nohlsearch")
        end
      end,
    })
  end,
}
