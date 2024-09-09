-- Update runtimepath
vim.opt.runtimepath:append(vim.fn.expand('~/.vim'))
vim.opt.runtimepath:append(vim.fn.expand('~/.vim/after'))

-- Set packpath to match runtimepath
vim.opt.packpath = vim.opt.runtimepath:get()
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.tabstop=4
vim.opt.softtabstop=2
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3

-- Define custom signs for breakpoints
vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🟡', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='💬', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='Visual', numhl=''})

-- Add lazy.nvim
require "config.lazy"

-- Map Ctrl + p to :Files
vim.keymap.set('n', '<Leader>p', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>a', ':vs<CR><C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>s', ':sp<CR><C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>o', ':RG!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>e', ':Explore<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>.', '<Plug>(coc-codeaction)', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>t', '<Plug>(coc-rename)', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>f', ':CocCommand editor.action.formatDocument<CR>', { noremap = true, silent = true })

vim.cmd 'syntax on'
vim.cmd 'colorscheme retrobox'

