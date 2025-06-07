return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					border = true,
					winblend = 0,
					file_ignore_patterns = {
						"^lazy-lock.json",
						"^package-lock.json",
						"^node_modules",
						"^.git/",
						"^build",
						"^dist",
						"^LICENSE",
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
			})

			telescope.load_extension("ui-select")
		end,
	},
}
