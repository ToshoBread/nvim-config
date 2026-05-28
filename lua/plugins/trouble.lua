return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		config = function()
			Remap("n", "<leader>dx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Workspace Diagnostics" })
			Remap("n", "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics" })
			Remap("n", "<leader>ds", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Document Symbols" })
			Remap("n", "<leader>dl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP Location List" })
			Remap("n", "<leader>dL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List" })
			Remap("n", "<leader>dQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List" })
		end,
	},
}
