return {
	{
		"barrett-ruth/live-server.nvim",
		lazy = true,
		ft = { "html", "php", "js", "ts", "jsx", "tsx" },
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = function()
			require("live-server").setup({
				args = {
					"--port=5500",
					"--browser=brave",
					"--entry-file=index.html",
				},
			})
		end,
	},
}
