return {
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", event = "LspAttach" },
			"saghen/blink.cmp",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local blink_cmp = require("blink.cmp")
			local mason_tool_installer = require("mason-tool-installer")
			local fidget = require("fidget")

			mason.setup()

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"marksman",
					"phpactor",
					"pylsp",
					"bashls",
					"jdtls",
					"html",
					"emmet_language_server",
					"cssls",
					"ts_ls",
					"sqls",
				},
				automatic_installation = true,
			})

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			end

			local capabilities = blink_cmp.get_lsp_capabilities()

			mason_lspconfig.setup_handlers({
				function(server_name)
					if server_name ~= "jdtls" then
						lspconfig[server_name].setup({
							on_attach = on_attach,
							capabilities = capabilities,
							flags = { debounce_text_changes = 150 },
						})
					end
				end,
			})

			-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
			local open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or "rounded" -- Set border to rounded
				return open_floating_preview(contents, syntax, opts, ...)
			end

			mason_tool_installer.setup({
				ensure_installed = {
					"java-debug-adapter",
					"java-test",
				},
			})

			fidget.setup({
				notification = {
					window = {
						winblend = 20, -- Semi-transparent background
					},
				},
			})

			-- Additional LSP Specs

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},

				root_dir = function(fname)
					local util = require("lspconfig.util")

					local root =
						util.root_pattern("package.json", ".git", ".luarc.json", ".luacheckrc", ".stylua.toml")(fname)

					if root and root:match("%.wezterm$") then
						return vim.fn.fnamemodify(fname, ":h")
					end

					return root or vim.fn.fnamemodify(fname, ":h")
				end,
			})

			lspconfig.pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							jedi_completion = { enabled = true },
							pylsp_mypy = { enabled = true },
							pylsp_rope = { enabled = true },
							ruff = { enabled = true },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							black = { enabled = false },
						},
						skip_token_initialization = true,
					},
				},
			})

			lspconfig.sqls.setup({
				settings = {
					sqls = {
						connections = {
							driver = "mysql",
							dataSourceName = "",
						},
					},
				},
			})
		end,
	},
}
