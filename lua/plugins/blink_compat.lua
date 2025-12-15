-- Compatibility layer for using nvim-cmp sources on blink.cmp
-- GitHub: https://github.com/saghen/blink.compat
return {
  'saghen/blink.compat',
  event = 'VeryLazy',
  dependencies = { 'saghen/blink.cmp' },
}
