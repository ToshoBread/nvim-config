return {
	{

		"nvim-telescope/telescope.nvim",
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
			local builtin = require("telescope.builtin")
			Remap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			Remap("n", "<leader>fw", builtin.live_grep, { desc = "Find regex" })
			Remap("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })
			Remap("n", "<leader>ft", builtin.treesitter, { desc = "Find Treesitter symbols" })
			Remap("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
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

					live_grep = {
						theme = "dropdown",
					},

					current_buffer_fuzzy_find = {
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
