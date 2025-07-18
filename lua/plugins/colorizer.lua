vim.opt.termguicolors = true
return {
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufEnter",
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
