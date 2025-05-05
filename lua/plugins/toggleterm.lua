return {
  'akinsho/toggleterm.nvim',
  config = function()
    local toggleterm = require 'toggleterm'
    toggleterm.setup {
      direction = 'float',
      on_open = function()
        vim.cmd 'startinsert'
      end,
    }

    vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>')
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=tab<CR>')
    vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm size=120 direction=vertical<CR>')
    vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm size=15 direction=horizontal<CR>')
    vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>') -- forward window commands
    vim.keymap.set('t', '<C-e>', '<C-\\><C-n><cmd>ToggleTerm<CR>') -- use ctrl+e to toggle
    vim.keymap.set('n', '<C-e>', '<cmd>ToggleTerm<CR>') -- use ctrl+e to toggle

    -- keymap for lazygit
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
    vim.keymap.set('n', '<leader>lg', function()
      lazygit:toggle()
    end)
  end,
}
