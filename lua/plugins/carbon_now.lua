-- carbon-now.nvim: Create beautiful code snippets using carbon.now.sh
-- GitHub: https://github.com/ellisonleao/carbon-now.nvim
return {
  "ellisonleao/carbon-now.nvim",
  event = "VeryLazy",
  cmd = "CarbonNow",
  config = function()
    require("carbon-now").setup({
      options = {
        theme = "monokai",
        font_family = "Hack",
        font_size = 18,
        line_numbers = true,
        line_height = 1.25,
        drop_shadow = false,
        drop_shadow_blur = "4px",
        drop_shadow_offset_y = "6px",
        padding_horizontal = "16px",
        padding_vertical = "16px",
        background = "#aab8c2",
        watermark = false,
        width = 680,
        window_controls = true,
        window_title = "",
      },
    })

    -- Create visual selection command
    vim.api.nvim_create_user_command("CarbonNow", function()
      require("carbon-now").open()
    end, { range = true, desc = "Export to carbon.now.sh" })
  end,
}
