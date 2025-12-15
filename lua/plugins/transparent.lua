-- Transparent.nvim configuration for transparency across all UI plugins
return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- Avoid lazy-loading to ensure highlight-clearing logic is triggered
  priority = 1000, -- Load early to apply transparency before other UI elements
  config = function()
    require("transparent").setup({
      -- Default groups that should be cleared
      groups = {
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
        'EndOfBuffer',
      },
      -- Additional groups for various UI plugins
      extra_groups = {
        -- Float panels (Lazy, Mason, LspInfo, etc.)
        "NormalFloat",
        "FloatBorder",
        
        -- Neo-tree
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeVertSplit",
        "NeoTreeWinSeparator",
        "NeoTreeEndOfBuffer",
        "NeoTreeCursorLine",
        "NeoTreeDimText",
        
        -- Noice UI
        "NoiceCmdlinePopup",
        "NoiceCmdlinePopupBorder",
        "NoiceCmdlinePopupTitle",
        "NoiceConfirm",
        "NoiceConfirmBorder",
        "NoiceMini",
        "NoicePopup",
        "NoicePopupBorder",
        "NoiceSplit",
        "NoiceSplitBorder",
        

        
        -- Telescope (if you use it)
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopePromptBorder",
        "TelescopeResultsNormal",
        "TelescopeResultsBorder",
        "TelescopePreviewNormal",
        "TelescopePreviewBorder",
        
        -- WhichKey (if you use it)
        "WhichKeyNormal",
        "WhichKeyFloat",
        "WhichKeyBorder",
        
        -- CMP completion
        "CmpNormal",
        "CmpBorder",
        "CmpDocumentation",
        "CmpDocumentationBorder",
        
        -- Git signs
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
        
        -- Indent blankline
        "IndentBlanklineChar",
        "IndentBlanklineContextChar",
        
        -- Treesitter context
        "TreesitterContext",
        "TreesitterContextLineNumber",
        
        -- Trouble
        "TroubleNormal",
        "TroubleNormalNC",
        
        -- Dashboard
        "DashboardHeader",
        "DashboardCenter",
        "DashboardFooter",
        "DashboardShortCut",
        
        -- Notify
        "NotifyBackground",
        "NotifyERRORBorder",
        "NotifyWARNBorder",
        "NotifyINFOBorder",
        "NotifyDEBUGBorder",
        "NotifyTRACEBorder",
        "NotifyERRORBody",
        "NotifyWARNBody",
        "NotifyINFOBody",
        "NotifyDEBUGBody",
        "NotifyTRACEBody",
        
        -- DAP UI
        "DapUINormal",
        "DapUIFloatBorder",
        "DapUILineNumber",
        
        -- Toggle term
        "ToggleTermNormal",
        "ToggleTermBorder",
        
        -- Mason
        "MasonNormal",
        "MasonHeader",
        "MasonHighlight",
        "MasonHighlightBlock",
        "MasonHighlightBlockBold",
        "MasonHighlightBlockSecondary",
        "MasonHighlightSecondary",
        
        -- Lazy
        "LazyNormal",
        "LazyButton",
        "LazyButtonActive",
        "LazyH1",
        "LazyH2",
        "LazyProgressDone",
        "LazyProgressTodo",
        
        -- General UI
        "WinSeparator",
        "VertSplit",
        "Folded",
        "FoldColumn",
      },
      -- Groups you don't want to clear (keep their backgrounds)
      exclude_groups = {},
      -- Function to execute after highlight groups are cleared
      on_clear = function()
        -- You can add custom logic here if needed
        vim.cmd("highlight clear CursorLine")
        vim.cmd("highlight clear CursorColumn")
      end,
    })
    
    -- Set up transparency for dynamic plugins
    -- Clear prefixes for plugins that define highlights dynamically
    
    -- BufferLine (if you ever use it)
    require('transparent').clear_prefix('BufferLine')
    

    
    -- Neo-tree
    require('transparent').clear_prefix('NeoTree')
    
    -- Noice
    require('transparent').clear_prefix('Noice')
    
    -- Notify
    require('transparent').clear_prefix('Notify')
    
    -- WhichKey
    require('transparent').clear_prefix('WhichKey')
    
    -- Telescope
    require('transparent').clear_prefix('Telescope')
    
    -- CMP
    require('transparent').clear_prefix('Cmp')
    
    -- DAP
    require('transparent').clear_prefix('DapUI')
    
    -- Mason
    require('transparent').clear_prefix('Mason')
    
    -- Lazy
    require('transparent').clear_prefix('Lazy')
    
    -- Trouble
    require('transparent').clear_prefix('Trouble')
    
    -- GitSigns
    require('transparent').clear_prefix('GitSigns')
    
    -- IndentBlankline
    require('transparent').clear_prefix('IndentBlankline')
    
    -- TreesitterContext
    require('transparent').clear_prefix('TreesitterContext')
    
    -- Dashboard
    require('transparent').clear_prefix('Dashboard')
    
    -- ToggleTerm
    require('transparent').clear_prefix('ToggleTerm')
    
    -- Update theme to use transparency flag
    -- This will make your github_dark theme respect the transparency setting
    if vim.g.transparent_enabled then
      -- Re-apply colorscheme with transparency
      vim.cmd.colorscheme('github_dark_default')
    end
  end,
}