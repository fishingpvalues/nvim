-- ============================================================================
-- Development Tools - GitHub, SSH, Kubernetes, etc.
-- ============================================================================

return {
  -- Octo (GitHub integration)
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>O", "<cmd>Octo<cr>", desc = "Octo" },
      { "<leader>Oi", "<cmd>Octo issue list<cr>", desc = "List Issues" },
      { "<leader>Op", "<cmd>Octo pr list<cr>", desc = "List PRs" },
    },
    opts = {
      picker = "fzf-lua",
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
  },

  -- Remote SSH
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "ibhagwan/fzf-lua",
    },
    cmd = { "RemoteStart", "RemoteInfo", "RemoteCleanup", "RemoteLog" },
    keys = {
      { "<leader>rc", "<cmd>RemoteStart<cr>", desc = "Remote Connect" },
      { "<leader>ri", "<cmd>RemoteInfo<cr>", desc = "Remote Info" },
    },
    opts = {},
  },

  -- Netman (remote file editing)
  {
    "miversen33/netman.nvim",
    cmd = "Nread",
    keys = {
      { "<leader>rn", "<cmd>Nread<cr>", desc = "Netman Read" },
    },
    opts = {},
  },

  -- Kubernetes (already in lang-yaml but more comprehensive here)
  {
    "Ramilito/kubectl.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Kubectl" },
    keys = {
      { "<leader>k", "<cmd>Kubectl<cr>", desc = "Kubectl" },
    },
    config = function()
      require("kubectl").setup()
    end,
  },

  -- DBee (database client)
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    cmd = { "Dbee" },
    keys = {
      { "<leader>db", "<cmd>Dbee<cr>", desc = "Database Client" },
    },
    opts = {},
  },

  -- Navigator (tmux/kitty/wezterm integration)
  {
    "numToStr/Navigator.nvim",
    keys = {
      { "<C-h>", "<cmd>NavigatorLeft<cr>", mode = { "n", "t" }, desc = "Navigate Left" },
      { "<C-j>", "<cmd>NavigatorDown<cr>", mode = { "n", "t" }, desc = "Navigate Down" },
      { "<C-k>", "<cmd>NavigatorUp<cr>", mode = { "n", "t" }, desc = "Navigate Up" },
      { "<C-l>", "<cmd>NavigatorRight<cr>", mode = { "n", "t" }, desc = "Navigate Right" },
    },
    opts = {},
  },

  -- Open (open files with system default)
  {
    "ofirgall/open.nvim",
    keys = {
      { "gx", function() require("open").open_cword() end, desc = "Open under cursor" },
      { "gx", function() require("open").open_visual() end, mode = "v", desc = "Open selection" },
    },
    opts = {},
  },

  -- Sort
  {
    "sQVe/sort.nvim",
    cmd = "Sort",
    keys = {
      { "<leader>so", "<cmd>Sort<cr>", mode = "v", desc = "Sort" },
    },
    opts = {},
  },

  -- Persisted (session management - alternative)
  {
    "olimorris/persisted.nvim",
    lazy = false,
    opts = {
      save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
      use_git_branch = true,
      autoload = false,
    },
  },

  -- Schema companion (better JSON/YAML schemas)
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml", "yaml.docker-compose" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },
}
