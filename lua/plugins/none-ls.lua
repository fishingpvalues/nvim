-- ============================================================================
-- None-ls (null-ls fork) - Additional formatting and diagnostics
-- ============================================================================

return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          -- Completion
          null_ls.builtins.completion.spell,

          -- Code Actions
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.gomodifytags,
          null_ls.builtins.code_actions.impl,
          null_ls.builtins.code_actions.refactoring,

          -- Diagnostics (backup if nvim-lint not working)
          -- null_ls.builtins.diagnostics.golangci_lint,
          -- null_ls.builtins.diagnostics.ruff,
          -- null_ls.builtins.diagnostics.yamllint,

          -- Hover
          null_ls.builtins.hover.dictionary,
        },
      }
    end,
  },
}
