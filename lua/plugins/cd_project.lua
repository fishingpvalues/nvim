-- cd-project.nvim: Easier way to cd to project directories
-- GitHub: https://github.com/LintaoAmons/cd-project.nvim
return {
  "LintaoAmons/cd-project.nvim",
  tag = "v0.11.0",
  event = "VeryLazy",
  config = function()
    local opts = {
      projects_config_filepath = vim.fs.normalize(
        vim.fn.stdpath("config") .. "/cd-project.nvim.json"
      ),
      project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod", "Makefile" },
      choice_format = "both",
      projects_picker = "telescope",
      auto_register_project = false,
    }

    require("cd-project").setup(opts)

    -- Keybindings
    vim.keymap.set("n", "<leader>cd", function()
      vim.cmd("CdProject")
    end, { desc = "[C]d to [P]roject" })

    vim.keymap.set("n", "<leader>ca", function()
      vim.cmd("CdProjectAdd")
    end, { desc = "[C]d Project [A]dd" })

    vim.keymap.set("n", "<leader>cb", function()
      vim.cmd("CdProjectBack")
    end, { desc = "[C]d [B]ack to previous project" })
  end,
}
