-- fzf-lua: High-performance fuzzy finder using fzf
-- GitHub: https://github.com/ibhagwan/fzf-lua
return {
  "ibhagwan/fzf-lua",
  enabled = false, -- Disabled to avoid overlap with Telescope
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("fzf-lua").setup({
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
        cmd = "fd --type f --hidden --follow",
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

    -- Keybindings
    local fzf = require("fzf-lua")

    vim.keymap.set("n", "<leader>ff", function()
      fzf.files()
    end, { desc = "[F]zf [F]iles" })

    vim.keymap.set("n", "<leader>fg", function()
      fzf.grep()
    end, { desc = "[F]zf [G]rep" })

    vim.keymap.set("n", "<leader>fb", function()
      fzf.buffers()
    end, { desc = "[F]zf [B]uffers" })

    vim.keymap.set("n", "<leader>fh", function()
      fzf.help_tags()
    end, { desc = "[F]zf [H]elp tags" })

    vim.keymap.set("n", "<leader>fc", function()
      fzf.commands()
    end, { desc = "[F]zf [C]ommands" })

    vim.keymap.set("n", "<leader>fr", function()
      fzf.recent()
    end, { desc = "[F]zf [R]ecent" })
  end,
}
