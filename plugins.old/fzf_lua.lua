-- fzf-lua: High-performance fuzzy finder using fzf
-- GitHub: https://github.com/ibhagwan/fzf-lua
return {
  "ibhagwan/fzf-lua",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local fzf = require("fzf-lua")

    -- Choose file command dynamically (fd -> rg -> git)
    local files_cmd
    if vim.fn.executable('fd') == 1 then
      files_cmd = "fd --type f --hidden --follow --exclude .git"
    elseif vim.fn.executable('rg') == 1 then
      files_cmd = "rg --files --hidden -g '!.git'"
    else
      files_cmd = nil -- let fzf-lua choose (git ls-files or fallback)
    end

    fzf.setup({
      -- Window options
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          hidden = "nohidden",
          layout = "flex",
          flip_columns = 120,
        },
      },

      -- Default command options
      fzf_opts = {
        ["--ansi"] = true,
        ["--info"] = "inline",
        ["--height"] = "100%",
        ["--layout"] = "reverse",
        ["--multi"] = true,
        ["--preview-window"] = "right:50%",
      },

      -- Key mappings
      keymap = {
        fzf = {
          ["ctrl-z"] = "abort",
          ["ctrl-u"] = "unix-line-discard",
          ["ctrl-f"] = "half-page-down",
          ["ctrl-b"] = "half-page-up",
          ["ctrl-a"] = "toggle-all",
          ["ctrl-d"] = "delete-char",
          ["ctrl-w"] = "backward-kill-word",
        },
      },

      -- Files picker
      files = {
        cmd = files_cmd,
        actions = {
          ["default"] = require("fzf-lua.actions").file_edit,
          ["ctrl-v"] = require("fzf-lua.actions").file_vsplit,
          ["ctrl-x"] = require("fzf-lua.actions").file_split,
          ["ctrl-t"] = require("fzf-lua.actions").file_tabedit,
        },
      },

      -- Grep picker
      grep = {
        rg_opts = "--color=always --smart-case --hidden --follow -g '!.git'",
      },

      -- LSP
      lsp = {
        code_actions = {
          previewer = "codeaction_native",
        },
      },
    })

    -- Telescope-like keybindings
    vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect Picker' })
    vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch Recent Files' })
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', fzf.grep_curbuf, { desc = '[/] Search in current buffer' })
    vim.keymap.set('n', '<leader>s/', function()
      fzf.live_grep({ grep_open_files = true })
    end, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>sn', function()
      fzf.files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
