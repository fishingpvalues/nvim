-- Extended Rust-Analyzer configuration
-- GitHub: https://github.com/mrcjkb/rustaceanvim
-- Note: rustaceanvim already exists, this provides additional config
return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        enable_clippy = true,
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
          auto = true,
          only_current_line = false,
          other_hints_prefix = '=> ',
        },
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', '<leader>rh', '<cmd>RustLsp hover actions<CR>', opts)
          vim.keymap.set('n', '<leader>ra', '<cmd>RustLsp codeAction<CR>', opts)
          vim.keymap.set('n', '<leader>re', '<cmd>RustLsp explainError<CR>', opts)
          vim.keymap.set('n', '<leader>rd', '<cmd>RustLsp debuggables<CR>', opts)
        end,
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              command = 'clippy',
              extraArgs = { '--all-targets', '--all-features' },
            },
            inlayHints = {
              bindingModeHints = {
                enable = true,
              },
              chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 15,
              },
              closureReturnTypeHints = {
                enable = 'with_block',
              },
              discriminantHints = {
                enable = 'fieldless',
              },
              lifetimeElisionHints = {
                enable = 'always',
                useParameterNames = true,
              },
              implicitDrops = {
                enable = true,
              },
              rangeExclusive = {
                enable = true,
              },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = true,
                hideNamedConstructor = true,
              },
            },
            cargo = {
              allTargets = true,
              allFeatures = true,
              target = nil,
              autoreload = true,
            },
            procMacro = {
              enable = true,
              attributes = {
                enable = true,
              },
            },
          },
        },
      },
    }
  end,
}
