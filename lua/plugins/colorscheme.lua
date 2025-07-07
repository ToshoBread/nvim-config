return {
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
	},
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
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				-- transparent_background = true,
				styles = {
					comments = { "italic" },
				},
			})
		end,
	},
}
