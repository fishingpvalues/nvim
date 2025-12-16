-- Better user experience for marks
-- GitHub: https://github.com/chentoast/marks.nvim
return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  config = function()
    require('marks').setup({
      -- whether to map keybinds or not. default true
      default_mappings = true,
      -- which builtin marks to show. default {}
      builtin_marks = { '.', '<', '>', '^' },
      -- whether movements cycle back to the beginning/end of buffer. default true
      cyclic = true,
      -- whether the shada file is updated after modifying uppercase marks. default false
      force_write_shada = false,
      -- how often (in ms) to redraw signs/recompute mark positions.
      -- higher values will have better performance but may cause visual lag,
      -- while lower values may cause performance penalties. default 150.
      refresh_interval = 250,
      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
      -- marks, and bookmarks.
      -- can be either a table with all/some of the keys, or a single number, in which case
      -- all priorities default to that value
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      -- disables mark state for files with these extensions. Defaulted to whitelist
      -- usage example: blacklist = { 'md', 'txt' }
      blacklist = {},
      -- blacklist = { "*.md" },
      -- disables mark state for buffers with these filetype. Defaulted to whitelist
      -- usage example: blacklist_filetypes = {}
      blacklist_filetypes = {},
      -- defines what bookmarks like mK, mP, etc do locally and globally. For local markers use "buffer".
      bookmarks = { a = "/tmp/marked.txt" },
      -- which key to use for calling mark placement. default 'm'. the 'deeper' the yoga,
      -- the faster you'll be able to place marks with repeat(...). also, 'true' acts as m
      mappings = {},
    })
  end,
}
