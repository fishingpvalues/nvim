-- GitHub Plus theme setup (SOTA GitHub-inspired theme)
return {
  'tommarien/github-plus.nvim',
  lazy = false,
  priority = 1000,
  version = '*',
  --- @--- GithubPlus.Overrides
  opts = {
    transparent = true,
    styles = {
      comments = {
        italic = true,  -- Italic comments
      },
    },
  },
  config = function(_, opts)
    require('github_plus').setup(opts)
    vim.cmd('colorscheme github_plus')
  end
} 