return {
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
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
      -- vim.keymap.set('n', '<leader>hn', '<cmd>Gitsigns next_hunk<cr>')
      -- vim.keymap.set('n', '<leader>ha', '<cmd>Gitsigns diffthis<cr>')
    end,
  },
}
