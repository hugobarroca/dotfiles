return {
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = { "javascript", "typescript" }, -- Add other languages if needed
				highlight = {
					enable = true, -- Enable syntax highlighting
				},
			}
		end
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
