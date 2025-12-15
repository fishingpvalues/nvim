-- videre.nvim: Visual explorer for JSON/YAML files as graph
return {
  'Owen-Dechow/videre.nvim',
  dependencies = {
    -- Optional parsers for other filetypes
    { 'nvim-treesitter/nvim-treesitter', optional = true },
    -- Temporarily removing nvim-gql to avoid authentication issues
    -- 'esensar/nvim-gql', -- Optional but recommended for better query support
  },
  cmd = { 'Videre', 'VidereToggle' }, -- Commands to open videre
  opts = {
    -- Configuration options can be added here if needed
    -- For now, using defaults which are well-designed
  },
  keys = {
    { '<leader>vj', '<cmd>Videre<CR>', desc = 'Open Videre (JSON/YAML explorer)' },
  },
}