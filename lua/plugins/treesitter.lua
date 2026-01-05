-- ============================================================================
-- Treesitter: Syntax Highlighting and Code Understanding
-- ============================================================================

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- Use main branch instead of master
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    config = function()
      -- Modern nvim-treesitter API (no .configs module)
      local ts = require("nvim-treesitter")

      -- Setup treesitter
      ts.setup()

      -- Install parsers
      local parsers = {
        "bash", "c", "diff", "go", "gomod", "gowork", "gosum",
        "python", "yaml", "lua", "luadoc", "markdown", "markdown_inline",
        "query", "regex", "vim", "vimdoc", "json", "jsonc",
        "dockerfile", "html", "css", "javascript", "typescript", "tsx",
      }

      ts.install(parsers)

      -- Enable features via autocmd (only for supported filetypes)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "bash", "c", "diff", "go", "gomod", "python", "yaml", "lua",
          "markdown", "vim", "json", "jsonc", "dockerfile", "html", "css",
          "javascript", "typescript", "typescriptreact", "sh", "zsh",
        },
        callback = function()
          -- Enable treesitter highlighting (safely)
          pcall(vim.treesitter.start)

          -- Enable treesitter indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- Incremental selection keymaps
      vim.keymap.set("n", "<C-space>", function()
        vim.cmd("normal! viw")
      end, { desc = "Init selection" })

      vim.keymap.set("x", "<C-space>", function()
        vim.cmd("normal! viw")
      end, { desc = "Increment selection" })

      vim.keymap.set("x", "<bs>", function()
        vim.cmd("normal! V")
      end, { desc = "Decrement selection" })
    end,
  },

  -- Treesitter context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 20,
    },
  },
}
