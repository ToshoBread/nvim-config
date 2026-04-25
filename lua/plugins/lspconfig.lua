return {
	{
		"williamboman/mason.nvim",
		event = "BufEnter",
		dependencies = {
			"saghen/blink.cmp",
			{ "mfussenegger/nvim-jdtls", ft = "java" },
		},

		config = function()
			local mason = require("mason")
			local registry = require("mason-registry")
			local blink = require("blink.cmp")

			local ensureInstalled = {
				"lua_ls",
				"marksman",
				"tinymist",
				"pylsp",
				-- "rust_analyzer",
				-- "jdtls",
			}

			local capabilities =
				vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities())

			mason.setup()

			local installedLSPs = vim.iter(registry.get_installed_packages()):fold({}, function(arr, package)
				table.insert(arr, package.spec.neovim and package.spec.neovim.lspconfig)
				return arr
			end)

			local installedDict = {}
			for _, lsp in ipairs(installedLSPs) do
				installedDict[lsp] = true
			end

			registry.refresh(function()
				for _, lsp in ipairs(ensureInstalled) do
					if not installedDict[lsp] then
						registry.get_package(lsp):install()
						vim.notify(string.format("%s has been installed", lsp))
					end
				end
			end)


			vim.lsp.config("*", {
				root_dir = vim.fn.getcwd(),
				capabilities = capabilities,
			})

			vim.lsp.enable(installedLSPs)

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(e)
					local opts = { buffer = e.buf }
					local builtin = require("telescope.builtin")
					Remap("n", "K", vim.lsp.buf.hover, opts)
					Remap("n", "gd", vim.lsp.buf.definition, opts)
					Remap("n", "gD", vim.lsp.buf.declaration, opts)
					Remap("n", "gi", builtin.lsp_implementations, opts)
					Remap("n", "gr", builtin.lsp_references, opts)
					Remap("n", "<leader>rn", vim.lsp.buf.rename, opts)
					Remap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
