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
					cs = { "csharpier" },
					sh = { "shfmt" },
					sql = { "sqlfmt" },
					mysql = { "sqlfmt" },
					php = { "pint" },
					blade = { "blade-formatter" },
					javascript = { "oxfmt" },
					typescript = { "oxfmt" },
					css = { "oxfmt" },
					scss = { "oxfmt" },
					html = { "oxfmt" },
					json = { "oxfmt" },
					jsonc = { "oxfmt" },
					markdown = { "oxfmt" },
					astro = { "oxfmt" },
					gdscript = { "gdformat" },
				},
				formatters = {
					csharpier = {
						command = "csharpier",
						args = { "format", "--write-stdout" },
						stdin = true,
					},
				},
				format_on_save = {
					timeout_ms = 2500,
					async = false,
					lsp_format = "fallback",
					stop_after_first = true,
				},
				log_level = vim.log.levels.WARN,
			})
		end,
	},
}
