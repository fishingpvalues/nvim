-- SOTA 2025 Lualine Configuration - Bubbles Theme with Enhanced Components
-- Designed to complement barbecue (breadcrumbs) and incline (buffer info)
-- No redundant information with top bar elements
return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 900,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine" -- Optional: Copilot integration
  },
  config = function()
    -- GitHub Plus theme adapted colors for bubbles
    -- stylua: ignore
    local colors = {
      blue     = '#539bf5',
      cyan     = '#56d4dd',
      black    = '#0d1117',
      white    = '#e6edf3',
      red      = '#f85149',
      violet   = '#b083f0',
      grey     = '#21262d',
      green    = '#7ee787',
      orange   = '#ffa657',
      yellow   = '#d29922',
    }

    -- Modern bubbles theme matching GitHub Plus colorscheme
    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = 'NONE' },
      },
      insert = { a = { fg = colors.black, bg = colors.blue, gui = 'bold' } },
      visual = { a = { fg = colors.black, bg = colors.cyan, gui = 'bold' } },
      replace = { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
      command = { a = { fg = colors.black, bg = colors.yellow, gui = 'bold' } },
      inactive = {
        a = { fg = colors.white, bg = colors.grey },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = 'NONE' },
      },
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 100
      end,
      hide_in_narrow = function()
        return vim.fn.winwidth(0) > 80
      end,
    }

    -- Custom components
    local function get_short_cwd()
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
      if #cwd > 30 then
        cwd = vim.fn.pathshorten(cwd)
      end
      return '  ' .. cwd
    end

    local function get_os_icon()
      local sysname = vim.loop.os_uname().sysname
      local nerd = vim.g.have_nerd_font
      if not nerd then return '' end
      if sysname:find('Linux') then
        return ''
      elseif sysname:find('Darwin') then
        return ''
      elseif sysname:find('Windows') then
        return ''
      else
        return ''
      end
    end

    -- Enhanced LSP status showing active clients with icons
    local function get_lsp_clients()
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
      if #buf_clients == 0 then
        return ""
      end

      local names = {}
      for _, client in pairs(buf_clients) do
        if client.name ~= "copilot" and client.name ~= "null-ls" then
          table.insert(names, client.name)
        end
      end

      if #names == 0 then
        return ""
      end

      return " " .. table.concat(names, " ")
    end

    -- Time and date component
    local function get_datetime()
      return ' ' .. os.date('%H:%M') -- 24-hour format
    end

    -- Macro recording indicator
    local function show_macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then
        return ""
      else
        return "Recording @" .. recording_register
      end
    end

    -- Search count
    local function get_search_count()
      if vim.v.hlsearch == 0 then
        return ""
      end
      local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 500 })
      if not ok or result.current == 0 then
        return ""
      end
      return string.format(" %d/%d", result.current, result.total)
    end

    -- Setup auto-updating clock
    if _G.Statusline_timer == nil then
      _G.Statusline_timer = vim.loop.new_timer()
    else
      _G.Statusline_timer:stop()
    end
    _G.Statusline_timer:start(0, 60000, vim.schedule_wrap(function() -- Update every minute
      vim.api.nvim_command('redrawstatus')
    end))

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        globalstatus = true, -- Single statusline for all windows
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
        disabled_filetypes = {
          statusline = { 'dashboard', 'alpha', 'starter' },
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '' },
            right_padding = 2,
            fmt = function(str)
              return str:sub(1,1) -- Show only first letter (N, I, V, etc.)
            end
          },
        },
        lualine_b = {
          {
            'branch',
            icon = '',
            color = { fg = colors.violet, gui = 'bold' },
          },
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
          },
        },
        lualine_c = {
          {
            get_short_cwd,
            cond = conditions.hide_in_width,
            color = { fg = colors.cyan },
          },
          {
            show_macro_recording,
            color = { fg = colors.red, gui = 'bold' },
          },
          {
            get_search_count,
            cond = conditions.hide_in_narrow,
          },
        },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow },
              info = { fg = colors.cyan },
              hint = { fg = colors.green },
            },
          },
          {
            get_lsp_clients,
            cond = conditions.hide_in_width,
            color = { fg = colors.blue },
          },
          -- Optional: Add copilot status if you use it
          -- { 'copilot', show_colors = true, cond = conditions.hide_in_width },
        },
        lualine_y = {
          {
            'encoding',
            fmt = string.upper,
            cond = conditions.hide_in_width,
          },
          {
            'fileformat',
            fmt = string.upper,
            icons_enabled = true,
            symbols = {
              unix = '', -- or 'LF'
              dos = '',  -- or 'CRLF'
              mac = '',  -- or 'CR'
            },
            cond = conditions.hide_in_narrow,
          },
          {
            'filetype',
            colored = true,
            icon_only = false,
            icon = { align = 'right' },
          },
          {
            'progress',
            separator = '',
            padding = { left = 1, right = 0 },
          },
        },
        lualine_z = {
          {
            get_datetime,
            color = { fg = colors.white, bg = colors.grey, gui = 'bold' },
          },
          {
            'location',
            separator = { right = '' },
            left_padding = 2,
          },
          { get_os_icon, color = { fg = colors.white, bg = colors.violet, gui = 'bold' } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {
        'neo-tree',
        'lazy',
        'mason',
        'trouble',
        'toggleterm',
        'nvim-dap-ui',
        'quickfix',
        'fugitive',
      },
    }

    -- Clean up timer on exit
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        if _G.Statusline_timer then
          _G.Statusline_timer:stop()
          _G.Statusline_timer:close()
          _G.Statusline_timer = nil
        end
      end,
    })
  end,
}
