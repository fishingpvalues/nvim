-- git-prompt-string-lualine.nvim: Git info in lualine statusline
-- GitHub: https://github.com/mikesmithgh/git-prompt-string-lualine.nvim
return {
  "mikesmithgh/git-prompt-string-lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lualine/lualine.nvim",
  },
  config = function()
    -- Component is registered automatically
    -- Add 'git_prompt_string' to your lualine configuration sections
  end,
}
