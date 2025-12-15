-- snippet-converter.nvim: Convert snippets between formats
-- GitHub: https://github.com/smjonas/snippet-converter.nvim
return {
  "smjonas/snippet-converter.nvim",
  event = "VeryLazy",
  config = function()
    require("snippet_converter").setup({
      templates = {
        {
          sources = {
            vscode = { vim.fn.stdpath("config") .. "/snippets/vscode" },
          },
          output = {
            vscode_luasnip = { vim.fn.stdpath("config") .. "/snippets/luasnip" },
          },
        },
      },
    })

    vim.api.nvim_create_user_command("ConvertSnippetsToLuaSnip", function()
      require("snippet_converter").convert()
    end, { desc = "Convert snippets to LuaSnip format" })
  end,
}
