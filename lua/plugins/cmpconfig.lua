return {
	{
		"saghen/blink.cmp",
		event = "BufEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",

			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"xzbdmw/colorful-menu.nvim",
			{ "olrtg/nvim-emmet", ft = "html" },
			{ "Jezda1337/nvim-html-css", ft = { "html", "css", "scss" } },
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		version = "1.*",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()

			require("blink.cmp").setup({
				keymap = {
					preset = "none",
					["<CR>"] = { "select_and_accept", "fallback" },
					["<C-x>"] = { "hide", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
					["<Tab>"] = { "snippet_forward", "fallback" },
					["<S-Tab>"] = { "snippet_backward", "fallback" },
				},

				appearance = {
					nerd_font_variant = "mono",
				},

				completion = {
					documentation = { auto_show = true, auto_show_delay_ms = 1000, window = { border = "rounded" } },
					ghost_text = { enabled = false },
					keyword = { range = "full" },
					list = {
						selection = {
							preselect = true,
							auto_insert = true,
						},
					},
					accept = { auto_brackets = { enabled = true } },
					menu = {
						draw = {
							treesitter = { "lsp" },
							columns = { { "kind_icon" }, { "label", gap = 1 }, { "source_name" } },
							components = {
								label = {
									text = function(ctx)
										return require("colorful-menu").blink_components_text(ctx)
									end,
									highlight = function(ctx)
										return require("colorful-menu").blink_components_highlight(ctx)
									end,
								},
							},
						},
					},
				},

				snippets = { preset = "luasnip" },

				sources = {
					default = { "lsp", "path", "snippets" },
					per_filetype = {
						lua = { "lazydev", "lsp", "path", "snippets" },
						sql = { "lsp", "buffer", "dadbod" },
						mysql = { "lsp", "buffer", "dadbod" },
						md = { "lsp", "snippets", "path", "buffer" },
					},
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
						dadbod = {
							name = "DadBod",
							module = "vim_dadbod_completion.blink",
							score_offset = -1,
						},
					},
				},

				cmdline = {
					enabled = true,
					completion = { menu = { auto_show = true } },

					keymap = {
						preset = "none",
						["<CR>"] = { "select_and_accept", "fallback" },
						["<C-x>"] = { "hide", "fallback" },
						["<C-j>"] = { "select_next", "fallback" },
						["<C-k>"] = { "select_prev", "fallback" },
					},
				},

				signature = { enabled = true },
				fuzzy = { implementation = "prefer_rust" },
			})
		end,
	},
}
