-- open.nvim: Open the current word with custom openers
-- GitHub: https://github.com/ofirgall/open.nvim
return {
  "ofirgall/open.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("open").setup({
      -- Open command and arguments
      open_cmd = "xdg-open",
      -- Custom openers for different patterns
      openers = {
        -- GitHub shorthand (user/repo format)
        github_user_repo = {
          match = "^[%w_%-]+/[%w_%-]+$",
          fn = function(cword)
            return "https://github.com/" .. cword
          end,
        },
        -- GitHub issues
        github_issue = {
          match = "^#%d+$",
          fn = function(cword)
            -- Extract issue number and construct GitHub issue URL
            local issue_num = cword:match("%d+")
            return "https://github.com/user/repo/issues/" .. issue_num
          end,
        },
        -- GitHub PR
        github_pr = {
          match = "^!%d+$",
          fn = function(cword)
            local pr_num = cword:match("%d+")
            return "https://github.com/user/repo/pull/" .. pr_num
          end,
        },
        -- URL openers
        http = {
          match = "^https?://",
          fn = function(url)
            return url
          end,
        },
        -- File paths
        file = {
          match = "^/[%w_%-/.]+$",
          fn = function(path)
            return path
          end,
        },
      },
      -- Disable specific openers
      blocklist = {},
      -- Fallback function when no opener matches
      fallback = function(cword)
        return "https://www.google.com/search?q=" .. cword
      end,
    })

    -- Keybinding to open word under cursor
    vim.keymap.set("n", "gx", function()
      require("open").open_cword()
    end, { desc = "Open word under cursor" })

    -- Alternative keybinding for visual selection
    vim.keymap.set("v", "gx", function()
      require("open").open_visual()
    end, { desc = "Open visual selection" })
  end,
}
