return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')
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
			-- Configure the C# language server (csharp_ls)
			lspconfig.csharp_ls.setup {
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
				root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
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
	},
	-- IMPORTANT! Most syntax highlighting actually comes from TreeSitter.
	-- Make sure to include all languages you need here!
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = { "javascript", "typescript", "svelte", "css" }, -- Add other languages if needed
				highlight = {
					enable = true,                  -- Enable syntax highlighting
				},
			}
		end
	},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				snippet = {
					expand = function(args)
						-- For vsnip users
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.close(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				},
				sources = {
					{ name = 'nvim_lsp' }, -- LSP source
					{ name = 'buffer' }, -- Buffer source
					-- Add other sources as needed
				},
			})
		end,
	},
	-- [HB] This plugin allows simpler usage of ripgrep within Neovim. :!RG
	"duane9/nvim-rg",
	-- [HB] Mason allows you to install LSPs and DAPs more easily. Also linters and the like.
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- [HB] This ensures fzf is installed in the system. If it is not, then lazy.vim will install it automatically.
	"junegunn/fzf",
	-- [HB] The fzf.nvim plugin, to use :Files, :GFiles, etc.
	{
		"junegunn/fzf.vim",
		config = function()
			-- Optionally configure fzf.vim keybindings and settings
			vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', { noremap = true, silent = true })
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require('dap')

			-- Configuration for the DAP adapter for .NET Core debugging using netcoredbg
			dap.adapters.coreclr = {
				type = 'executable',
				command = 'C:\\Users\\HMB\\AppData\\Local\\nvim-data\\mason\\bin\\netcoredbg.cmd',
				args = { '--interpreter=vscode' }
			}

			-- Configuration for the DAP adapter for C debugging
			dap.adapters.cppdbg = {
				id = 'cppdbg',
				type = 'executable',
				command =
				'/home/scald/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
			}

			-- Configuration for launching .NET Core applications with netcoredbg in DAP
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/',
							'file')
					end,
				},
			}
			dap.configurations.c = {
				{
					name = "Launch",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
							'file')
					end,
					cwd = '${workspaceFolder}',
					stopAtEntry = true,
					setupCommands = {
						{
							text = '-enable-pretty-printing',
							description = 'enable pretty printing',
							ignoreFailures = false
						},
					},
				},
			}
		end
	},
	{
		"julianolf/nvim-dap-lldb",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	},
	{ "tpope/vim-fugitive" }

}
