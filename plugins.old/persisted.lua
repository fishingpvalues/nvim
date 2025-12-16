return {
  "olimorris/persisted.nvim",
  event = "BufReadPre", -- Ensure plugin loads only when a buffer has been loaded
  opts = {
    -- Automatically start plugin on load?
    autostart = true,
    
    -- Function to determine if a session should be saved
    should_save = function()
      return true
    end,
    
    -- Directory where session files are saved
    save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
    
    -- Change the session file to match any change in cwd?
    follow_cwd = true,
    
    -- Include the git branch in session file name?
    use_git_branch = false,
    
    -- Automatically load the session for cwd on Neovim startup?
    autoload = false,
    
    -- Function to run when `autoload = true` but there is no session to load
    on_autoload_no_session = function()
      vim.notify("No existing session to load.")
    end,
    
    -- Table of dirs that plugin will start and autoload from
    allowed_dirs = {},
    
    -- Table of dirs that are ignored for starting and autoloading
    ignored_dirs = {},
    
    -- Telescope extension configuration
    telescope = {
      mappings = {
        copy_session = "<C-c>",
        change_branch = "<C-b>",
        delete_session = "<C-d>",
      },
      icons = {
        selected = " ",
        dir = " ",
        branch = " ",
      },
    },
  },
}