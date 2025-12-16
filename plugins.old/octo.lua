-- NOTE: Requires GITHUB_TOKEN environment variable
-- Create a personal access token at https://github.com/settings/tokens
-- with repo, workflow, and discussion scopes
return {
  "pwntester/octo.nvim",
  cond = function() return vim.env.GITHUB_TOKEN ~= nil end, -- Only load if token is set
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>oi", "<CMD>Octo issue list<CR>", desc = "List GitHub Issues" },
    { "<leader>op", "<CMD>Octo pr list<CR>", desc = "List GitHub Pull Requests" },
    { "<leader>od", "<CMD>Octo discussion list<CR>", desc = "List GitHub Discussions" },
  },
  config = function()
    require("octo").setup({
      picker = "telescope",
      enable_builtin = true,
      default_remote = { "upstream", "origin" },
      ui = {
        use_signcolumn = false,
        use_signstatus = true,
      },
      issues = {
        order_by = { field = "CREATED_AT", direction = "DESC" },
      },
      pull_requests = {
        order_by = { field = "CREATED_AT", direction = "DESC" },
      },
      mappings = {
        issue = {
          open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
          copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
        },
        pull_request = {
          open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
          copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
        },
      },
    })
  end,
}