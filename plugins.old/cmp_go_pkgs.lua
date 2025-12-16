-- Completion source for Go package names
-- GitHub: https://github.com/Yu-Leo/cmp-go-pkgs
return {
  'Yu-Leo/cmp-go-pkgs',
  ft = 'go',
  event = 'VeryLazy',
  config = function()
    local cmp = require('cmp')
    cmp.register_source('cmp_go_pkgs', require('cmp_go_pkgs').new())
  end,
}
