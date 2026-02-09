return {
	{
		"nvim-mini/mini.ai",
		event = "BufRead",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"nvim-mini/mini.comment",
		event = "BufRead",
		version = false,
		config = function()
			require("mini.comment").setup()
		end,
	},
}
