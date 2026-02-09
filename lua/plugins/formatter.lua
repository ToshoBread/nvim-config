return {
	{
		"stevearc/conform.nvim",
		event = "BufRead",
		config = function()
			local conform = require("conform")
			local prettier_fmt = { "prettierd", "prettier" }

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
					javascript = prettier_fmt,
					typescript = prettier_fmt,
					css = prettier_fmt,
					scss = prettier_fmt,
					html = prettier_fmt,
					json = prettier_fmt,
					markdown = prettier_fmt,
					astro = prettier_fmt,
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
