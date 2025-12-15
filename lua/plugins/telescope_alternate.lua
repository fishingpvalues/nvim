-- telescope-alternate.nvim: Switch between related files
-- GitHub: https://github.com/otavioschwanck/telescope-alternate.nvim
return {
  "otavioschwanck/telescope-alternate.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    -- Setup presets for common frameworks
    vim.g.telescope_alternate = {
      mappings = {
        -- Rails mappings
        { "app/models/(.*).rb", {
          { "spec/models/[1]_spec.rb", "Test" },
          { "app/controllers/**/[1:pluralize]_controller.rb", "Controller" },
        }},
        -- Generic template mappings
        { "(.*)/(.*).lua", {
          { "[1]/test_[2].lua", "Test" },
          { "[1]_spec/[2]_spec.lua", "Spec" },
        }},
      },
      presets = { "rails", "nestjs" },
      picker = "telescope",
    }

    -- Keybindings
    vim.keymap.set("n", "<leader>ta", function()
      vim.cmd("TelescopeAlternate")
    end, { desc = "[T]elescope [A]lternate file" })
  end,
}
