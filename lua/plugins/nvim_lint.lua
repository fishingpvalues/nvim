-- nvim-lint: Asynchronous linting for Neovim
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>ll", desc = "Lint: Trigger" },
  },
  config = function()
    local lint = require("lint")

    -- Configure linters by filetype
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "pylint", "ruff" },
      go = { "golangcilint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      lua = { "luacheck" },
      rust = { "clippy" },
      c = { "cppcheck" },
      cpp = { "cppcheck" },
      markdown = { "markdownlint" },
      yaml = { "yamllint" },
      json = { "jsonlint" },
      dockerfile = { "hadolint" },
    }

    -- Setup autocmd to trigger linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keymap for manual linting
    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
      vim.notify("Linting...", vim.log.levels.INFO)
    end, { desc = "Trigger linting for current file" })
  end,
}
