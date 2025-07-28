return {
  {
    'github/copilot.vim',
    config = function()
      -- I'm not insane
      vim.g.copilot_no_tab_map = true

      -- Global Copilot mappings
      vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("<CR>")', { expr = true, silent = true, script = true })
      vim.api.nvim_set_keymap('i', '<Left>', 'copilot#Dismiss()', { expr = true, silent = true, script = true })
      vim.api.nvim_set_keymap('i', '<S-Right>', 'copilot#Next()', { expr = true, silent = true, script = true })
      vim.api.nvim_set_keymap('i', '<S-Left>', 'copilot#Previous()', { expr = true, silent = true, script = true })
      vim.api.nvim_set_keymap('i', '<M-Right>', 'copilot#Suggest()', { expr = true, silent = true, script = true })

      -- Attempt to resurrect right/left mappings in telescope
      vim.g.copilot_filetypes = {
        TelescopePrompt = false,
        TelescopeResults = false,
      }
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'TelescopePrompt', 'TelescopeResults' },
        callback = function()
          vim.keymap.set('i', '<Right>', '<Right>', { buffer = true }) -- restore normal key
          vim.keymap.set('i', '<Left>', '<Left>', { buffer = true })
          vim.keymap.set('i', '<S-Right>', '<S-Right>', { buffer = true })
          vim.keymap.set('i', '<S-Left>', '<S-Left>', { buffer = true })
          vim.keymap.set('i', '<M-Right>', '<M-Right>', { buffer = true })
        end,
      })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    keys = {
      { '<leader>cc', '<cmd>CopilotChat<cr>', desc = 'Copilot Chat' },
      { '<leader>cC', '<cmd>CopilotChatClear<cr>', desc = 'Copilot Chat Clear' },
      { '<leader>cR', '<cmd>CopilotChatReload<cr>', desc = 'Copilot Chat Reload' },
    },
  },
}
