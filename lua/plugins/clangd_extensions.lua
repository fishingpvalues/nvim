-- clangd_extensions.nvim: Enhanced clangd features
return {
  "p00f/clangd_extensions.nvim",
  lazy = true,
  ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  dependencies = { "neovim/nvim-lspconfig" },
  keys = {
    { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "C/C++: Switch Source/Header" },
    { "<leader>cs", "<cmd>ClangdSymbolInfo<cr>", desc = "C/C++: Symbol Info" },
    { "<leader>ct", "<cmd>ClangdTypeHierarchy<cr>", desc = "C/C++: Type Hierarchy" },
    { "<leader>cA", "<cmd>ClangdAST<cr>", desc = "C/C++: AST" },
    { "<leader>cm", "<cmd>ClangdMemoryUsage<cr>", desc = "C/C++: Memory Usage" },
  },
  opts = {
    inlay_hints = {
      inline = false,
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      show_variable_name = false,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },
      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },
      highlights = {
        detail = "Comment",
      },
    },
    memory_usage = {
      border = "rounded",
    },
    symbol_info = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("clangd_extensions").setup(opts)
  end,
}
