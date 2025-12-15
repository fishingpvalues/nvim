# Neovim Configuration

This directory contains a highly customized Neovim configuration. It is designed to be a powerful and flexible development environment for a variety of programming languages.

## Project Overview

The configuration is written in Lua and is structured around the `lazy.nvim` plugin manager. The main entry point is `init.lua`, which sets up basic options and keymaps. All plugins are configured in a modular way in the `lua/plugins/` directory.

Key features of this configuration include:

*   **Extensive Language Support:** The configuration includes support for a wide range of languages through `nvim-lspconfig` and `nvim-treesitter`. This includes, but is not limited to, Go, Python, Java, JavaScript, TypeScript, Rust, C/C++, and more.
*   **Modern UI:** The UI is enhanced with plugins like `neo-tree.nvim` for a file explorer, `which-key.nvim` for keymap hints, and a custom theme.
*   **Powerful Editing Features:** The configuration includes advanced editing features like autocompletion (`blink.cmp`), text objects (`nvim-treesitter-textobjects`), and fuzzy finding (`telescope.nvim`).

## Building and Running

This is a Neovim configuration, so there is no build process. To use this configuration, you need to have Neovim installed and clone this repository to the correct location (usually `~/.config/nvim`).

### Plugin Management

The `lazy.nvim` plugin manager is used to manage plugins. Here are some useful commands:

*   `:Lazy` - Open the `lazy.nvim` interface to view the status of your plugins.
*   `:Lazy update` - Update all plugins.
*   `:Lazy sync` - Sync all plugins, installing new ones and removing unused ones.

### Adding New Plugins

To add a new plugin, create a new Lua file in the `lua/plugins/` directory with the plugin's configuration. The file should return a table that follows the `lazy.nvim` specification. For example:

```lua
-- lua/plugins/my-plugin.lua
return {
  'user/repo',
  -- lazy.nvim options
  event = 'VimEnter', -- or other event
  dependencies = {
    -- other plugins
  },
  config = function()
    -- plugin setup
  end,
}
```

## Development Conventions

The configuration is well-structured and follows a modular design pattern. When adding new plugins or modifying existing ones, it is important to maintain this structure.

*   **Plugin Configuration:** All plugin configuration should be done in the `lua/plugins/` directory.
*   **Keymaps:** Keymaps should be defined within the plugin's configuration file, or in `init.lua` for global keymaps.
*   **LSP Configuration:** LSP servers are configured in `lua/plugins/lspconfig.lua`. To add support for a new language, add a new server configuration to the `servers` table.
*   **Treesitter Parsers:** To add a new Treesitter parser, add it to the `ensure_installed` list in `lua/plugins/nvim_treesitter.lua`.
