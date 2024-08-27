return { 
	{
    		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = { "javascript", "typescript" }, -- Add other languages if needed
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
		}
	end
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
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
	} 
}
