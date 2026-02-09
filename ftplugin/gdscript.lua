vim.lsp.config.gdscript = {
	cmd = { "nc", "127.0.0.1", "6005" },
	handlers = {
		["workspace/applyEdit"] = function() end,
		["$ /cancelRequest"] = function() end,
	},
}

vim.lsp.enable("gdscript")
