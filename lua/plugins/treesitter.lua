return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"query",
				"lua",
				"markdown",
				"markdown_inline",
				"typst",
			},
		},
	},
}
