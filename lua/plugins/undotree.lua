return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = function()
			Remap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
		end,
	},
}
