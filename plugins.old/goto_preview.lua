-- Preview definitions/references in floating windows
-- GitHub: https://github.com/rmagatti/goto-preview
return {
  'rmagatti/goto-preview',
  dependencies = 'rmagatti/logger.nvim',
  event = 'VeryLazy',
  config = function()
    require('goto-preview').setup({
      width = 120,
      height = 15,
      border = { '↖', '─', '┐', '│', '┘', '─', '└', '│' },
      default_mappings = false,
      opacity = nil,
      resizing_mappings = false,
      post_open_hook = nil,
      post_close_hook = nil,
      references = {
        provider = 'telescope',
        telescope = require('telescope.themes').get_dropdown({ hide_preview = false }),
      },
      focus_on_open = true,
      dismiss_on_move = false,
      force_close = true,
      bufhidden = 'wipe',
      stack_floating_preview_windows = true,
      preview_window_title = { enable = true, position = 'left' },
    })

    local goto_preview = require('goto-preview')
    vim.keymap.set('n', 'gpd', goto_preview.goto_preview_definition, { desc = 'Preview definition' })
    vim.keymap.set('n', 'gpt', goto_preview.goto_preview_type_definition, { desc = 'Preview type definition' })
    vim.keymap.set('n', 'gpi', goto_preview.goto_preview_implementation, { desc = 'Preview implementation' })
    vim.keymap.set('n', 'gpD', goto_preview.goto_preview_declaration, { desc = 'Preview declaration' })
    vim.keymap.set('n', 'gP', goto_preview.close_all_win, { desc = 'Close all preview windows' })
    vim.keymap.set('n', 'gpr', goto_preview.goto_preview_references, { desc = 'Preview references' })
  end,
}
