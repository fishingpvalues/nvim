-- ============================================================================
-- Mason: Package Manager for LSP, DAP, Linters, and Formatters
-- ============================================================================

return {
  -- Mason core
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
      max_concurrent_installers = 10,
    },
  },

  -- Mason LSP Config integration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        -- Go
        "gopls",
        -- Python
        "pyright",
        -- YAML
        "yamlls",
        -- Helm
        "helm_ls",
        -- Lua
        "lua_ls",
        -- Additional LSPs based on your workflow
        "jsonls",
        "bashls",
        "dockerls",
        "marksman",
      },
      automatic_installation = true,
    },
  },

  -- Mason Tool Installer (for formatters, linters, DAP)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        -- Go tools
        "gofumpt", -- Formatter
        "golangci-lint", -- Linter
        "delve", -- Debugger
        "gomodifytags",
        "impl",
        "goimports",

        -- Python tools
        "black", -- Formatter
        "isort", -- Import formatter
        "ruff", -- Linter and formatter
        "debugpy", -- Debugger

        -- YAML/Helm tools
        "yamlfmt", -- Formatter
        "yamllint", -- Linter

        -- Lua tools
        "stylua", -- Formatter
        "luacheck", -- Linter

        -- General tools
        "prettier", -- Multi-language formatter
        "shfmt", -- Shell formatter
        "shellcheck", -- Shell linter
        "markdownlint", -- Markdown linter
        "actionlint", -- GitHub Actions linter
      },
      auto_update = true,
      run_on_start = true,
    },
  },
}
