-- Get comprehensive healthcheck output
vim.cmd('checkhealth')

-- Wait for healthcheck to complete
vim.wait(8000)

-- Find health buffer and write it
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  local bufname = vim.api.nvim_buf_get_name(buf)
  if bufname:match('health://') then
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local file = io.open('/storage/emulated/0/workdir/nvim/full_health_result.txt', 'w')
    for _, line in ipairs(lines) do
      file:write(line .. '\n')
    end
    file:close()
    print("Health check written to full_health_result.txt")
    break
  end
end

vim.cmd('quitall!')
