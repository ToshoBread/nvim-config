return {
	{
		"saghen/blink.cmp",
		event = "BufEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"xzbdmw/colorful-menu.nvim",
			{ "olrtg/nvim-emmet", ft = "html" },
			{ "Jezda1337/nvim-html-css", ft = { "html", "css", "scss", "php" } },
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{
				"saghen/blink.compat",
				-- use v2.* for blink.cmp v1.*
				version = "2.*",
				-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
				lazy = true,
				-- make sure to set opts so that lazy.nvim calls blink.compat's setup
				opts = {
					debug = true,
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
					["<C-n>"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },
					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
					["<Tab>"] = { "snippet_forward", "fallback" },
					["<S-Tab>"] = { "snippet_backward", "fallback" },
				},

				appearance = {
					nerd_font_variant = "mono",
				},

				completion = {
					documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
					ghost_text = { enabled = true },
					keyword = { range = "prefix" },
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
							columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
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
					default = { "lsp", "snippets", "path" },
					per_filetype = {
						html = { inherit_defaults = true, "buffer" },
						lua = { inherit_defaults = true, "lazydev" },
						sql = { inherit_defaults = true, "buffer" },
						mysql = { inherit_defaults = true, "buffer" },
						markdown = { inherit_defaults = true, "buffer" },
						php = { inherit_defaults = true, "laravel" },
						blade = { inherit_defaults = true, "laravel" },
					},
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
						-- dadbod = {
						-- 	name = "DadBod",
						-- 	module = "vim_dadbod_completion.blink",
						-- 	score_offset = -1,
						-- },
						-- ["html-css"] = {
						-- 	name = "html-css",
						-- 	module = "blink.compat.source",
						-- },
						laravel = {
							name = "laravel",
							module = "laravel.blink_source",
						},
					},
				},

				cmdline = {
					enabled = true,
					completion = { menu = { auto_show = true } },
					keymap = { preset = "inherit" },
				},

				signature = { enabled = true },
				fuzzy = { implementation = "prefer_rust" },
			})
		end,
		opts_extend = { "sources.default" },
	},
}
