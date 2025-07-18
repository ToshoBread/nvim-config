return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
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

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					["fzf"] = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case", -- smart_case | ignore_case | respect_case
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")
		end,
	},
}
