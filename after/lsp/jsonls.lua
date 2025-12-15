-- JSON Language Server with schema-companion integration
return require("schema-companion").setup_client(
  require("schema-companion").adapters.jsonls.setup({
    sources = {
      require("schema-companion").sources.lsp.setup(),
      require("schema-companion").sources.none.setup(),
    },
  }),
  {
    -- Your json language server configuration
    settings = {
      json = {
        schemas = {
          ["https://json.schemastore.org/package.json"] = "/package.json",
          ["https://json.schemastore.org/tsconfig.json"] = "/tsconfig.json",
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
        validate = { enable = true },
      },
    },
  }
)