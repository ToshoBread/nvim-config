return {
	{
		"VonHeikemen/searchbox.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		keys = {
			{ "/", "<cmd>SearchBoxIncSearch<CR>", desc = "Search forward" },
			{ "<leader>/", function() require("searchbox").match_all({ title = "Search All", clear_matches = false }) end, desc = "Search all occurences" },
			{ "?", "<cmd>SearchBoxReplace<CR>", desc = "Search backward/replace" },
		},
	},
}
