return {
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
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find regex",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Find in buffer",
		},
		{
			"<leader>ft",
			function()
				require("telescope.builtin").treesitter()
			end,
			desc = "Find Treesitter symbols",
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Find keymaps",
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
}
