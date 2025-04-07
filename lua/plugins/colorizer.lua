vim.opt.termguicolors = true
return {
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			["*"] = {
				names = true,
				RRGGBBAA = true,
				hsl_fn = true,
				css = true,
				mode = "background",
			},
		},
	},
}
