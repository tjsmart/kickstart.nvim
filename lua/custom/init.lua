-- This file is loaded by init.lua, it will scan and load modules which are dropped in this directory.
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

-- In addition, check for a .nvim.lua file in the current working directory.
-- If it exists, it will load it.
local cwd_nvim = vim.fn.getcwd() .. '/.nvim.lua'
if vim.fn.filereadable(cwd_nvim) == 1 then
  local cwd_nvim_config = loadfile(cwd_nvim)
  if cwd_nvim_config then
    ok, err = pcall(cwd_nvim_config)
    if not ok then
      vim.notify('Error loading .nvim.lua: ' .. err, vim.log.levels.ERROR)
    end
  else
    vim.notify('Could not load .nvim.lua', vim.log.levels.ERROR)
  end
end
