return {
	{
		"NStefan002/screenkey.nvim",
		keys = {
			{ "<leader>sk", function() require("screenkey").toggle_statusline_component() end, desc = "Toggle screenkey" },
		},
		config = function()
			require("screenkey").setup({
				group_mappings = true,
			})
		end,
	},
}
