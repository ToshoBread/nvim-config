return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufRead",
		dependencies = { "nvim-treesitter/playground", "nvim-treesitter/nvim-treesitter-textobjects" },
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = {
					"lua",
					"markdown",
					"markdown_inline",
					"typst",
					"query",
				},

				sync_install = false,
				auto_install = true,

				highlight = {
					enable = true,
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},

				indent = { enable = true },

				textobjects = {
					select = {
						enable = true,
						lookahead = true,

						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",

							["iv"] = "@assignment.inner",
							["av"] = "@assignment.outer",
							["vn"] = "@assignment.lhs", -- Var Name
							["vv"] = "@assignment.rhs", -- Var Value
						},

						include_surrounding_whitespace = true,
					},
				},
			})
		end,
	},
}
