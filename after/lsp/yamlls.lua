-- YAML Language Server with schema-companion integration
return require("schema-companion").setup_client(
  require("schema-companion").adapters.yamlls.setup({
    sources = {
      require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
      require("schema-companion").sources.lsp.setup(),
      require("schema-companion").sources.schemas.setup({
        {
          name = "Kubernetes master",
          uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
        },
      }),
    },
  }),
  {
    -- Your yaml language server configuration
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://json.schemastore.org/docker-compose.yml"] = "/docker-compose*.yml",
        },
        validate = true,
        completion = true,
        hover = true,
      },
    },
  }
)