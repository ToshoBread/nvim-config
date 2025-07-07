return {
	{
		"stevearc/conform.nvim",
		event = "BufRead",
		config = function()
			local conform = require("conform")

			local prettier_fmt = { "prettierd", "prettier", stop_after_first = true }

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					typst = { "prettypst" },
					python = { "ruff" },
					sh = { "shfmt" },
					sql = { "sqlfmt" },
					mysql = { "sqlfmt" },
					javascript = prettier_fmt,
					typescript = prettier_fmt,
					css = prettier_fmt,
					scss = prettier_fmt,
					html = prettier_fmt,
					json = prettier_fmt,
					markdown = prettier_fmt,
				},
				format_on_save = {
					timeout_ms = 2500,
					lsp_fallback = true,
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					conform.format({ async = false, lsp_fallback = true })
				end,
			})
		end,
	},
}
