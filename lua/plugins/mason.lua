-- mason.nvim: SOTA LSP/DAP/linter/formatter manager with UI
return {
  "williamboman/mason.nvim",
  priority = 1000,
  lazy = false,
  build = ":MasonUpdate", -- Optional: updates registry on install
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        width = 0.8,
        height = 0.8,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    -- Setup mason-lspconfig after mason is ready
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        -- Systems Programming (SOTA 2025)
        "gopls",             -- Go (SOTA) - configured in lspconfig
        "rust_analyzer",     -- Rust (managed by rustaceanvim, but installed via mason)
        "clangd",            -- C/C++ (SOTA) - configured in lspconfig
        "zls",               -- Zig (modern systems language) - configured in lspconfig

        -- Web Development (SOTA 2025)
        "ts_ls",             -- TypeScript (configured in lspconfig)
        "html",              -- HTML LSP - configured in lspconfig
        "cssls",             -- CSS LSP - configured in lspconfig
        "tailwindcss",       -- Tailwind CSS - configured in lspconfig
        "svelte",            -- Svelte - configured in lspconfig
        "vuels",             -- Vue - configured in lspconfig
        "emmet_language_server", -- Emmet - configured in lspconfig
        "graphql",           -- GraphQL - configured in lspconfig

        -- Scripting & Dynamic Languages (SOTA 2025)
        "lua_ls",            -- Lua for Neovim config - configured in lspconfig
        "pyright",           -- Python (SOTA type checker) - configured in lspconfig
        "ruff_lsp",          -- Ruff LSP (SOTA Python linter) - configured in lspconfig
        "yamlls",            -- YAML - configured in lspconfig
        "bashls",            -- Bash - configured in lspconfig

        -- Data & Config Languages
        "jsonls",            -- JSON LSP - configured in lspconfig
        "taplo",             -- TOML - configured in lspconfig
        "lemminx",           -- XML - configured in lspconfig

        -- DevOps & Infrastructure (SOTA 2025)
        "dockerls",          -- Dockerfiles - configured in lspconfig
        "docker_compose_language_service", -- Docker Compose - configured in lspconfig
        "terraformls",       -- Terraform - configured in lspconfig
        "helm_ls",           -- Helm - configured in lspconfig
        "ansiblels",         -- Ansible - configured in lspconfig

        -- Protocols & APIs
        "buf_ls",            -- Protocol Buffers - configured in lspconfig

        -- Documentation & Markup
        "marksman",          -- Markdown - configured in lspconfig

        -- Database
        "sqlls",             -- SQL - configured in lspconfig
      }
    })
  end,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      config = function()
        require("mason-tool-installer").setup({
          ensure_installed = {
            -- Go tools (SOTA 2025)
            "gofumpt",       -- Stricter Go formatter
            "goimports",     -- Import management
            "golines",       -- Long line formatter
            "gotests",       -- Test generation
            "impl",          -- Interface implementation generator
            "dlv",           -- Delve debugger
            "staticcheck",   -- Advanced static analysis
            "golangci-lint", -- Comprehensive linter (SOTA)
            "golangci-lint-rs", -- Rust version of golangci-lint (faster)
            "gotestsum",     -- Enhanced test runner
            "govulncheck",   -- Vulnerability checker
            "gomodifytags",  -- Struct tag modifier
            "gosec",         -- Go security linter
            "errcheck",      -- Check for unchecked errors

            -- Python tools (SOTA 2025)
            "black",         -- Python formatter (SOTA)
            "isort",         -- Python import sorting
            "ruff",          -- Fast Python linter/formatter (SOTA 2025)
            "mypy",          -- Python type checker (SOTA)
            "bandit",        -- Python security linter
            "pylint",        -- Python linter

            -- JavaScript/TypeScript tools (SOTA 2025)
            "biome",         -- Modern JS/TS formatter/linter (SOTA 2025)
            "prettier",      -- JS/TS/JSON/YAML/Markdown (alternative)
            "eslint_d",      -- JS/TS (faster than eslint)

            -- Rust tools (2025 stack)
            "rust-analyzer", -- Rust LSP (already covered by rust_analyzer)
            "rustfmt",       -- Rust formatter
            "cargo",         -- Rust package manager
            "clippy",        -- Rust linter

            -- Lua tools (SOTA 2025)
            "stylua",        -- Lua formatter (SOTA)
            "luacheck",      -- Lua linter

            -- Shell tools (SOTA 2025)
            "shfmt",         -- Shell formatter (SOTA)
            "shellcheck",    -- Shell linter (SOTA)

            -- DevOps & Infrastructure tools (SOTA 2025)
            "hadolint",      -- Dockerfile linter (SOTA)
            "yamlfmt",       -- YAML formatter (SOTA)
            "yamllint",      -- YAML linter (SOTA)
            "tflint",        -- Terraform linter (SOTA)
            "ansible-lint",  -- Ansible linter (SOTA)

            -- YAML/Config tools (SOTA 2025)
            "jq",            -- JSON processor
            "yq",            -- YAML processor (SOTA)

            -- Data & Config tools (SOTA 2025)
            "taplo",         -- TOML formatter/linter (SOTA)
            "sqlfluff",      -- SQL formatter/linter (SOTA)

            -- Web & Markup tools (SOTA 2025)
            "markdownlint",  -- Markdown linter (SOTA)

            -- Protocol & API tools (SOTA 2025)
            "buf",           -- Protocol Buffers (SOTA)

            -- Newer language tools (2025 stack)
            "zig",           -- Zig compiler/formatter
            "dart",          -- Dart/Flutter tools
            "csharp-ls",     -- C# LSP
          },
          auto_update = true,
          run_on_start = false,
        })
      end,
    },
  },
} 