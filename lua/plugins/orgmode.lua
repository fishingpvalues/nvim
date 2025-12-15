-- orgmode.nvim: Org-mode for Neovim with agenda, capture, and more
return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  dependencies = {
    'nvim-telescope/telescope.nvim',  -- Optional
    'nvim-orgmode/telescope-orgmode.nvim',  -- Optional
  },
  keys = {
    { '<leader>oc', desc = 'Org: Capture notes' },
    { '<leader>oa', desc = 'Org: Open agenda prompt' },
  },
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_hide_emphasis_markers = true,
      org_hide_leading_stars = true,
      org_indent_mode = 'indent',
    })

    -- Setup telescope integration if available
    pcall(function()
      require('telescope').load_extension('orgmode')
    end)
  end,
}
