return {
	{
		"folke/lazydev.nvim",
		event = "BufEnter",
		ft = "lua",
		config = function()
			require("lazydev").setup({
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					"nvim-dap-ui",
				},
			})
		end,
	},
}
