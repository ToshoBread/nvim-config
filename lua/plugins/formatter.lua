return {
	{
		"stevearc/conform.nvim",
		event = "BufRead",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					typst = { "prettypst" },
					python = { "ruff_format" },
					sh = { "shfmt" },
					sql = { "sqlfmt" },
					mysql = { "sqlfmt" },
					php = { "pint" },
					blade = { "blade-formatter" },
					javascript = { "oxfmt", "eslint_d" },
					typescript = { "oxfmt", "eslint_d" },
					css = { "oxfmt" },
					scss = { "oxfmt" },
					html = { "oxfmt" },
					json = { "oxfmt" },
					jsonc = { "oxfmt" },
					markdown = { "oxfmt" },
					astro = { "oxfmt" },
					gdscript = { "gdformat" },
				},
				format_on_save = {
					timeout_ms = 2500,
					lsp_fallback = true,
					async = false,
					lsp_format = "fallback",
					stop_after_first = true,
				},
				log_level = vim.log.levels.DEBUG,
			})
		end,
	},
}
