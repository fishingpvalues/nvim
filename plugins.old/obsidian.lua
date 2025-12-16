-- obsidian.nvim: Obsidian integration for note-taking
return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- Recommended: use latest release
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- Required
  },
  keys = {
    { "<leader>on", desc = "Obsidian: New Note" },
    { "<leader>oo", desc = "Obsidian: Open" },
    { "<leader>os", desc = "Obsidian: Search" },
    { "<leader>oq", desc = "Obsidian: Quick Switch" },
    { "<leader>ob", desc = "Obsidian: Backlinks" },
    { "<leader>ot", desc = "Obsidian: Tags" },
    { "<leader>od", desc = "Obsidian: Today" },
    { "<leader>oy", desc = "Obsidian: Yesterday" },
    { "<leader>ow", desc = "Obsidian: Tomorrow" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian/personal",
      },
      {
        name = "work",
        path = "~/Documents/obsidian/work",
      },
    },
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      template = nil,
    },
    completion = {
      nvim_cmp = false,  -- Using blink.cmp instead
      min_chars = 2,
    },
    mappings = {},
    new_notes_location = "current_dir",
    wiki_link_func = "use_alias_only",
    markdown_link_func = function(opts)
      return string.format("[%s](%s)", opts.label, opts.path)
    end,
    preferred_link_style = "markdown",
    disable_frontmatter = false,
    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
    follow_url_func = function(url)
      vim.fn.jobstart({"xdg-open", url})  -- Linux
    end,
    ui = {
      enable = true,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
  },
}
