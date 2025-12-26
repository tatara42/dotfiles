vim.api.nvim_create_user_command('Config', function()
  local config_path = vim.fn.stdpath('config')
  vim.cmd('e ' .. config_path)
  -- vim.cmd('lcd ' .. config_path)
end, {
  desc = 'Open config directory',
})


