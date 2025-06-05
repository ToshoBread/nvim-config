return {
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},

		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local blink_cmp = require("blink.cmp")

			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				blink_cmp.get_lsp_capabilities()
			)

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

			mason.setup()
			mason_lspconfig.setup({
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
					"marksman",
					"tinymist",
				},

				handlers = {

					function(server_name)
						if server_name ~= "jdtls" then
							lspconfig[server_name].setup({
								capabilities = capabilities,
								on_attach = on_attach,
							})
						end
					end,

					["lua_ls"] = function()
						lspconfig["lua_ls"].setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,

					["pylsp"] = function()
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
					end,

					["tinymist"] = function()
						lspconfig["tinymist"].setup({
							settings = {
								formatterMode = "typstyle",
								exportPdf = "never",
							},
						})
					end,
				},
			})
		end,
	},
}
