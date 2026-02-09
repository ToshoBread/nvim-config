return {
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		config = function()
			vim.g.gruvbox_material_enable_italic = false
			vim.g.gruvbox_material_background = "light"
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = { italic = false, bold = true },
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				theme = "wave", -- wave | dragon | lotus
				-- background = { -- map the value of 'background' option to a theme
				-- 	dark = "wave", -- try "dragon" !
				-- 	light = "lotus",
				-- },
			})
		end,
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
				transparent_background = true,
				styles = {
					comments = { "italic" },
				},
			})
		end,
	},
}
