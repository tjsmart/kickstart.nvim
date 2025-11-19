--------------------------------------------------------------------------------
-- INFO: [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Reload
vim.keymap.set('n', '<leader><leader>r', '<cmd>LspRestart<cr><cmd>edit!<cr>')
-- Edit config
vim.keymap.set('n', '<leader><leader>e', function()
  local initfile = vim.fn.stdpath 'config' .. '/init.lua'
  vim.cmd('e ' .. initfile)
end)

-- NOTE: window keymaps
--  See `:help wincmd` for a list of all window commands

vim.keymap.set('n', '<leader>-', '<cmd>split<cr>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>=', '<cmd>vsplit<cr>', { desc = 'Veritcal split' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-Down>', '<C-w>-', { desc = 'Descrease window height' })
vim.keymap.set('n', '<C-Up>', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Left>', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<C-w>>', { desc = 'Increase window width' })

vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true, desc = 'Forward window commands in terminal mode' })

vim.keymap.set('n', '<leader><leader>c', function()
  local cb = vim.opt.clipboard:get()
  if vim.tbl_contains(cb, 'unnamedplus') then
    vim.opt.clipboard = {}
    print '📋 Clipboard sync: OFF'
  else
    vim.opt.clipboard = { 'unnamedplus' }
    print '📋 Clipboard sync: ON'
  end
end, { desc = 'Toggle system clipboard' })
