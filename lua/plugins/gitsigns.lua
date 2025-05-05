return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require 'gitsigns'
    gitsigns.setup()

    vim.keymap.set('n', '<leader>hs', gitsigns.preview_hunk)
    vim.keymap.set('n', '<leader>hp', function()
      gitsigns.nav_hunk 'prev'
    end)

    vim.keymap.set('n', '<leader>hn', function()
      gitsigns.nav_hunk 'next'
    end)
  end,
}
