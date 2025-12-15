-- rayso.nvim: Create code snippets using ray.so service
-- GitHub: https://github.com/TobinPalmer/rayso.nvim
return {
  "TobinPalmer/rayso.nvim",
  event = "VeryLazy",
  cmd = "Rayso",
  config = function()
    require("rayso").setup({
      open_cmd = "xdg-open", -- Use your default browser (xdg-open on Linux)
      options = {
        logging_enabled = true,
        logging_path = vim.fn.expand("~") .. "/Documents/Rayso/",
        logging_file = "rayso",
        theme = "midnight",
        background = true,
        dark_mode = true,
        padding = 32,
        title = "Code Snippet",
      },
    })

    -- Keybinding for visual mode to quickly create snippet
    vim.keymap.set(
      "v",
      "<leader>rs",
      function()
        require("rayso").open()
      end,
      { desc = "[R]ayso create [S]nippet" }
    )

    -- Command for creating snippets
    vim.api.nvim_create_user_command("Rayso", function()
      require("rayso").open()
    end, { range = true, desc = "Create snippet with ray.so" })
  end,
}
