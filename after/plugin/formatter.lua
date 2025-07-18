local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "pretterd", "prettier" },
		typescript = { "pretterd", "prettier" },
		css = { "pretterd", "prettier" },
		scss = { "pretterd", "prettier" },
		html = { "pretterd", "prettier" },
		json = { "pretterd", "prettier" },
		markdown = { "pretterd", "prettier" },
		python = { "ruff_format" },
		sh = { "shfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		conform.format({ async = false, lsp_fallback = true })
	end,
})
