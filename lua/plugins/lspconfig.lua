return {
	{
		"williamboman/mason.nvim",
		event = "BufEnter",
		dependencies = {
			"neovim/nvim-lspconfig",
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
				vim.lsp.protocol.make_client_capabilities(),
				blink_cmp.get_lsp_capabilities()
			)

			mason.setup()
			mason_lspconfig.setup({
				automatic_enable = true,

				ensure_installed = {
					"lua_ls",
					"marksman",
					"tinymist",
					"pylsp",
					-- "rust_analyzer",
					-- "jdtls",
				},
			})

			vim.lsp.config("*", {
				root_dir = vim.fn.getcwd(),
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(e)
					local opts = { buffer = e.buf }
					local builtin = require("telescope.builtin")
					remap("n", "K", vim.lsp.buf.hover, opts)
					remap("n", "gd", vim.lsp.buf.definition, opts)
					remap("n", "gD", vim.lsp.buf.declaration, opts)
					remap("n", "gi", builtin.lsp_implementations, opts)
					remap("n", "gr", builtin.lsp_references, opts)
					remap("n", "<leader>rn", vim.lsp.buf.rename, opts)
					remap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
