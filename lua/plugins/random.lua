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

  {
    'jiaoshijie/undotree',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local undotree = require 'undotree'
      undotree.setup()
      vim.keymap.set('n', '<leader>u', undotree.toggle)
    end,
  },
}
