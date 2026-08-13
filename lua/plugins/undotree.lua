return {
	{
		"mbbill/undotree",
		lazy = false,
		config = function()
			Remap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
		end,
	},
}
