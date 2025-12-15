-- tesoura.nvim: Modern snippet system using Neovim's new snippet API
-- GitHub: https://github.com/guilherme-puida/tesoura.nvim
return {
  "guilherme-puida/tesoura.nvim",
  event = "VeryLazy",
  config = function()
    require("tesoura").setup({
      -- Enable syntax highlighting for snippet content
      highlight = true,
      -- Filetypes to ignore
      ignored_filetypes = {},
      -- Create autocmd to auto-expand snippets
      setup_autocmd = false,
      -- Source name for nvim-cmp integration
      source_name = "tesoura",
      -- Define your snippets here
      snippets = {
        -- Example snippet structure:
        -- filetype = {
        --   {
        --     prefix = "trigger",
        --     body = "expanded text",
        --     description = "Snippet description",
        --   },
        -- }
        lua = {
          {
            prefix = "req",
            body = "local ${1:module} = require('${1:module}')",
            description = "Require module",
          },
          {
            prefix = "fn",
            body = "local function ${1:name}(${2:args})\n  ${0}\nend",
            description = "Function definition",
          },
        },
        python = {
          {
            prefix = "def",
            body = "def ${1:function}(${2:args}):\n  ${0}",
            description = "Function definition",
          },
          {
            prefix = "cls",
            body = "class ${1:ClassName}:\n  def __init__(self):\n    ${0}",
            description = "Class definition",
          },
        },
        javascript = {
          {
            prefix = "fn",
            body = "const ${1:name} = (${2:args}) => {\n  ${0}\n}",
            description = "Arrow function",
          },
          {
            prefix = "log",
            body = "console.log(${0})",
            description = "Console log",
          },
        },
      },
    })

    -- Keybindings for snippet expansion
    vim.keymap.set("i", "<C-j>", function()
      require("tesoura").expand()
    end, { silent = true, desc = "Expand snippet" })

    vim.keymap.set("i", "<C-k>", function()
      require("tesoura").jump_prev()
    end, { silent = true, desc = "Jump to previous snippet" })

    vim.keymap.set("i", "<C-l>", function()
      require("tesoura").jump_next()
    end, { silent = true, desc = "Jump to next snippet" })
  end,
}
