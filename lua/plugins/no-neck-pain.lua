return {
	{
		"shortcuts/no-neck-pain.nvim",
		keys = {
			{
				"<leader>z",
				function()
					vim.cmd("NoNeckPain")
					vim.cmd("Gitsigns toggle_signs")
				end,
				desc = "Zen Mode",
			},
		},
		config = function()
			require("no-neck-pain").setup({
				buffers = {
					right = {
						enabled = false,
					},

					scratchPad = {
						enabled = true,
						fileName = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
						location = "~/nvim-scratch/",
					},

					bo = {
						filetype = "md",
					},
				},
			})
		end,
	},
}
