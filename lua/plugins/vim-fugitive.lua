return {
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		config = function()
			Remap("n", "<leader>gt", "<cmd>tab Git<CR>", { desc = "Git stage window" })
		end,
	},
}
