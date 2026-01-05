-- ============================================================================
-- UI Enhancements - Visual Improvements
-- ============================================================================

return {
  -- Dropbar (winbar with breadcrumbs) - SOTA
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>wp", function() require("dropbar.api").pick() end, desc = "Winbar Pick" },
    },
    opts = {
      bar = {
        enable = function(buf, win)
          return vim.fn.win_gettype(win) == ""
            and vim.wo[win].winbar == ""
            and vim.bo[buf].bt == ""
            and (vim.bo[buf].ft == "markdown" or (buf and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == ""))
        end,
      },
    },
  },

  -- Barbecue (VS Code like winbar) - Alternative to dropbar
  {
    "utilyre/barbecue.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = false, -- Disabled by default, enable if you prefer over dropbar
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = "auto",
      attach_navic = false,
      show_dirname = true,
      show_basename = true,
      show_modified = false,
    },
  },

  -- Incline (floating statusline per window) - SOTA
  {
    "b0o/incline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
      },
      hide = {
        cursorline = false,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return {
          { icon, guifg = color },
          { " " },
          { filename },
        }
      end,
    },
  },

  -- Modicator (mode-based cursor color)
  {
    "mawkler/modicator.nvim",
    event = "ModeChanged",
    opts = {
      show_warnings = false,
      highlights = {
        defaults = {
          bold = true,
        },
      },
    },
  },

  -- Deadcolumn (show colorcolumn dynamically)
  {
    "Bekaboo/deadcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      scope = "line",
      modes = { "i", "ic", "ix", "R", "Rc", "Rx", "Rv", "Rvx" },
      blending = {
        threshold = 0.75,
        colorcode = "#000000",
        hlgroup = { "Normal", "bg" },
      },
      warning = {
        alpha = 0.4,
        offset = 0,
        colorcode = "#FF0000",
        hlgroup = { "Error", "bg" },
      },
    },
  },

  -- Smartcolumn (dynamic colorcolumn)
  {
    "m4xshen/smartcolumn.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      colorcolumn = "120",
      disabled_filetypes = {
        "help",
        "text",
        "markdown",
        "dashboard",
        "lazy",
        "mason",
      },
      custom_colorcolumn = {
        go = "100",
        python = "88",
      },
    },
  },

  -- Satellite (scrollbar)
  {
    "lewis6991/satellite.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      current_only = false,
      winblend = 50,
      zindex = 40,
      excluded_filetypes = {},
      width = 2,
      handlers = {
        cursor = {
          enable = true,
        },
        search = {
          enable = true,
        },
        diagnostic = {
          enable = true,
        },
        gitsigns = {
          enable = true,
        },
        marks = {
          enable = true,
          show_builtins = false,
        },
      },
    },
  },

  -- Statuscol (status column)
  {
    "luukvbaal/statuscol.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      }
    end,
  },

  -- Noline (statusline framework - disabled, already using lualine)
  {
    "neur1n/noline.nvim",
    enabled = false,
    -- This is a minimal statusline framework requiring custom components
    -- Already using lualine.nvim which is more feature-complete
  },

  -- Vimade (dim inactive windows) - Disabled due to compatibility issues
  {
    "TaDaa/vimade",
    enabled = false,
    -- Error: E716: Key not present in Dictionary: "__recipe"
    -- Consider using alternatives like 'nvim-focus' or 'focus.nvim' instead
  },

  -- No neck pain (center buffer)
  {
    "shortcuts/no-neck-pain.nvim",
    cmd = { "NoNeckPain", "NoNeckPainResize" },
    keys = {
      { "<leader>np", "<cmd>NoNeckPain<cr>", desc = "No Neck Pain" },
    },
    opts = {
      width = 120,
      autocmds = {
        enableOnVimEnter = false,
      },
    },
  },

  -- Focus (auto-resize splits)
  {
    "nvim-focus/focus.nvim",
    event = "WinEnter",
    keys = {
      { "<leader>tf", "<cmd>FocusToggle<cr>", desc = "Toggle Focus" },
    },
    opts = {
      enable = true,
      commands = true,
      autoresize = {
        enable = true,
        width = 120,
        height = 30,
      },
    },
  },

  -- Winshift (rearrange windows)
  {
    "sindrets/winshift.nvim",
    cmd = "WinShift",
    keys = {
      { "<leader>wm", "<cmd>WinShift<cr>", desc = "WinShift Mode" },
    },
    opts = {},
  },

  -- Transparent (transparent background)
  {
    "xiyaowong/transparent.nvim",
    cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
    keys = {
      { "<leader>ut", "<cmd>TransparentToggle<cr>", desc = "Toggle Transparency" },
    },
    opts = {
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
    },
  },

  -- Range highlight
  {
    "winston0410/range-highlight.nvim",
    dependencies = { "winston0410/cmd-parser.nvim" },
    event = "CmdlineEnter",
    opts = {},
  },

  -- CCC (color picker)
  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable" },
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
      { "<leader>cc", "<cmd>CccConvert<cr>", desc = "Color Convert" },
    },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },

  -- Agrolens (code lens)
  {
    "desdic/agrolens.nvim",
    event = "LspAttach",
    opts = {
      enable = true,
      debug = false,
    },
  },

  -- Themery (theme switcher)
  {
    "zaldih/themery.nvim",
    cmd = "Themery",
    keys = {
      { "<leader>th", "<cmd>Themery<cr>", desc = "Theme Switcher" },
    },
    opts = {
      themes = {
        "github_plus",
        "tokyonight",
        "catppuccin",
        "nord",
      },
    },
  },
}
