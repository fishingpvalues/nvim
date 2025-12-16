-- deadcolumn.nvim: Dynamic colorcolumn display
-- GitHub: https://github.com/Bekaboo/deadcolumn.nvim
return {
  "Bekaboo/deadcolumn.nvim",
  event = "VeryLazy",
  config = function()
    require("deadcolumn").setup({
      scope = "line",
      modes = function(mode)
        return mode:find("^[iRss\x13]") ~= nil
      end,
      blending = {
        threshold = 0.5,
        colorcode = "#000000",
        hlgroup = { "Normal", "bg" },
      },
    })

    -- Set colorcolumn for specific filetypes
    vim.api.nvim_create_augroup("deadcolumn_ft", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = "deadcolumn_ft",
      pattern = { "python", "lua", "javascript" },
      callback = function()
        vim.opt_local.colorcolumn = "80"
      end,
    })
  end,
}
