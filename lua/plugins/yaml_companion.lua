-- yaml-companion.nvim: Get, set and autodetect YAML schemas in your buffers
return {
  "someone-stole-my-name/yaml-companion.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
  },
  ft = { "yaml" },
  opts = {
    builtin_matchers = {
      kubernetes = { enabled = true },
      docker_compose = { enabled = true },
      procfile = { enabled = true },
      github_workflows = { enabled = true },
      github_actions = { enabled = true },
      kustomization = { enabled = true },
    },
    schemas = {
      {
        name = "Kubernetes",
        uri = "https://json.schemastore.org/kustomization.json",
        match = "kustomization.yaml",
      },
      {
        name = "Docker Compose",
        uri = "https://json.schemastore.org/docker-compose.json",
        match = "docker-compose.yaml",
      },
    },
    commands = {
      ComaCompanionSpectreEnable = true,
    },
  },
}
