return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufRead",
		dependencies = { "nvim-treesitter/playground" },
		-- event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = {
					"lua",
					"python",
					"java",
					"bash",
					"markdown",
					"markdown_inline",
					"html",
					"css",
					"scss",
					"javascript",
					"typescript",
					"php",
					-- "c",
					-- "vim",
					-- "vimdoc",
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
			})
		end,
	},
}
