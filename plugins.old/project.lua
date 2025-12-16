-- Project management with auto-detection
-- GitHub: https://github.com/ahmedkhalf/project.nvim
return {
  'ahmedkhalf/project.nvim',
  event = 'VeryLazy',
  config = function()
    require('project_nvim').setup({
      -- Manual mode doesn't automatically change your root directory, allowing you
      -- to operate per-project without changing directories. When you explicitly define
      -- a root then nvim only changes the root when you explicitly open that project
      manual_mode = false,

      -- Methods of detecting root directories. **"lsp"** calls the lspconfig server,
      -- **"pattern"** uses vim.fn.getcwd, **"import"** loads any directory into the
      -- session. add one in each string type { } construct.
      detection_methods = { 'lsp', 'pattern' },

      -- All the patterns used to detect root directories, when **"pattern"** is in
      -- detection_methods
      patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'go.mod', 'Cargo.toml' },

      -- Table of lsp clients to ignore by name
      -- eg: { "efm", ... }
      ignore_lsp = {},

      -- Don't calculate root dir on specific directories
      -- type: string[]
      -- default: { "/tmp", "/dev", "/var/folders/*" }
      exclude_dirs = {},

      -- Show hidden files in telescope
      show_hidden = false,

      -- When set to false, you will get a message when project.nvim changes your
      -- directory.
      silent_chdir = true,

      -- this is the function that gets called when the working directory is changed
      on_change = nil,
    })

    local telescope = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pp', function()
      telescope.find_files({ cwd = require('project_nvim.project').get_project_root() })
    end, { desc = '[P]roject [P]roject files' })

    -- Only set projects keymap if the function exists
    if telescope.projects then
      vim.keymap.set('n', '<leader>ps', function()
        telescope.projects()
      end, { desc = '[P]roject [S]witch' })
    end
  end,
}
