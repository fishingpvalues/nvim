-- Auto-stop idle LSP servers to save RAM
-- GitHub: https://github.com/zeioth/garbage-day.nvim
return {
  'zeioth/garbage-day.nvim',
  dependencies = 'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  opts = {
    aggressive_mode = false,
    excluded_lsp_clients = {},
    grace_period = 900, -- 15 minutes
    wakeup_delay = 0,
    notifications = false,
    retries = 3,
    timeout = 1000,
  },
}
