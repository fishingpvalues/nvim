-- codesnap.nvim: Beautiful code screenshots
return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Code: Snapshot to Clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Code: Snapshot Save" },
  },
  opts = {
    save_path = "~/Pictures/CodeSnaps",
    has_breadcrumbs = true,
    bg_theme = "bamboo",
    watermark = "",
    code_font_family = "JetBrainsMono Nerd Font",
    has_line_number = true,
    show_workspace = false,
    min_width = 0,
  },
}
