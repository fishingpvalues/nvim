-- sad.nvim: Space Age seD batch file edit tool
-- GitHub: https://github.com/ray-x/sad.nvim
return {
  "ray-x/sad.nvim",
  event = "VeryLazy",
  dependencies = { "ray-x/guihua.lua" },
  config = function()
    require("sad").setup({
      debug = false,
      diff = "delta",
      ls_file = "fd",
      exact = false,
      vsplit = false,
      height_ratio = 0.6,
      width_ratio = 0.6,
      -- Custom preview command
      preview_cmd = "delta",
      -- Respect .gitignore
      search_with_git = true,
    })

    -- Keybinding to open sad
    vim.keymap.set("n", "<leader>sr", function()
      require("sad").open()
    end, { desc = "[S]ad [R]eplace" })

    -- Command for sad
    vim.api.nvim_create_user_command("Sad", function()
      require("sad").open()
    end, { desc = "Open sad for batch file replacement" })
  end,
}
