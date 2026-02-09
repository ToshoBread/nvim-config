return {
	cmd = { "astro-ls", "--stdio" },
	filetypes = { "astro" },
	init_options = {
		typescript = {
			tsdk = vim.fn.expand("node_modules/typescript/lib"),
		},
	},
	settings = {
		astro = {
			documentLinks = true,
		},
	},
}
