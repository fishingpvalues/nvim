-- ============================================================================
-- NEOVIM INIT.LUA - SOTA Configuration
-- Theme: GitHub Plus (github-plus.nvim)
-- Package Manager: lazy.nvim
-- Cross-platform: Linux & macOS
-- ============================================================================

-- Set leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup({
  spec = {
    -- Import all plugin specs from lua/plugins/
    { import = "plugins" },
  },
  defaults = {
    lazy = false, -- Plugins are not lazy-loaded by default
    version = false, -- Always use latest git commit
  },
  install = {
    missing = true, -- Install missing plugins on startup
    colorscheme = { "github_plus" }, -- Try to load colorscheme when installing
  },
  checker = {
    enabled = true, -- Check for plugin updates
    notify = false, -- Don't notify about updates
    frequency = 3600, -- Check every hour
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- Disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      lazy = " ",
    },
  },
})

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")
