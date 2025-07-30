-- This file is loaded by init.lua, it will scan and load modules which are dropped in this directory.
--
local ok, scandir = pcall(require, 'plenary.scandir')
if not ok then
  vim.notify('custom/init.lua requires plenary.nvim', vim.log.levels.ERROR)
  return
end

local modules = scandir.scan_dir(vim.fn.stdpath 'config' .. '/lua/custom', {
  depth = 1,
  only_dirs = true,
})

local err
for _, mod_path in ipairs(modules) do
  local mod_name = vim.fn.fnamemodify(mod_path, ':t') -- get directory name
  ok, err = pcall(require, 'custom.' .. mod_name)
  if not ok then
    vim.notify('Error loading custom.' .. mod_name .. ': ' .. err, vim.log.levels.ERROR)
  end
end
