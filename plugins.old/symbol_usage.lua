-- symbol-usage.nvim: Show symbol usage count (like IntelliJ IDEA)
return {
  'Wansmer/symbol-usage.nvim',
  event = 'LspAttach',
  keys = {
    { "<leader>su", desc = "Symbol Usage: Toggle" },
  },
  opts = {
    kinds = {
      vim.lsp.protocol.SymbolKind.Function,
      vim.lsp.protocol.SymbolKind.Method,
      vim.lsp.protocol.SymbolKind.Class,
      vim.lsp.protocol.SymbolKind.Struct,
      vim.lsp.protocol.SymbolKind.Interface,
      vim.lsp.protocol.SymbolKind.Enum,
    },
    kinds_filter = {},
    vt_position = 'above',  -- 'above' | 'end_of_line' | 'textwidth' | 'signcolumn'
    request_pending_text = 'loading...',
    references = { enabled = true, include_declaration = false },
    definition = { enabled = true },
    implementation = { enabled = true },
    disable = {
      lsp = {},
      filetypes = {},
      cond = {},
    },
    symbol_request_pos = 'end',
    text_format = function(symbol)
      local fragments = {}
      local round = function(x)
        return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
      end

      if symbol.references then
        local usage = symbol.references <= 1 and 'usage' or 'usages'
        local num = symbol.references == 0 and 'no' or symbol.references
        table.insert(fragments, ('%s %s'):format(num, usage))
      end

      if symbol.definition then
        table.insert(fragments, symbol.definition .. ' defs')
      end

      if symbol.implementation then
        table.insert(fragments, symbol.implementation .. ' impls')
      end

      return table.concat(fragments, ', ')
    end,
  },
}
