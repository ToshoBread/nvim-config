return {
	{
		"rose-pine/nvim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main", -- main, moon, dawn
				extend_background_behind_borders = true,
				styles = {
					italic = false,
					transparency = true,
				},
			})
		end,
	},
}
