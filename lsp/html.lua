return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "php", "blade" },
	settings = {
		html = {
			format = { enable = true },
			suggest = { html5 = true },
		},
	},
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
		includeLanguages = {
			blade = "html",
		},
	},
}
