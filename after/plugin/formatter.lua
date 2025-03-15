local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		sh = { "shfmt" },
		python = { "ruff_format" },
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
