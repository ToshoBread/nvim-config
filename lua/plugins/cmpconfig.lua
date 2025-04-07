return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"folke/lazydev.nvim",
			{ "mfussenegger/nvim-jdtls", ft = "java" },
			{ "olrtg/nvim-emmet", ft = "html" },
			{ "Jezda1337/nvim-html-css", ft = { "html", "css", "scss" } },
		},
		version = "1.*",
		opts = {
			keymap = {
				preset = "none",
				["<CR>"] = { "select_and_accept", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			cmdline = {
				enabled = true,
				completion = { menu = { auto_show = true } },
			},

			completion = {
				documentation = { auto_show = true },
				ghost_text = { enabled = true },
				keyword = { range = "full" },
			},

			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			signature = { enabled = true },
			fuzzy = { implementation = "prefer_rust" },
		},
	},
}
