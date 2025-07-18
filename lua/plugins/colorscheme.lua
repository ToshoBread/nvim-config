return {
	{

		"datsfilipe/vesper.nvim",
		name = "vesper",
		config = function()
			require("vesper").setup({
				transparent = true,
				italics = {
					comments = true,
					keyword = false,
					functions = false,
					strings = false,
					variables = false,
				},
				overrides = { String = { fg = "#bf976f" } },
			})
		end,
	},
	{
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
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				no_italic = true,
				styles = {
					comments = { "italic" },
				},
			})
		end,
	},
}
