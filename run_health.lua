-- Run healthchecks and write to file
local output_file = "/storage/emulated/0/workdir/nvim/health_output.txt"
local file = io.open(output_file, "w")

-- Capture print output
local original_print = print
local function capture_print(...)
  local args = {...}
  local msg = table.concat(vim.tbl_map(tostring, args), "\t")
  file:write(msg .. "\n")
  file:flush()
end
print = capture_print

-- Run vim.health checks
local modules = {
  "vim.lsp",
  "vim.treesitter",
  "lazy",
  "provider",
}

for _, module in ipairs(modules) do
  file:write("\n=== Checking " .. module .. " ===\n")
  file:flush()
  local ok, err = pcall(function()
    vim.cmd("checkhealth " .. module)
  end)
  if not ok then
    file:write("Error: " .. tostring(err) .. "\n")
    file:flush()
  end
end

file:write("\n=== Health check complete ===\n")
file:close()
print = original_print

vim.cmd("quit")
