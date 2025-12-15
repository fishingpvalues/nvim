## SOTA Dashboard Configuration Guide

You now have two dashboard options available:

### 1. snacks.nvim (currently active)
- Located in `lua/plugins/snacks_dashboard.lua`
- Provides a floating-style dashboard with sections
- Enabled by default in your config

### 2. dashboard-nvim (newly configured)
- Located in `lua/plugins/dashboard_nvim.lua`
- Features: widescreen layout, Git integration, ASCII art, shortcuts for tools
- Uses the "hyper" theme with wide-screen horizontal sections
- Includes shortcuts for Yazi, Lazy, Mason, and more

### How to Switch Between Dashboards

To use the new SOTA dashboard-nvim instead of snacks:

1. **Disable snacks dashboard**: Edit `lua/plugins/snacks_dashboard.lua` and set:
   ```lua
   dashboard = { enabled = false },
   ```

2. **Ensure dashboard-nvim is enabled**: It's already configured in `lua/plugins/dashboard_nvim.lua`

3. **For transparency support**: The transparent.nvim config already includes dashboard support, so your transparency settings will work with both.

### Features of the New Dashboard-nvim Setup:

- **Widescreen layout**: Horizontal sections for projects and MRU files
- **Git integration**: Auto-detects Git roots for projects
- **ASCII art headers**: Random cat/github ASCII art on startup
- **Quick shortcuts**: 
  - f: Yazi file manager
  - p: Lazy plugin manager
  - m: Mason LSP manager
  - r: Recent files
  - d: Recent folders
  - n: New file
  - q: Quit
- **Week header**: Shows current date and system info
- **Plugin count**: Shows number of loaded plugins
- **Transparency**: Works with your transparent.nvim setup

### Optional: Keep Both (Advanced Configuration)

If you want to occasionally switch between dashboards, you can create a toggle function in your init.lua:

```lua
-- Toggle between dashboard systems
function ToggleDashboard()
  if package.loaded['dashboard'] then
    -- If dashboard-nvim is loaded, do nothing or reload
    print("Using dashboard-nvim")
  elseif package.loaded['snacks'] then
    -- If snacks is loaded, you're using snacks dashboard
    print("Using snacks dashboard")
  end
end
```

### Recommended: Single Dashboard Approach

For the cleanest setup, we recommend using one dashboard system. Since dashboard-nvim was specifically configured for SOTA features (widescreen layout, ASCII art, etc.), you may want to:

1. Disable the snacks dashboard by setting `dashboard = { enabled = false },` in `lua/plugins/snacks_dashboard.lua`
2. Keep the snacks.nvim plugin for other features (quickfile, dim, bigfile, etc.) but without the dashboard
3. Enjoy the enhanced dashboard-nvim configuration

The installation is complete! You can now choose which dashboard to use based on your preferences.