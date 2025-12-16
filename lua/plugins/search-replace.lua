-- ============================================================================
-- Search and Replace Tools
-- ============================================================================

return {
  -- Grug Far (search and replace UI)
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<leader>sr",
        function()
          require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
        end,
        desc = "Search and Replace",
      },
    },
    opts = {
      headerMaxWidth = 80,
    },
  },

  -- SSR (structural search and replace)
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sR",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
    opts = {
      border = "rounded",
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_confirm = "<cr>",
        replace_all = "<leader><cr>",
      },
    },
  },

  -- Hlslens (better search highlighting)
  {
    "kevinhwang91/nvim-hlslens",
    keys = {
      { "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
      { "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
      { "*", [[*<Cmd>lua require('hlslens').start()<CR>]] },
      { "#", [[#<Cmd>lua require('hlslens').start()<CR>]] },
      { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]] },
      { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]] },
    },
    opts = {
      calm_down = true,
      nearest_only = true,
    },
  },

  -- Rip substitute
  {
    "chrisgrieser/nvim-rip-substitute",
    cmd = "RipSubstitute",
    keys = {
      {
        "<leader>fs",
        function()
          require("rip-substitute").sub()
        end,
        mode = { "n", "x" },
        desc = "Rip Substitute",
      },
    },
  },

  -- Muren (multiple replace)
  {
    "AckslD/muren.nvim",
    cmd = "MurenToggle",
    keys = {
      { "<leader>sm", "<cmd>MurenToggle<cr>", desc = "Muren Toggle" },
    },
    opts = {},
  },

  -- Sad (search and destroy)
  {
    "ray-x/sad.nvim",
    dependencies = { "ray-x/guihua.lua" },
    cmd = "Sad",
    keys = {
      { "<leader>sd", "<cmd>Sad<cr>", desc = "Sad (Search and Destroy)" },
    },
    opts = {},
  },

  -- Interestingwords (highlight word under cursor)
  {
    "Mr-LLLLL/interestingwords.nvim",
    keys = {
      { "<leader>k", "<cmd>lua require('interestingwords').hl_word()<cr>", desc = "Highlight word" },
      { "<leader>K", "<cmd>lua require('interestingwords').hl_cancel()<cr>", desc = "Cancel highlight" },
    },
    opts = {
      colors = { "#aeee00", "#ff0000", "#0000ff", "#b88823", "#ffa724", "#ff2c4b" },
      search_count = true,
      navigation = true,
      scroll_center = true,
    },
  },
}
