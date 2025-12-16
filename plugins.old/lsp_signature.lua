-- lsp_signature.nvim: Show function signature when typing
return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    },
    floating_window = true,
    floating_window_above_cur_line = true,
    hint_enable = true,
    hint_prefix = "󰊕 ",
    hi_parameter = "LspSignatureActiveParameter",
    max_height = 12,
    max_width = 80,
    transparency = 10,
    toggle_key = '<C-k>',
    -- Trigger signature help automatically
    auto_close_after = nil,
    extra_trigger_chars = {},
    -- Show signature when entering function arguments
    trigger_on_newline = false,
    -- Virtual text at end of line
    hint_scheme = "String",
    always_trigger = false,
    timer_interval = 200,
  },
  config = function(_, opts)
    -- Attach to every LSP buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.signatureHelpProvider then
          require("lsp_signature").on_attach(opts, bufnr)
        end
      end,
    })
  end
}
