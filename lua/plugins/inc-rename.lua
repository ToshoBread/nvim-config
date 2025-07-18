return {
	{
		"smjonas/inc-rename.nvim",
		lazy = true,
		event = "BufRead",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("inc_rename").setup({})
		end,
	},
}
