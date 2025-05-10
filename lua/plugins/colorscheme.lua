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
	{
		"dgox16/oldworld.nvim",
		name = "oldworld",
		config = function()
			require("oldworld").setup({
				terminal_colors = true, -- enable terminal colors
				variant = "default", -- default, oled, cooler
				styles = { -- You can pass the style using the format: style = true
					comments = {}, -- style for comments
					keywords = {}, -- style for keywords
					identifiers = {}, -- style for identifiers
					functions = {}, -- style for functions
					variables = {}, -- style for variables
					booleans = {}, -- style for booleans
				},
				integrations = { -- You can disable/enable integrations
					alpha = true,
					cmp = true,
					flash = true,
					gitsigns = true,
					hop = false,
					indent_blankline = true,
					lazy = true,
					lsp = true,
					markdown = true,
					mason = true,
					navic = false,
					neo_tree = false,
					neogit = false,
					neorg = false,
					noice = true,
					notify = true,
					rainbow_delimiters = true,
					telescope = true,
					treesitter = true,
				},
				highlight_overrides = {},
			})
		end,
	},
	{
		"samharju/synthweave.nvim",
		name = "synthweave",
		config = function()
			local synthweave = require("synthweave")

			synthweave.setup({
				transparent = true,
			})

			synthweave.load()
		end,
	},
}
