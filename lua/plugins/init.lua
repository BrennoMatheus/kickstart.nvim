local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'

for _, file in ipairs(vim.fn.readdir(plugin_dir, 1)) do
  local module_name = file:gsub('%.lua$', '')

  if module_name ~= 'init' then
    require('plugins.' .. module_name)
  end
end
