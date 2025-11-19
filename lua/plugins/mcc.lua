local function run_with(index)
  local mcc = require 'mcc'
  return function()
    mcc.run(index)
  end
end

return {
  dir = '/home/tsmart/Work/tjsmart/mcc.nvim',
  opts = {},
  config = function()
    local mcc = require 'mcc'
    mcc.setup()
    vim.keymap.set({ 'n', 't' }, '<C-e>', mcc.terminal)

    vim.keymap.set({ 'n', 't' }, '<C-m>e', mcc.editor)

    vim.keymap.set({ 'n', 't' }, '<C-m>1', run_with(1))
    vim.keymap.set({ 'n', 't' }, '<C-m>2', run_with(2))
    vim.keymap.set({ 'n', 't' }, '<C-m>3', run_with(3))
    vim.keymap.set({ 'n', 't' }, '<C-m>4', run_with(4))
    vim.keymap.set({ 'n', 't' }, '<C-m>5', run_with(5))
    vim.keymap.set({ 'n', 't' }, '<C-m>r', mcc.rerun)

    vim.keymap.set({ 'n', 't' }, '<C-m>n', mcc.notes)

    local Terminal = require('mcc.terminal').Terminal
    local lg = Terminal:new { cmd = 'lazygit' }
    vim.keymap.set('n', '<leader>lg', function()
      lg:toggle()
    end)
  end,
}
