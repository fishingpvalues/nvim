-- schema-companion.nvim: JSON/YAML schema validation and completion
return {
  "cenk1cenk2/schema-companion.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    log_level = vim.log.levels.INFO,
  },
}