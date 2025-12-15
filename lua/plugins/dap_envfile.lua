return {
  "ravsii/nvim-dap-envfile",
  version = "*", -- use latest stable release
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    -- Automatically adds a dap on_config listener
    add_dap_listener = true,
    -- Also sets environment variables using Neovim API
    use_neovim_env = true,
    -- Print additional debug messages
    debug = false,
  },
  config = function(_, opts)
    require("nvim-dap-envfile").setup(opts)
    
    -- Example configurations for different languages
    local dap = require("dap")
    
    -- Go configuration with envFile support
    if not dap.configurations.go then
      dap.configurations.go = {}
    end
    
    table.insert(dap.configurations.go, {
      name = "Launch with .env",
      type = "go",
      request = "launch",
      program = "${file}",
      envFile = "${workspaceFolder}/.env",
      console = "integratedTerminal",
    })
    
    -- Python configuration with envFile support
    if not dap.configurations.python then
      dap.configurations.python = {}
    end
    
    table.insert(dap.configurations.python, {
      name = "Launch with .env",
      type = "python",
      request = "launch",
      program = "${file}",
      envFile = "${workspaceFolder}/.env",
      console = "integratedTerminal",
      pythonPath = function()
        return "/usr/bin/python3"
      end,
    })
    
    -- Node.js configuration with envFile support
    if not dap.configurations.javascript then
      dap.configurations.javascript = {}
    end
    
    table.insert(dap.configurations.javascript, {
      name = "Launch Node.js with .env",
      type = "node2",
      request = "launch",
      program = "${file}",
      envFile = "${workspaceFolder}/.env",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
    })
    
    -- Rust configuration with envFile support
    if not dap.configurations.rust then
      dap.configurations.rust = {}
    end
    
    table.insert(dap.configurations.rust, {
      name = "Launch with .env",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/")
      end,
      envFile = "${workspaceFolder}/.env",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    })
    
    -- Add to which-key for discoverability
    local wk = require("which-key")
    wk.add({
      { "<leader>d", group = "debug", icon = "🐛" },
      { "<leader>de", desc = "Debug with .env file" },
    })
  end,
}