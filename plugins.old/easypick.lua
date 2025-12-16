-- easypick.nvim: Create Telescope pickers from arbitrary console commands
-- GitHub: https://github.com/axkirillov/easypick.nvim
return {
  "axkirillov/easypick.nvim",
  enabled = false, -- Disabled to keep a single fuzzy finder
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local easypick = require("easypick")

    easypick.setup({
      pickers = {
        -- List all git branches
        {
          name = "git_branches",
          command = "git branch -a --format='%(refname:short)' | sed 's|remotes/||'",
          previewer = easypick.previewers.default(),
          action = function(selection)
            vim.cmd("Git checkout " .. selection)
          end,
        },

        -- List recently modified files
        {
          name = "recent_files",
          command = "fd --type f --changed-within 1d --max-results 50",
          previewer = easypick.previewers.default(),
        },

        -- Git commits
        {
          name = "git_commits",
          command = "git log --oneline --all -30",
          previewer = easypick.previewers.default(),
          action = function(selection)
            local commit = string.match(selection, "^(%w+)")
            vim.cmd("Git show " .. commit)
          end,
        },

        -- NPM scripts (if in Node project)
        {
          name = "npm_scripts",
          command = "grep -o '\"[^\"]*\":' package.json 2>/dev/null | grep -v version | sed 's/[\":]*//g'",
          previewer = easypick.previewers.default(),
          action = function(selection)
            vim.cmd("TermExec cmd='npm run " .. selection .. "'")
          end,
        },
      },
    })

    -- Keybindings for easypick pickers
    vim.keymap.set("n", "<leader>ep", function()
      vim.cmd("Easypick git_branches")
    end, { desc = "[E]asypick git branches" })

    vim.keymap.set("n", "<leader>ec", function()
      vim.cmd("Easypick git_commits")
    end, { desc = "[E]asypick git commits" })

    vim.keymap.set("n", "<leader>en", function()
      vim.cmd("Easypick npm_scripts")
    end, { desc = "[E]asypick npm scripts" })
  end,
}
