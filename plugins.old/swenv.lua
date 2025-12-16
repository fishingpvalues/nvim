-- Python virtual environment switcher
-- GitHub: https://github.com/AckslD/swenv.nvim
return {
  'AckslD/swenv.nvim',
  ft = 'python',
  event = 'VeryLazy',
  config = function()
    require('swenv').setup({
      get_venvs = function(venv_path)
        return require('swenv.python').get_venvs(venv_path)
      end,
      post_set_venv = function(venv)
        vim.notify('Virtual environment switched to: ' .. venv.name, vim.log.levels.INFO)
      end,
    })

    vim.keymap.set('n', '<leader>pv', require('swenv.api').pick_venv, { desc = '[P]ython [V]env switcher' })
    vim.keymap.set('n', '<leader>pc', require('swenv.api').get_current_venv, { desc = '[P]ython [C]urrent venv' })
  end,
}
