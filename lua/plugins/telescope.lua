-- Fuzzy Finder (files, lsp, etc)
--
-- Telescope is a fuzzy finder that comes with a lot of different things that
-- it can fuzzy find! It's more than just a "file finder", it can search
-- many different aspects of Neovim, your workspace, LSP, and more!
--
-- The easiest way to use Telescope, is to start by doing something like:
--  :Telescope help_tags

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  -- TODO: change to stable release, using master for now because of
  --       https://github.com/nvim-telescope/telescope.nvim/issues/3439
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {}

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    local picker_opts = require('telescope.themes').get_ivy { hidden = false }
    vim.keymap.set('n', '<C-f>', function()
      builtin.live_grep(picker_opts)
    end, { desc = 'Find text' })
    vim.keymap.set('n', '<C-p>', function()
      builtin.find_files(picker_opts)
    end, { desc = 'Find file' })

    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find commands' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find resume last session' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find in help' })
    vim.keymap.set('n', '<leader>fa', builtin.builtin, { desc = 'Find all builtins' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find current word' })
    vim.keymap.set(
      'n',
      '<leader>fp',
      '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,/home/tsmart/work/npsg-internal-tools<CR>',
      { desc = 'Find file in all projects' }
    )
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find file in nvim config' })

    -- TODO: this is cool, but not sure yet if I would use it...
    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
  end,
}
