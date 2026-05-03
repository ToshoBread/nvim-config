return {
	{
		"shortcuts/no-neck-pain.nvim",
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
