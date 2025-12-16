-- nvim-treesitter: Main Treesitter configuration with parsers
return {
  'nvim-treesitter/nvim-treesitter',
  enabled = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-context',
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'css',
      'dockerfile',
      'fish',
      'go',
      'gomod',
      'gosum',
      'gowork',
      'hcl', -- for Terraform
      'html',
      'javascript',
      'jsdoc',
      'json',
      'jsonc',
      'lua',
      'luadoc',
      'luap',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'regex',
      'rust',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
      'terraform',
      'hcl',
      'sql',
      'graphql',
      'html',
      'css',
      'scss',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'graphql',
      'java',
      'kotlin',
      'make',
      -- 'org', -- Commenting out org parser as it may not be available
      'php',
      'rust',
      'toml',
      'zig',
      'bash',
      'comment',
      'commonlisp',
      'diff',
      'gitcommit',
      'git_rebase',
      'vim',
      'vimdoc',
      -- Add more parsers as needed
    },
    auto_install = false,
    highlight = {
      enable = true,
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `false` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
    },
  },
  config = function(_, opts)
    -- Use a dedicated parser installation directory to avoid permission issues
    local parser_dir = vim.fn.stdpath('data') .. '/parsers'
    if vim.fn.isdirectory(parser_dir) == 0 then
      pcall(vim.fn.mkdir, parser_dir, 'p')
    end
    pcall(function()
      require('nvim-treesitter.install').prefer_git = false
      require('nvim-treesitter.install').compilers = require('nvim-treesitter.install').compilers or {}
      require('nvim-treesitter.install').parser_install_dir = parser_dir
      if not string.find(vim.o.runtimepath, parser_dir, 1, true) then
        vim.opt.runtimepath:append(parser_dir)
      end
    end)

    local ok, ts = pcall(require, 'nvim-treesitter.configs')
    if not ok then
      vim.schedule(function()
        vim.notify('nvim-treesitter not available; skipping setup', vim.log.levels.WARN)
      end)
      return
    end
    ts.setup(opts)
  end,
}
