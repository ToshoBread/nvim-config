return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {
			ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
		},
	},
}
