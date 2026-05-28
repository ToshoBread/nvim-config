return {
	{
		"shortcuts/no-neck-pain.nvim",
		config = function()
			Remap("n", "<leader>z", function()
				vim.cmd("NoNeckPain")
				vim.cmd("Gitsigns toggle_signs")
			end, { desc = "Zen Mode" })
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
