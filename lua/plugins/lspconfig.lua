return {
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			{ "mfussenegger/nvim-jdtls", ft = "java" },
		},

		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
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
			})

			vim.lsp.config("*", {
				root_dir = vim.fn.getcwd(),
				capabilities = capabilities,
				on_attach = function()
					vim.notify(vim.lsp.get_clients()[1].name .. " has attached to " .. vim.fn.expand("%:t"))
				end,
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
