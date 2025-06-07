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

			mason.setup()
			mason_lspconfig.setup({
				automatic_installation = true,
				automatic_enable = true,

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
							})
						end
					end,

					["lua_ls"] = function()
						lspconfig["lua_ls"].setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim", "love" },
									},
									workspace = {
										library = {
											"C:/Program Files/luaAddons/love2d/library",
										},

										checkThirdParty = false,
									},
									telemetry = {
										enable = false,
									},
								},
							},
						})
					end,

					["pylsp"] = function()
						lspconfig["pylsp"].setup({
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

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(e)
					local opts = { buffer = e.buf }
					remap("n", "gd", vim.lsp.buf.definition, opts)
					remap("n", "K", vim.lsp.buf.hover, opts)
					remap("n", "gr", vim.lsp.buf.references, opts)
					remap("n", "<leader>rn", vim.lsp.buf.rename, opts)
					remap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
