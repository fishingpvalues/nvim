-- ============================================================================
-- Neovim Options - SOTA Configuration
-- ============================================================================

local opt = vim.opt
local g = vim.g

-- General
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000
opt.updatetime = 200 -- Faster completion
opt.timeoutlen = 300

-- UI
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes" -- Always show sign column
opt.cursorline = true -- Highlight current line
opt.termguicolors = true -- True color support
opt.showmode = false -- Don't show mode (lualine shows it)
opt.cmdheight = 1
opt.pumheight = 15 -- Popup menu height
opt.pumblend = 10 -- Popup transparency
opt.winblend = 10 -- Window transparency
opt.scrolloff = 8 -- Lines to keep above/below cursor
opt.sidescrolloff = 8 -- Columns to keep left/right of cursor
opt.wrap = false -- Disable line wrap
opt.linebreak = true -- Wrap on word boundary
opt.list = true -- Show some invisible characters
opt.listchars = {
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
  extends = "»",
  precedes = "«",
}
opt.fillchars = {
  eob = " ", -- Remove ~ from end of buffer
  fold = " ",
  foldopen = "▾",
  foldsep = " ",
  foldclose = "▸",
}

-- Search
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Don't ignore case with capitals
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Indentation
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent to multiple of shiftwidth

-- Splits
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.splitkeep = "screen" -- Keep text on screen when splitting

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Performance
opt.lazyredraw = false
opt.synmaxcol = 240 -- Max column for syntax highlight

-- Backup and swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Spell
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")

-- Misc
opt.confirm = true -- Confirm before closing unsaved buffers
opt.formatoptions = "jcroqlnt" -- tcqj
opt.conceallevel = 2 -- Hide * markup for bold and italic
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

-- Fix markdown indentation
g.markdown_recommended_style = 0
