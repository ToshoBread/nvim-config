return {
	{
		"mfussenegger/nvim-dap",
		event = "BufRead",
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},

		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {},
				automatic_installation = true,
			})

			require("nvim-dap-virtual-text").setup()
		end,
	},
}
