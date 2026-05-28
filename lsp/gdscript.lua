return {
	cmd = { "nc", "127.0.0.1", "6005" },
	filetypes = { "gdscript" },
	handlers = {
		["workspace/applyEdit"] = function() end,
		["$ /cancelRequest"] = function() end,
	},
}
