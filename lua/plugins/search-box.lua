return {
	{
		"VonHeikemen/searchbox.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			Remap("n", "/", "<cmd>SearchBoxIncSearch<CR>", { desc = "Search forward" })
			Remap("n", "<leader>/", function() require("searchbox").match_all({ title = "Search All", clear_matches = false }) end, { desc = "Search all occurences" })
			Remap("n", "?", "<cmd>SearchBoxReplace<CR>", { desc = "Search backward/replace" })
		end,
	},
}
