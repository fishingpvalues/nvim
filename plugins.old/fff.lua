-- fff.nvim: Freakin fast fuzzy file finder with Rust backend
return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    -- Download prebuild binary or build from source using rustup
    require("fff.download").download_or_build_binary()
  end,
  lazy = false, -- Plugin initializes itself lazily
  opts = {
    debug = {
      enabled = true,     -- Enable during beta for collaboration
      show_scores = true, -- Help optimize scoring system
    },
    layout = {
      height = 0.8,
      width = 0.8,
      prompt_position = 'bottom',
      preview_position = 'right',
      preview_size = 0.5,
    },
    preview = {
      enabled = true,
      max_size = 10 * 1024 * 1024, -- 10MB max file size
      line_numbers = false,
      wrap_lines = false,
      show_file_info = true,
    },
    frecency = {
      enabled = true,
    },
  },
  keys = {
    {
      "ff", -- Banger keybinding for file picker
      function() require('fff').find_files() end,
      desc = 'FFFind files',
    },
    {
      "<leader>ff",
      function() require('fff').find_files() end,
      desc = 'FFFind files',
    },
    {
      "<leader>fg",
      function() require('fff').find_in_git_root() end,
      desc = 'FFFind in git root',
    },
  },
}