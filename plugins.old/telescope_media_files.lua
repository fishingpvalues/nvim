-- telescope-media-files.nvim: Preview images, PDF, epub, video, and fonts
-- GitHub: https://github.com/nvim-telescope/telescope-media-files.nvim
return {
  "nvim-telescope/telescope-media-files.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg", "gif", "mp4", "webm", "pdf", "epub" },
          find_cmd = "rg",
        },
      },
    })

    require("telescope").load_extension("media_files")

    -- Keybindings for media files
    vim.keymap.set("n", "<leader>fm", function()
      require("telescope").extensions.media_files.media_files()
    end, { desc = "[F]zf [M]edia files" })
  end,
}
