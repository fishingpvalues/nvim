-- Enhanced SOTA dashboard-nvim configuration for 2025
-- Features: widescreen layout, Git integration, ASCII art, shortcuts for tools
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',  -- Icons
    'MaximilianLloyd/ascii.nvim',   -- ASCII art (SOTA 2025 add-on)
  },
  config = function()
    local ascii = require('ascii')
    local dashboard = require('dashboard')

    -- Set up dashboard window to use full width
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dashboard',
      callback = function()
        vim.opt_local.winhighlight = 'Normal:DashboardNormal'
        vim.cmd('wincmd |')  -- Maximize width
      end,
    })

    local opts = {
      theme = 'hyper',
      disable_move = false,
      shortcut_type = 'letter',
      shuffle_letter = false,  -- Ordered for consistency
      letter_list = 'abcdefghilmnopqrstuvwxyz',  -- Skip j/k for hjkl
      change_to_vcs_root = true,  -- Git root for MRU/projects
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
      config = {
        header = vim.schedule_wrap(function()
          -- Random ASCII art (e.g., cat for CachyOS vibe)
          local art = ascii.art({
            choices = { 'cat', 'github_octocat' },  -- Add more from ascii.nvim
            opts = { random = true }
          })
          if art then
            return art
          else
            -- Fallback header if ascii art fails
            return {
              '                               ',
              '            ╭─────╮            ',
              '         ╭────╯     ╰────╮     ',
              '      ╭────╯    ┌─┐    ╰────╮  ',
              '   ╭────╯    ┌──╯ ╰──┐    ╰─── ',
              '  │    ╭─────┤       ├─────╮   ',
              '  │    │     └───────┘     │   ',
              '  │    │                   │   ',
              '  │    │  N E O V I M      │   ',
              '  │    │                   │   ',
              '  │    │                   │   ',
              '  │    ╰───────────────────╯   ',
              '   ╰───────────────────────╯    ',
              '                               ',
            }
          end
        end),
        center = {
          width = 100,  -- Increase width for full screen usage
        },
        week_header = {
          enable = true,
          concat = ' | CachyOS Neovim ' .. vim.version().major .. '.0',
          append = { { desc = 'GitHub Dark + Transparent.nvim' } },
        },
        shortcut = {
          { desc = 'Yazi (Files)', group = 'DashboardShortCutIcon', key = 'f', action = 'Yazi' },
          { desc = 'Lazy (Plugins)', group = 'DashboardShortCutIcon', key = 'p', action = 'Lazy' },
          { desc = 'Mason (LSP)', group = 'DashboardShortCutIcon', key = 'm', action = 'Mason' },
          { desc = 'Recent Files', group = 'DashboardShortCutIcon', key = 'r', action = 'Telescope oldfiles cwd_only=true' },
          { desc = 'Recent Folders', group = 'DashboardShortCutIcon', key = 'd', action = 'Telescope find_dirs' },
          { desc = 'New File', group = 'DashboardShortCutIcon', key = 'n', action = 'enew' },
          { desc = 'Quit', group = 'DashboardShortCutIcon', key = 'q', action = 'qa' },
        },
        packages = { enable = true },  -- Plugin count
        project = {
          enable = true,
          limit = 8,  -- Wide screen: more projects
          icon = '󰊢 ',  -- Git icon
          label = ' Projects (Git Roots)',
          action = 'Telescope find_files cwd=',
        },
        mru = {
          enable = true,
          limit = 10,
          icon = ' ',
          label = ' Recent Files',
          cwd_only = true,  -- Latest in current dir
        },
        footer = { 'Neovim ' .. vim.version().major .. ' | Enjoy coding! 🚀' },
      },
    }
    dashboard.setup(opts)
  end,
}