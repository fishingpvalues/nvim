-- LSP codelens support
-- GitHub: https://github.com/VidocqH/lsp-lens.nvim
return {
  'VidocqH/lsp-lens.nvim',
  event = 'VeryLazy',
  enabled = true,
  config = function()
    require('lsp-lens').setup({
      enable = true,
      include_declaration = true,
      sections = {
        definition = function(count)
          return string.format('Definitions: %d', count)
        end,
        references = function(count)
          return string.format('References: %d', count)
        end,
        implements = function(count)
          return string.format('Implements: %d', count)
        end,
        git_authors = function(latest_author, count)
          return string.format(' %s (%s)', latest_author, count)
        end,
      },
      ignore_filetype = {
        'prisma',
      },
      -- `follower` jump to lenses
      -- `split_horizontally` split to lenses
      -- `split_vertically` split to lenses
      -- `tailing_comment` show lenses on tailing comment
      code_lens_action = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      max_count = 500,
      display_action_name = true,
      separator = ' | ',
      net_show_function = false,
      include_focus_lines = true,
      focus_lines = {
        enable = false,
        priority = 150,
      },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-lens', { clear = true }),
      callback = function(args)
        if not (args.data and args.data.client_id) then
          return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.supports_method('textDocument/codeLens') then
          vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ll', '<Cmd>LspLensToggle<CR>', { noremap = true })
        end
      end,
    })
  end,
}
