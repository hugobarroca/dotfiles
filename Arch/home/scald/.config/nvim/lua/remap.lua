-- Mapping to open File Search window
vim.keymap.set('n', '<Leader>p', ':Files<CR>', { noremap = true, silent = true })
-- Mapping to vertically split a new pane
vim.keymap.set('n', '<Leader>a', ':vs<CR><C-w>l', { noremap = true, silent = true })
-- Mapping to horizontally split a new pane
vim.keymap.set('n', '<Leader>s', ':sp<CR><C-w>j', { noremap = true, silent = true })
-- Mapping to search with RIPGREP
vim.keymap.set('n', '<Leader>o', ':RG!<CR>', { noremap = true, silent = true })
-- Mapping to open Explorer with relative numbers
vim.keymap.set('n', '<Leader>e', ':Explore<CR>:set relativenumber<CR>:set number<CR>', { noremap = true, silent = true })

-- LSP Settings
-- Shortcut for LSP Code Actions
vim.keymap.set('n', '<Leader>.', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
-- Shortcut for formatting the whole document
vim.keymap.set('n', '<Leader>f', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
-- Shortcut for renaming (refactor renaming)
vim.keymap.set('n', '<Leader>t', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
-- Shortcut for opening a new hovering window with error messages.
vim.keymap.set('n', '<Leader>,', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
-- Shortcut for going to the implementation of a symbol
vim.keymap.set('n', '<F10>', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
-- Shortcut for going to the definition of a symbol
vim.keymap.set('n', '<F11>', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
-- Shortcut for opening error in float
vim.keymap.set('n', '<Leader>k', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
