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
vim.g.netrw_liststyle = 3

-- Add lazy.nvim
require "config.lazy"

-- Map Ctrl + p to :Files
vim.keymap.set('n', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-a>', ':vs<CR><C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>', ':sp<CR><C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-o>', ':RG!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-e>', ':Explore<CR>', { noremap = true, silent = true })

vim.cmd 'syntax on'
vim.cmd 'colorscheme retrobox'
-- Source ~/.vimrc
-- vim.cmd('source ~/.vimrc')


