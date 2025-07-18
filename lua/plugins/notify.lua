return {
	{
		"rcarriga/nvim-notify",
		lazy = true,
		config = function()
			require("notify").setup({
				render = "minimal",
				timeout = 2500,
				maximum_width = 50,
				minimum_width = 10,
				top_down = true,
				background_colour = "#0f0f0f",
				merge_duplicates = true,
			})
		end,
	},
}
