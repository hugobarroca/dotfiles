-- vim.opt is a table-like object to set nvim options in lua
-- You could also use vim.o (behaves like vimscript set)
-- The runtimepath option is the path where nvim will look for configuration files.
vim.opt.runtimepath:append(vim.fn.expand('~/.vim'))
vim.opt.runtimepath:append(vim.fn.expand('~/.vim/after'))


-- Set packpath to match runtimepath
vim.opt.packpath = vim.opt.runtimepath:get()
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3

-- Define custom signs for breakpoints
vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '💬', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➡️', texthl = '', linehl = 'Visual', numhl = '' })

-- Add lazy.nvim
require "config.lazy"
require "remap"

vim.cmd 'syntax on'
vim.cmd 'colorscheme retrobox'
