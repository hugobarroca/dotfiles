return {
	'neovim/nvim-lspconfig',
	config = function()
		local lspconfig = require('lspconfig')
		-- Configure JSON ??
		lspconfig.jsonls.setup {
			on_attach = function(client, bufnr)
				-- Your on_attach function here (e.g., key mappings)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local opts = { noremap = true, silent = true }

				buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				-- Add more key mappings as needed
			end,
			flags = {
				debounce_text_changes = 150,
			},
			settings = {
				json = {
					schemas = {
						{
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json",
						},
						{
							fileMatch = { "tsconfig.json" },
							url = "https://json.schemastore.org/tsconfig.json",
						},
						-- Add more schemas as needed
					},
					validate = { enable = true },
				},
			},
		}
		-- Configure the Svelte language server
		lspconfig.svelte.setup {
			on_attach = function(client, bufnr)
				-- Your on_attach function here (e.g., key mappings)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local opts = { noremap = true, silent = true }

				buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				-- Add more key mappings as needed
			end,
			flags = {
				debounce_text_changes = 150,
			},
		}
		lspconfig.bashls.setup {
			cmd = { "bash-language-server", "start" },
			filetypes = { "sh", "bash" },
			root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
			settings = {
				bash = {
					-- Add any specific settings for bash-language-server here
				}
			},
			on_attach = function(client, bufnr)
				-- You can add key mappings or other setup here
				-- Example: vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
			end,
		}
		-- Configure the CSS language server
		lspconfig.cssls.setup {
			on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local opts = { noremap = true, silent = true }

				buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				-- Add more key mappings as needed
			end,
			flags = {
				debounce_text_changes = 150,
			},
		}
		-- Configure the TypeScript language server
		-- Configure the TypeScript language server (ts_ls)
		lspconfig.ts_ls.setup {
			on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local opts = { noremap = true, silent = true }

				buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				-- Add more key mappings as needed
			end,
			flags = {
				debounce_text_changes = 150,
			},
			-- You can add additional settings for ts_ls here if needed
		}

		-- Configure the Lua language server (lua_ls)
		lspconfig.lua_ls.setup {
			on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local opts = { noremap = true, silent = true }

				buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				-- Add more key mappings as needed
			end,
			flags = {
				debounce_text_changes = 150,
			},
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }, -- Add any global variables you want to recognize
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true), -- Make Neovim runtime files available
					},
				},
			},
		}
	end,
}
