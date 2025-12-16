-- nvim-lightbulb: Show lightbulb for code actions
return {
  'kosayoda/nvim-lightbulb',
  event = { "LspAttach" },
  opts = {
    priority = 10,
    hide_in_unfocused_buffer = true,
    link_highlights = true,
    validate_config = "auto",
    action_kinds = nil,
    sign = {
      enabled = true,
      text = "󰌵",
      hl = "LightBulbSign",
    },
    virtual_text = {
      enabled = false,
      text = "󰌵",
      hl = "LightBulbVirtualText",
      hl_mode = "combine",
    },
    float = {
      enabled = false,
      text = "󰌵",
      hl = "LightBulbFloatWin",
      win_opts = {},
    },
    status_text = {
      enabled = false,
      text = "󰌵",
      text_unavailable = "",
    },
    number = {
      enabled = false,
      hl = "LightBulbNumber",
    },
    line = {
      enabled = false,
      hl = "LightBulbLine",
    },
    autocmd = {
      enabled = true,
      updatetime = 200,
      events = { "CursorHold", "CursorHoldI" },
      pattern = { "*" },
    },
    ignore = {
      clients = {},
      ft = {},
      actions_without_kind = false,
    },
  },
}
