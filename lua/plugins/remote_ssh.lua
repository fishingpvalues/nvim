return {
  'inhesrom/remote-ssh.nvim',
  name = 'remote-ssh',
  lazy = true, -- Set to true for lazy loading
  cmd = { 'RemoteSsh', 'RemoteSshEdit' }, -- Commands to trigger loading
  config = function()
    require('remote-ssh').setup({
      -- Your configuration options here
      -- Example:
      -- connections = {
      --   {
      --     name = "my_server",
      --     host = "user@your_remote_server_ip",
      --     path = "/path/to/project/on/remote",
      --     key_file = "~/.ssh/id_rsa", -- Optional: path to your SSH key
      --     port = 22, -- Optional: SSH port
      --   },
      -- },
      -- open_command = "e", -- Command to open files (e.g., 'e' for `:edit`, 'split' for `:split`)
      -- tmux = {
      --   enabled = true, -- Enable tmux integration
      --   pane_width = 80, -- Width of the tmux pane created
      -- },
    })
  end,
}