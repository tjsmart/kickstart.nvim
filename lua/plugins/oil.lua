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
    }

    vim.keymap.set('n', '<leader>E', function()
      require('oil').open '.'
    end)
    vim.keymap.set('n', '<leader>e', require('oil').open)
  end,
}
