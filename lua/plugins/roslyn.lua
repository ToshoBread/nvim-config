return {
	{
		"seblyng/roslyn.nvim",
		config = function()
			require("roslyn").setup({
				broad_search = true,
				lock_target = true,
			})
		end,
	},
}
