return {
  "cbochs/portal.nvim",
  -- Optional dependencies
  dependencies = {
    "cbochs/grapple.nvim",
    "ThePrimeagen/harpoon"
  },
  keys = {
    { "<leader>o", "<cmd>Portal jumplist backward<cr>", desc = "Portal jumplist backward" },
    { "<leader>i", "<cmd>Portal jumplist forward<cr>", desc = "Portal jumplist forward" },
    { "<leader>p", "<cmd>Portal quickfix forward<cr>", desc = "Portal quickfix forward" },
    { "<leader>l", "<cmd>Portal changelist backward<cr>", desc = "Portal changelist backward" },
  },
  opts = {
    -- The base filter applied to every search.
    filter = nil,
    
    -- The maximum number of results for any search.
    max_results = nil,
    
    -- The maximum number of items that can be searched.
    lookback = 100,
    
    -- An ordered list of keys for labelling portals.
    -- Labels will be applied in order, or to match slotted results.
    labels = { "j", "k", "h", "l" },
    
    -- Select first portal when there is only one result.
    select_first = false,
    
    -- Keys used for exiting portal selection. Disable with [{key}] = false to `false`.
    escape = {
      ["<esc>"] = true,
    },
    
    -- The raw window options used for portal window
    window_options = {
      relative = "cursor",
      width = 80,
      height = 3,
      col = 2,
      focusable = false,
      border = "single",
      noautocmd = true,
    },
  },
}