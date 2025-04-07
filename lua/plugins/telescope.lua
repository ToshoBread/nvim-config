return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					border = true,
					winblend = 0,
					file_ignore_pattens = {
						"node_modules",
						".git/",
						"build",
						"dist",
						"LICENSE",
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
			})
		end,
	},
}
