-- log-highlight.nvim: Syntax highlighting for log files
return {
  'fei6409/log-highlight.nvim',
  enabled = false,
  opts = {
    -- File extensions to apply log filetype to
    extension = 'log',
    
    -- Specific filenames to apply log filetype to
    filename = {
      'syslog',
      'messages',
      'journal.log',
    },

    -- File path patterns to match
    pattern = {
      -- System log directories
      '%/var%/log%/.*',
      '%/tmp%/.*%.log',
      'console%-ramoops.*',
      'log.*%.txt',
      'logcat.*',
      -- Common log file patterns
      '.*%.log',
      '.*_log',
    },

    -- Custom keywords to highlight
    keyword = {
      error = { 'ERROR', 'FATAL', 'CRITICAL', 'EXCEPTION' },
      warning = { 'WARN', 'WARNING', 'DEPRECATION' },
      info = { 'INFO', 'NOTICE', 'STATUS' },
      debug = { 'DEBUG', 'TRACE', 'VERBOSE' },
      pass = { 'SUCCESS', 'PASSED', 'OK' },
    },
  },
  -- Enable syntax highlighting
  init = function()
    vim.cmd([[syntax enable]])
  end,
}
