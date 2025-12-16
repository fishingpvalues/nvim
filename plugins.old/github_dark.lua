-- GitHub Plus theme setup (SOTA GitHub-inspired theme)
return {
  'tommarien/github-plus.nvim',
  lazy = false,
  priority = 1000,
  version = '*',
  --- @--- GithubPlus.Overrides
  opts = {
    transparent = true,
    styles = {
      comments = {
        italic = true,  -- Italic comments
      },
    },
  },
  config = function(_, opts)
    require('github_plus').setup(opts)
    vim.cmd('colorscheme github_plus')

    -- UI overrides to match GitHub Plus across plugins
    local function set_hl()
      local c = {
        bg0    = 'NONE',
        black  = '#0d1117', grey   = '#21262d', white  = '#e6edf3',
        blue   = '#539bf5', cyan   = '#56d4dd', green  = '#7ee787',
        yellow = '#d29922', orange = '#ffa657', red    = '#f85149', violet = '#b083f0',
      }
      local set = function(group, spec) pcall(vim.api.nvim_set_hl, 0, group, spec) end
      -- Diagnostics
      set('DiagnosticSignError', { fg = c.red,    bg = c.bg0 })
      set('DiagnosticSignWarn',  { fg = c.yellow, bg = c.bg0 })
      set('DiagnosticSignInfo',  { fg = c.blue,   bg = c.bg0 })
      set('DiagnosticSignHint',  { fg = c.cyan,   bg = c.bg0 })
      set('DiagnosticVirtualTextError', { fg = c.red,    bg = c.bg0 })
      set('DiagnosticVirtualTextWarn',  { fg = c.yellow, bg = c.bg0 })
      set('DiagnosticVirtualTextInfo',  { fg = c.blue,   bg = c.bg0 })
      set('DiagnosticVirtualTextHint',  { fg = c.cyan,   bg = c.bg0 })
      -- GitSigns
      set('GitSignsAdd',    { fg = c.green,  bg = c.bg0 })
      set('GitSignsChange', { fg = c.orange, bg = c.bg0 })
      set('GitSignsDelete', { fg = c.red,    bg = c.bg0 })
      -- Trouble
      set('TroubleNormal',      { fg = c.white,  bg = c.bg0 })
      set('TroubleNormalNC',    { fg = c.white,  bg = c.bg0 })
      set('TroubleText',        { fg = c.white,  bg = c.bg0 })
      set('TroubleCount',       { fg = c.white,  bg = c.grey, bold = true })
      set('TroubleFile',        { fg = c.blue,   bg = c.bg0 })
      set('TroubleLocation',    { fg = c.cyan,   bg = c.bg0 })
      set('TroubleIndent',      { fg = c.grey,   bg = c.bg0 })
      set('TroubleFoldIcon',    { fg = c.violet, bg = c.bg0 })
      set('TroubleSignError',   { fg = c.red,    bg = c.bg0 })
      set('TroubleSignWarning', { fg = c.yellow, bg = c.bg0 })
      set('TroubleSignInformation', { fg = c.blue, bg = c.bg0 })
      set('TroubleSignHint',    { fg = c.cyan,   bg = c.bg0 })
      -- Noice
      set('NoiceCmdlinePopup',       { fg = c.white,  bg = c.bg0 })
      set('NoiceCmdlinePopupBorder', { fg = c.grey,   bg = c.bg0 })
      set('NoiceCmdlinePopupTitle',  { fg = c.violet, bg = c.bg0, bold = true })
      set('NoicePopup',              { fg = c.white,  bg = c.bg0 })
      set('NoicePopupBorder',        { fg = c.grey,   bg = c.bg0 })
      set('NoiceSplit',              { fg = c.white,  bg = c.bg0 })
      set('NoiceSplitBorder',        { fg = c.grey,   bg = c.bg0 })
      -- WhichKey
      set('WhichKey',        { fg = c.violet, bg = c.bg0, bold = true })
      set('WhichKeyGroup',   { fg = c.blue,   bg = c.bg0 })
      set('WhichKeyDesc',    { fg = c.white,  bg = c.bg0 })
      set('WhichKeySeparator',{ fg = c.grey,  bg = c.bg0 })
      set('WhichKeyBorder',  { fg = c.grey,   bg = c.bg0 })
      set('WhichKeyFloat',   { fg = c.white,  bg = c.bg0 })
      -- Fzf-lua
      set('FzfLuaBorder',    { fg = c.grey,   bg = c.bg0 })
      set('FzfLuaTitle',     { fg = c.violet, bg = c.bg0, bold = true })
      set('FzfLuaNormal',    { fg = c.white,  bg = c.bg0 })
      set('FzfLuaCursorLine',{ fg = c.white,  bg = c.grey })
      -- Float & Pmenu
      set('NormalFloat',   { fg = c.white,  bg = c.bg0 })
      set('FloatBorder',   { fg = c.grey,   bg = c.bg0 })
      set('FloatTitle',    { fg = c.violet, bg = c.bg0, bold = true })
      set('Pmenu',         { fg = c.white,  bg = c.grey })
      set('PmenuSel',      { fg = c.black,  bg = c.violet, bold = true })
      set('PmenuSbar',     { fg = c.grey,   bg = c.bg0 })
      set('PmenuThumb',    { fg = c.grey,   bg = c.grey })
      -- Lazy & Mason
      set('LazyH1',            { fg = c.black, bg = c.violet, bold = true })
      set('LazyH2',            { fg = c.violet, bg = c.bg0, bold = true })
      set('LazyProgressDone',  { fg = c.green,  bg = c.bg0 })
      set('LazyProgressTodo',  { fg = c.grey,   bg = c.bg0 })
      set('MasonNormal',         { fg = c.white,  bg = c.bg0 })
      set('MasonHeader',         { fg = c.black,  bg = c.violet, bold = true })
      set('MasonHighlight',      { fg = c.blue,   bg = c.bg0 })
      set('MasonHighlightBlock', { fg = c.black,  bg = c.green, bold = true })
      set('MasonHighlightBlockBold', { fg = c.black, bg = c.green, bold = true })
      set('MasonHighlightSecondary', { fg = c.black, bg = c.orange, bold = true })
      -- Neo-tree
      set('NeoTreeNormal',          { fg = c.white,  bg = c.bg0 })
      set('NeoTreeNormalNC',        { fg = c.white,  bg = c.bg0 })
      set('NeoTreeTitleBar',        { fg = c.black,  bg = c.violet, bold = true })
      set('NeoTreeWinSeparator',    { fg = c.grey,   bg = c.bg0 })
      set('NeoTreeRootName',        { fg = c.violet, bg = c.bg0, bold = true })
      set('NeoTreeDirectoryName',   { fg = c.blue,   bg = c.bg0 })
      set('NeoTreeDirectoryIcon',   { fg = c.blue,   bg = c.bg0 })
      set('NeoTreeGitAdded',        { fg = c.green,  bg = c.bg0 })
      set('NeoTreeGitModified',     { fg = c.orange, bg = c.bg0 })
      set('NeoTreeGitDeleted',      { fg = c.red,    bg = c.bg0 })
      set('NeoTreeGitUntracked',    { fg = c.cyan,   bg = c.bg0 })
      set('NeoTreeGitStaged',       { fg = c.green,  bg = c.bg0 })
      set('NeoTreeGitConflict',     { fg = c.red,    bg = c.bg0, bold = true })
      -- indent-blankline (ibl)
      set('IblIndent',              { fg = c.grey,   bg = c.bg0 })
      set('IblWhitespace',          { fg = c.grey,   bg = c.bg0 })
      set('IblScope',               { fg = c.violet, bg = c.bg0 })
      set('IndentBlanklineChar',         { fg = c.grey,   bg = c.bg0 })
      set('IndentBlanklineContextChar',  { fg = c.violet, bg = c.bg0 })
      -- nvim-notify
      set('NotifyBackground',   { fg = c.white,  bg = c.bg0 })
      set('NotifyERRORBorder',  { fg = c.red,    bg = c.bg0 })
      set('NotifyWARNBorder',   { fg = c.yellow, bg = c.bg0 })
      set('NotifyINFOBorder',   { fg = c.blue,   bg = c.bg0 })
      set('NotifyDEBUGBorder',  { fg = c.grey,   bg = c.bg0 })
      set('NotifyTRACEBorder',  { fg = c.violet, bg = c.bg0 })
      set('NotifyERRORTitle',   { fg = c.red,    bg = c.bg0, bold = true })
      set('NotifyWARNTitle',    { fg = c.yellow, bg = c.bg0, bold = true })
      set('NotifyINFOTitle',    { fg = c.blue,   bg = c.bg0, bold = true })
      set('NotifyDEBUGTitle',   { fg = c.grey,   bg = c.bg0, bold = true })
      set('NotifyTRACETitle',   { fg = c.violet, bg = c.bg0, bold = true })
      set('NotifyERRORBody',    { fg = c.white,  bg = c.bg0 })
      set('NotifyWARNBody',     { fg = c.white,  bg = c.bg0 })
      set('NotifyINFOBody',     { fg = c.white,  bg = c.bg0 })
      set('NotifyDEBUGBody',    { fg = c.white,  bg = c.bg0 })
      set('NotifyTRACEBody',    { fg = c.white,  bg = c.bg0 })
      set('NotifyERRORIcon',    { fg = c.red,    bg = c.bg0 })
      set('NotifyWARNIcon',     { fg = c.yellow, bg = c.bg0 })
      set('NotifyINFOIcon',     { fg = c.blue,   bg = c.bg0 })
      set('NotifyDEBUGIcon',    { fg = c.grey,   bg = c.bg0 })
      set('NotifyTRACEIcon',    { fg = c.violet, bg = c.bg0 })
      -- LSP floats & hints
      set('LspInfoBorder',               { fg = c.grey,   bg = c.bg0 })
      set('LspSignatureActiveParameter', { fg = c.orange, bg = c.bg0, bold = true })
      set('LspInlayHint',                { fg = c.grey,   bg = c.bg0, italic = true })
      set('LspCodeLens',                 { fg = c.grey,   bg = c.bg0, italic = true })
      set('LspCodeLensSeparator',        { fg = c.grey,   bg = c.bg0 })
    end

    set_hl()
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('github_plus_ui_overrides', { clear = true }),
      callback = set_hl,
    })
  end
} 
