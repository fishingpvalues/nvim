-- DAP UI configuration
return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local ok_nio = pcall(require, 'nio') or pcall(require, 'nvim-nio')
    local ok_dap, dap = pcall(require, 'dap')
    local ok_ui, dapui = pcall(require, 'dapui')
    if not (ok_nio and ok_dap and ok_ui) then
      vim.schedule(function()
        vim.notify('DAP UI not fully available; skipping setup', vim.log.levels.WARN)
      end)
      return
    end
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o", remove = "d", edit = "e", repl = "r", toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 }, "breakpoints", "stacks", "watches",
          },
          size = 40, position = "left",
        },
        {
          elements = { "repl", "console" },
          size = 0.25, position = "bottom",
        },
      },
      controls = {
        enabled = true, element = "repl",
        icons = { run_last = "↻", terminate = "□" },
      },
      floating = {
        max_height = nil, max_width = nil, border = "single",
        mappings = { close = { "q", "<Esc>" } },
      },
      windows = { indent = 1 },
      render = { max_value_lines = 100 },
    })
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local c = {
          blue   = '#539bf5',
          green  = '#7ee787',
          yellow = '#d29922',
          orange = '#ffa657',
          red    = '#f85149',
          violet = '#b083f0',
        }
        local set = function(group, spec) pcall(vim.api.nvim_set_hl, 0, group, spec) end
        set("DapUIScope",                   { fg = c.blue })
        set("DapUIType",                    { fg = c.orange })
        set("DapUIValue",                   { fg = c.green })
        set("DapUIModifiedValue",           { fg = c.yellow, bold = true })
        set("DapUIDecoration",              { fg = c.blue })
        set("DapUIThread",                  { fg = c.green })
        set("DapUIStoppedThread",           { fg = c.yellow })
        set("DapUISource",                  { fg = c.orange })
        set("DapUILineNumber",              { fg = c.blue })
        set("DapUIFloatBorder",             { fg = c.blue })
        set("DapUIWatchesEmpty",            { fg = c.red })
        set("DapUIWatchesValue",            { fg = c.green })
        set("DapUIWatchesError",            { fg = c.red })
        set("DapUIBreakpointsPath",         { fg = c.blue })
        set("DapUIBreakpointsInfo",         { fg = c.green })
        set("DapUIBreakpointsCurrentLine",  { fg = c.green, bold = true })
      end,
    })
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
  end,
} 
