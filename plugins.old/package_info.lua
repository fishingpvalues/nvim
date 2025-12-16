-- package-info.nvim: Show package.json dependency info
return {
  'vuki656/package-info.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  ft = { "json" },
  keys = {
    { "<leader>ps", "<cmd>Telescope package_info<CR>", desc = "Package: Search" },
    { "<leader>pu", desc = "Package: Update" },
    { "<leader>pd", desc = "Package: Delete" },
    { "<leader>pi", desc = "Package: Install" },
    { "<leader>pc", desc = "Package: Change Version" },
  },
  config = function()
    require('package-info').setup({
      colors = {
        up_to_date = "#3C4048",
        outdated = "#d19a66",
      },
      icons = {
        enable = true,
        style = {
          up_to_date = "|  ",
          outdated = "|  ",
        },
      },
      autostart = true,
      hide_up_to_date = false,
      hide_unstable_versions = false,
    })

    -- Setup Telescope extension
    require('telescope').setup({
      extensions = {
        package_info = {
          theme = "ivy",
        },
      },
    })
    require('telescope').load_extension('package_info')
  end,
}
