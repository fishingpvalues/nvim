-- Show type annotations as virtual text
-- GitHub: https://github.com/jubnzv/virtual-types.nvim
return {
  'jubnzv/virtual-types.nvim',
  event = 'VeryLazy',
  dependencies = 'neovim/nvim-lspconfig',
  -- Note: virtual-types integrates via on_attach, no setup() call needed
}
