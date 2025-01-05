-- [HB] Mason allows you to install LSPs and DAPs more easily. Also linters and the like.
return
{
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end,
}
