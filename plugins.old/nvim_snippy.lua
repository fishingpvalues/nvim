-- nvim-snippy: Snippet plugin written in Lua with vim-snippets support
-- GitHub: https://github.com/dcampos/nvim-snippy
return {
  "dcampos/nvim-snippy",
  event = "VeryLazy",
  config = function()
    require("snippy").setup({
      enable_auto_expand = false,
      -- Map of filetypes to snippet file patterns
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
        nx = {
          ["<leader>x"] = "cut_text",
        },
      },
    })

    local map = vim.keymap.set

    -- Tab to expand snippet or jump forward
    map({ "i", "s" }, "<Tab>", function()
      return require("snippy").can_expand_or_advance() and "<Plug>(snippy-expand-or-advance)" or "<Tab>"
    end, { expr = true, desc = "Expand or advance snippet" })

    -- Shift+Tab to jump backward
    map({ "i", "s" }, "<S-Tab>", function()
      return require("snippy").can_jump(-1) and "<Plug>(snippy-previous)" or "<S-Tab>"
    end, { expr = true, desc = "Previous snippet placeholder" })

    -- Visual mode: cut selection to snippet
    map("x", "<Tab>", "<Plug>(snippy-cut-text)", { desc = "Cut text to snippet" })
  end,
}
