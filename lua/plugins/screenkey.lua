	return {
	{
		"NStefan002/screenkey.nvim",
		config = function()
			require("screenkey").setup({
				group_mappings = true,
			})
			Remap("n", "<leader>sk", function() require("screenkey").toggle_statusline_component() end, { desc = "Toggle screenkey" })
		end,
	},
}
