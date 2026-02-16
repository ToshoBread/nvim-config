return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "master",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"query",
					"lua",
					"markdown",
					"markdown_inline",
					"typst",
				},

				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				modules = {},
				ignore_install = {},
			})
		end,
	},
}
