-- nvim-treesitter-textsubjects: Syntax-aware text objects using Tree-sitter
-- GitHub: https://github.com/RRethy/nvim-treesitter-textsubjects
return {
  "RRethy/nvim-treesitter-textsubjects",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter-textsubjects").configure({
      enable = true,
      prev_selection = ",",
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ["i;"] = "textsubjects-container-inner",
        ["a;"] = "textsubjects-container-outer",
      },
    })
  end,
}
