return {
	{ "tpope/vim-fugitive" },
	-- Necessary because Roslyn uses a non-standard method of initializing communications with the LSP CLient and requires additional non-standard integrations.
	{
		"seblj/roslyn.nvim",
		ft = "cs",
		opts = {
			-- your configuration comes here; leave empty for default settings
		}
	}

}
