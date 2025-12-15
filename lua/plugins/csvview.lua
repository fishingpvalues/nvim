-- csvview.nvim: Lightweight CSV viewer with tabular display
return {
  "hat0uma/csvview.nvim",
  ft = { "csv", "tsv" },
  keys = {
    { "<leader>cv", "<cmd>CsvViewToggle<CR>", desc = "CSV: Toggle View" },
    { "<leader>ce", "<cmd>CsvViewEnable<CR>", desc = "CSV: Enable View" },
    { "<leader>cd", "<cmd>CsvViewDisable<CR>", desc = "CSV: Disable View" },
  },
  opts = {
    parser = {
      async = true,
      delimiter = {
        default = ",",
        ft = {
          tsv = "\t",
        },
      },
      comments = { "#", "//" },
      quote_char = '"',
    },
    view = {
      min_column_width = 5,
      spacing = 2,
      display_mode = "border",  -- "highlight" | "border"
    },
    keymaps = {
      disable = "<Plug>(disable)",
      enable = "<Plug>(enable)",
      toggle = "<Plug>(toggle)",
    },
  },
}
