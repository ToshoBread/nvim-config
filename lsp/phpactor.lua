return {
	cmd = { "phpactor", "language-server" },
	filetypes = { "php", "blade" },
	settings = {
		phpactor = {
			language_server_phpstan = { enabled = false },
			language_server_psalm = { enabled = false },
			language_server_php_cs_fixer = { enabled = false },
		},
	},
	init_options = {
		["language_server.diagnostics_on_open"] = false,
		["language_server.diagnostics_on_save"] = false,
		["language_server.diagnostics_on_update"] = false,
	},
}
