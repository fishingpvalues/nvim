-- Cargo.toml dependency management
-- GitHub: https://github.com/saecki/crates.nvim
return {
  'saecki/crates.nvim',
  event = { 'BufRead Cargo.toml' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('crates').setup({
      text = {
        loading = '  Loading',
        version = '  %s',
        prerelease = '  %s',
        yanked = '  %s',
        nomatch = '  No match',
        instability = '  %s',
        error = '  Error fetching crate',
      },
      highlight = {
        loading = 'CratesNvimLoading',
        version = 'CratesNvimVersion',
        prerelease = 'CratesNvimPrerelease',
        yanked = 'CratesNvimYanked',
        nomatch = 'CratesNvimNoMatch',
        instability = 'CratesNvimInstability',
        error = 'CratesNvimError',
      },
      popup = {
        autofocus = true,
        copy_register = '"',
        style = 'minimal',
        border = 'rounded',
        show_version_date = false,
      },
      cmp = {
        text = true,
        kind = true,
      },
      null_ls = {
        enabled = false,
        name = 'crates',
      },
      lsp = {
        enabled = true,
        on_attach = nil,
        actions = true,
        completion = true,
        hover = true,
      },
      external_crates = {
        stat_cache_mb = 40,
        prefer_workspace_crates = true,
      },
    })

    vim.keymap.set('n', '<leader>ct', require('crates').toggle, { desc = '[C]rates [T]oggle' })
    vim.keymap.set('n', '<leader>cr', require('crates').reload, { desc = '[C]rates [R]eload' })
    vim.keymap.set('n', '<leader>cv', require('crates').show_versions_popup, { desc = '[C]rates show [V]ersions' })
    vim.keymap.set('n', '<leader>cf', require('crates').show_features_popup, { desc = '[C]rates show [F]eatures' })
    vim.keymap.set('n', '<leader>cd', require('crates').show_dependencies_popup, { desc = '[C]rates show [D]ependencies' })
  end,
}
