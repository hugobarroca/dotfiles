-- Map Ctrl + p to :Files
vim.keymap.set('n', '<Leader>p', ':Files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>a', ':vs<CR><C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>s', ':sp<CR><C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>o', ':RG!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>e', ':Explore<CR>', { noremap = true, silent = true })

-- LSP Settings
vim.keymap.set('n', '<Leader>.', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>f', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>t', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>,', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Old COC Settings, shouldn't be needed anymore...
-- vim.keymap.set('n', '<Leader>.', '<Plug>(coc-codeaction)', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Leader>t', '<Plug>(coc-rename)', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Leader>f', ':CocCommand editor.action.formatDocument<CR>', { noremap = true, silent = true })
