-- codesettings.nvim: Load project-specific LSP settings from VS Code config files
return {
  'mrjones2014/codesettings.nvim',
  ft = { 'json', 'jsonc', 'lua' }, -- Required for jsonls, lua_ls integrations and jsonc filetype setup
  opts = {
    -- Look for these config files (default paths)
    config_file_paths = { '.vscode/settings.json', 'codesettings.json', 'lspsettings.json' },
    -- Integrate with jsonls to provide LSP completion for LSP settings based on schemas
    jsonls_integration = true,
    -- Set up library paths for lua_ls automatically to pick up generated type annotations
    lua_ls_integration = true,
    -- Set filetype to jsonc when opening config files for better highlighting
    jsonc_filetype = true,
    -- Enable live reloading of settings when config files change
    live_reload = false, -- Disabled by default to avoid unexpected behavior
    -- How to merge lists; 'append' (default), 'prepend' or 'replace'
    merge_lists = 'append',
  },
}