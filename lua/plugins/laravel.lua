return {
	{
		"adibhanna/laravel.nvim",
		ft = { "php" },
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>la", ":Artisan ", desc = "Laravel Artisan" },
			-- { "<leader>lc", ":Composer<cr>", desc = "Composer" },
			{ "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
			{ "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
			{ "<leader>lg", ":LaravelGoto<cr>", desc = "Laravel GoTo" },
		},
		config = function()
			require("laravel").setup()
		end,
	},
}
