-- LSP progress status
-- GitHub: https://github.com/linrongbin16/lsp-progress.nvim
return {
  'linrongbin16/lsp-progress.nvim',
  enabled = false,
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lsp-progress').setup()

    -- Add to lualine if available
    local has_lualine, lualine = pcall(require, 'lualine')
    if has_lualine then
      local lsp_progress = require('lsp-progress')
      lualine.setup({
        sections = {
          lualine_c = {
            function()
              return lsp_progress.progress()
            end,
          },
        },
      })

      vim.api.nvim_create_augroup('lualine_augroup', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        group = 'lualine_augroup',
        pattern = 'LspProgressStatusUpdated',
        callback = lualine.refresh,
      })
    end
  end,
}
