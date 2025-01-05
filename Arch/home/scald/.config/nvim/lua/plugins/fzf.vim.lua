-- [HB] The fzf.nvim plugin, to use :Files, :GFiles, etc.
return {
	"junegunn/fzf.vim",
	config = function()
		-- Optionally configure fzf.vim keybindings and settings
		vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', { noremap = true, silent = true })
	end,
}
