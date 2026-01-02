-- Detailed health check script
local health_output = {}

-- Function to capture health check output
local function run_health_check(module_name)
  table.insert(health_output, "\n=== Checking " .. module_name .. " ===")
  
  -- Try to run the health check and capture any errors
  local ok, result = pcall(function()
    local output = vim.fn.execute('checkhealth ' .. module_name)
    return output
  end)
  
  if ok then
    table.insert(health_output, result)
  else
    table.insert(health_output, "Error running checkhealth " .. module_name .. ": " .. tostring(result))
  end
end

-- Run health checks for important modules
run_health_check("vim.lsp")
run_health_check("vim.treesitter")
run_health_check("lazy")
run_health_check("provider")
run_health_check("mason")
run_health_check("blink.cmp")

-- Write to file
local file = io.open("/storage/emulated/0/workdir/nvim/detailed_health_output.txt", "w")
if file then
  for _, line in ipairs(health_output) do
    file:write(line .. "\n")
  end
  file:close()
end

vim.cmd("quit")