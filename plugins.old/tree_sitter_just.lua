-- tree-sitter-just: Tree-sitter grammar for Justfiles
-- GitHub: https://github.com/IndianBoy42/tree-sitter-just
return {
  "IndianBoy42/tree-sitter-just",
  enabled = false,
  ft = { "just", "justfile" },
  event = "VeryLazy",
  config = function()
    require("tree-sitter-just").setup({})

    -- Ensure the just parser is installed
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.just = {
      install_info = {
        url = "https://github.com/IndianBoy42/tree-sitter-just",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
      },
      filetype = "just",
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
