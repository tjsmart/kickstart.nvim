local function set_color(color)
  vim.cmd.colorscheme(color)
  vim.cmd 'highlight CursorLine ctermbg=NONE guibg=#1f081f'
  vim.cmd 'highlight Visual ctermbg=NONE guibg=#12123f'
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = false }, -- Disable italics in comments
          sidebars = 'transparent',
          floats = 'transparent',
        },
      }
      set_color 'tokyonight-night'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        disable_background = true,
        styles = {
          italic = false,
        },
      }
      -- set_color 'rose-pine'
    end,
  },
}
