return {
	{
		"stevearc/conform.nvim",
		event = "BufRead",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					css = { "prettierd" },
					scss = { "prettierd" },
					html = { "prettierd" },
					json = { "prettierd" },
					markdown = { "prettierd" },
					python = { "ruff_format" },
					sh = { "shfmt" },
					sql = { "sqlfmt" },
					mysql = { "sqlfmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			local conform = require("conform")
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					conform.format({ async = false, lsp_fallback = true })
				end,
			})
		end,
	},
}
