return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({
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
