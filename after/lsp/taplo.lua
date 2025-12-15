-- Taplo (TOML Language Server) with schema-companion integration
return require("schema-companion").setup_client(
  require("schema-companion").adapters.taplo.setup({
    sources = {
      require("schema-companion").sources.lsp.setup(),
      require("schema-companion").sources.none.setup(),
    },
  }),
  {
    -- Your taplo language server configuration
    settings = {
      taplo = {
        schema = {
          enabled = true,
          catalog = {
            ["https://json.schemastore.org/pyproject.json"] = "pyproject.toml",
            ["https://json.schemastore.org/cargo.json"] = "Cargo.toml",
          },
        },
      },
    },
  }
)