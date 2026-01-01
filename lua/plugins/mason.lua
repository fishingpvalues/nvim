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
        -- YAML/Helm/Kubernetes
        "yamlls",
        "helm_ls",
        -- Lua
        "lua_ls",
        -- Web/JavaScript/TypeScript
        "jsonls",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "eslint",
        -- Shell/DevOps
        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "terraformls",
        -- Documentation
        "marksman",
        -- Database
        "sqlls",
        -- Rust (if needed)
        "rust_analyzer",
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
        "goimports", -- Import formatter
        "goimports-reviser", -- Import organizer
        "golines", -- Line length formatter
        "golangci-lint", -- Linter
        "golangci-lint-langserver", -- Linter LSP
        "delve", -- Debugger
        "gomodifytags", -- Struct tags
        "impl", -- Interface implementation
        "gotests", -- Test generation
        "iferr", -- Error handling

        -- Python tools
        "black", -- Formatter
        "isort", -- Import formatter
        "ruff", -- Linter and formatter (SOTA)
        "pylint", -- Linter
        "mypy", -- Type checker
        "debugpy", -- Debugger

        -- YAML/Helm/Kubernetes tools
        "yamlfmt", -- Formatter
        "yamllint", -- Linter
        "helm-ls", -- Helm LSP

        -- Lua tools
        "stylua", -- Formatter
        "luacheck", -- Linter
        "selene", -- Linter (alternative)

        -- Shell/Bash tools
        "shfmt", -- Formatter
        "shellcheck", -- Linter
        "bash-language-server", -- LSP

        -- Web/JavaScript/TypeScript tools
        "prettier", -- Multi-language formatter
        "prettierd", -- Faster prettier daemon
        "eslint_d", -- Fast ESLint
        "js-debug-adapter", -- Debugger

        -- Markdown tools
        "markdownlint", -- Linter
        "markdownlint-cli2", -- CLI
        "markdown-toc", -- TOC generator

        -- Docker tools
        "hadolint", -- Dockerfile linter

        -- Terraform tools
        "tflint", -- Linter
        "terraform-ls", -- LSP

        -- SQL tools
        "sqlfluff", -- Linter
        "sql-formatter", -- Formatter

        -- JSON tools
        "jsonlint", -- Linter
        "fixjson", -- Formatter

        -- GitHub Actions
        "actionlint", -- Linter

        -- Rust (if needed)
        "rustfmt", -- Formatter
        "rust-analyzer", -- LSP
      },
      auto_update = true,
      run_on_start = true,
    },
  },
}
