return {
	{
		"mistweaverco/kulala.nvim",
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" },
			{ "<leader>Rj", desc = "Open cookie jar" },
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",
		},
	},
}
