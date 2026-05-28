return {
	{
		"tpope/vim-fugitive",
		config = function()
			Remap("n", "<leader>gt", "<cmd>tab Git<CR>", { desc = "Git stage window" })
		end,
	},
}
