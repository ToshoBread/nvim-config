return {
	{
		"barrett-ruth/live-server.nvim",
		build = "npm add -g live-server",
		ft = { "html", "php", "js", "ts", "jsx", "tsx" },
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
}
