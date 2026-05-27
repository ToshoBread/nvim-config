return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<leader>dx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
			{ "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics" },
			{ "<leader>ds", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Document Symbols" },
			{ "<leader>dl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Location List" },
			{ "<leader>dL", "<cmd>Trouble loclist toggle<CR>", desc = "Location List" },
			{ "<leader>dQ", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List" },
		},
	},
}
