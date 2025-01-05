return {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { "javascript", "typescript", "svelte", "css", "c_sharp" }, -- Add other languages if needed
			highlight = {
				enable = true,                                     -- Enable syntax highlighting
			},
		}
	end
}
