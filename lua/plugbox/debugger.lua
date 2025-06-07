return {
	{
		"mfussenegger/nvim-dap",
		event = "BufRead",
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},

		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {},
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"java-debug-adapter",
					"java-test",
				},
			})

			require("nvim-dap-virtual-text").setup({
				enabled = true,
				-- virt_text_win_col = 80,
			})
		end,

		keys = {
			{
				"<leader>so",
				function()
					require("dap").step_over()
				end,
				desc = "Debug Step Over",
			},
			{
				"<leader>sO",
				function()
					require("dap").step_out()
				end,
				desc = "Debug Step Out",
			},
			{
				"<leader>si",
				function()
					require("dap").step_into()
				end,
				desc = "Debug Step Into",
			},
		},
	},
}
