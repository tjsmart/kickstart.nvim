-- File explorer
-- https://github.com/stevearc/oil.nvim

return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    local oil = require 'oil'
    oil.setup {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['<CR>'] = 'actions.select',
        ['<C-p>'] = false,
        ['<C-h>'] = false,
        -- ['<leader>='] = { 'actions.select', opts = { vertical = true } },
        -- ['<leader>-'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<C-s>'] = 'actions.preview',
        ['<C-c>'] = false,
        ['<C-l>'] = false,
        ['<C-r>'] = 'actions.refresh',
        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
      },
    }

    vim.keymap.set('n', '<leader>E', function()
      require('oil').open '.'
    end)
    vim.keymap.set('n', '<leader>e', require('oil').open)
  end,
}
