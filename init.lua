--[[

=====================================================================
==================== Tyler Smart's neovim config ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||        NVIM        ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||                    ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

A fork of https://github.com/nvim-lua/kickstart.nvim

-- ]]

-- INFO: [[ Globals ]]
-- Must happen before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- INFO: [[ Configuration ]]
-- All other configuration options are delegated to other files, required below
require 'options'
require 'keymaps'
require 'autocommands'
require 'lazy-init'

-- TODO: Find a home and/or a better way to do this (needs to be done after color), vim.schedule?
vim.cmd 'highlight CursorLine ctermbg=NONE guibg=#1f081f'
vim.cmd 'highlight Visual ctermbg=NONE guibg=#12123f'
