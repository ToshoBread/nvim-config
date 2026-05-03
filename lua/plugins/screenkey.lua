return {
	{
		"NStefan002/screenkey.nvim",
		config = function()
			require("screenkey").setup({
				group_mappings = true,
			})
		end,
	},
}
