return {
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
}
