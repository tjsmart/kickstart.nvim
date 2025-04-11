--------------------------------------------------------------------------------
-- INFO: [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Reload
vim.keymap.set('n', '<leader><leader>r', '<cmd>LspRestart<cr><cmd>edit!<cr>')

-- NOTE: window keymaps
--  See `:help wincmd` for a list of all window commands

vim.keymap.set('n', '<leader>-', '<cmd>split<cr>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>=', '<cmd>vsplit<cr>', { desc = 'Veritcal split' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Move focus from terminal window to the left window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Move focus from terminal window to the right window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Move focus from terminal window to the lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Move focus from terminal window to the upper window' })

vim.keymap.set('n', '<C-Down>', '<C-w>-', { desc = 'Descrease window height' })
vim.keymap.set('n', '<C-Up>', '<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Left>', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<C-w>>', { desc = 'Increase window width' })

vim.keymap.set('t', '<C-Down>', '<C-\\><C-n><C-w>-', { desc = 'Descrease terminal window height' })
vim.keymap.set('t', '<C-Up>', '<C-\\><C-n><C-w>+', { desc = 'Increase terminal window height' })
vim.keymap.set('t', '<C-Left>', '<C-\\><C-n><C-w><', { desc = 'Decrease terminal window width' })
vim.keymap.set('t', '<C-Right>', '<C-\\><C-n><C-w>>', { desc = 'Increase terminal window width' })
