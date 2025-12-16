-- Pretty inline diagnostic display
-- GitHub: https://github.com/rachartier/tiny-inline-diagnostic.nvim
return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup({
      blend = {
        blend = 0,
      },
      options = {
        show_source = true,
        use_icons_from_diagnostic = true,
        throttle = 20,
      },
      preset = 'modern',
    })

    -- Disable virtual text to avoid conflicts
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
