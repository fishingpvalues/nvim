-- Go debugging with DAP
-- DISABLED: Has git clone issues, use delve directly with nvim-dap instead
return {
  'leolucas/dap-go',
  enabled = false,
  config = function()
    require('dap-go').setup({
      dap_configurations = {
        {
          type = 'go',
          name = 'Attach',
          mode = 'local',
          request = 'attach',
          port = 38697,
          host = '127.0.0.1',
          substitutePath = {},
        },
        {
          type = 'go',
          name = 'Debug',
          mode = 'debug',
          request = 'launch',
          program = '${fileDirname}',
          env = {},
          args = {},
        },
      },
      delve = {
        initialize_timeout_sec = 20,
        port = '38697',
        args = {},
        build_flags = {},
        detached = vim.fn.has('win32') == 0,
      },
    })
  end,
}
