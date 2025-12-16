-- ============================================================================
-- LSP Configuration
-- ============================================================================

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = true,
      },
      capabilities = {},
    },
    config = function(_, opts)
      -- Setup diagnostics
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      -- Get capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, opts.capabilities or {})

      -- Common on_attach function
      local on_attach = function(client, bufnr)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- LSP keybindings
        map("n", "gd", vim.lsp.buf.definition, "Goto definition")
        map("n", "gr", vim.lsp.buf.references, "Goto references")
        map("n", "gI", vim.lsp.buf.implementation, "Goto implementation")
        map("n", "gy", vim.lsp.buf.type_definition, "Goto type definition")
        map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "gK", vim.lsp.buf.signature_help, "Signature help")
        map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>cf", vim.lsp.buf.format, "Format")

        -- Diagnostics
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostics")

        -- Inlay hints
        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true)
        end
      end

      -- Server configurations
      local servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              schemas = {
                kubernetes = "k8s-*.yaml",
                ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
                ["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
                ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
                ["https://json.schemastore.org/chart.json"] = "Chart.{yml,yaml}",
              },
              format = { enable = true },
              validate = true,
              completion = true,
              hover = true,
            },
          },
        },
        helm_ls = {
          settings = {
            ["helm-ls"] = {
              yamlls = {
                path = "yaml-language-server",
              },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
              hint = {
                enable = true,
              },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        bashls = {},
        dockerls = {},
        marksman = {},
      }

      -- Setup servers
      for server, config in pairs(servers) do
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = on_attach,
        }, config or {})

        require("lspconfig")[server].setup(server_opts)
      end
    end,
  },

  -- JSON schemas
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
