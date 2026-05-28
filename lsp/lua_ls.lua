return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	single_file_support = true,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "vim", "love" },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},

				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
