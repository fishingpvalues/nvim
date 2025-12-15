-- headers.nvim: Zero-config header/footer warnings
-- GitHub: https://github.com/LucasTavaresA/headers.nvim
return {
  "LucasTavaresA/headers.nvim",
  event = "VeryLazy",
  config = function()
    require("headers").setup({
      -- Empty table warns everywhere; add folders to limit scope
      code_paths = {},
      -- Path where headers data is stored
      paths_file = vim.fn.stdpath("data") .. "/headers.nvim/paths.lua",
      -- File types to skip (non-code files)
      non_code = {
        "sh",
        "zsh",
        "bash",
        "fish",
        "vim",
        "markdown",
        "txt",
        "json",
        "yaml",
        "toml",
        "ini",
        "html",
        "css",
        "sql",
        "xml",
        "cmake",
        "make",
        "diff",
        "patch",
        "git",
        "gitcommit",
        "gitconfig",
        "gitignore",
        "gitattributes",
      },
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>hf", function()
      require("headers").fix_hovered()
    end, { desc = "[H]eaders [F]ix hovered" })

    vim.keymap.set("n", "<leader>hi", function()
      require("headers").ignore()
    end, { desc = "[H]eaders [I]gnore" })
  end,
}
