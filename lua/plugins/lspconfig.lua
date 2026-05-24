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
				if not vim.tbl_contains(package.spec.categories, "Formatter") then
					table.insert(arr, package.spec.neovim and package.spec.neovim.lspconfig)
				end
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

			vim.filetype.add({
				extension = {
					blade = "blade",
				},
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})

			vim.lsp.set_log_level("OFF")
			vim.lsp.enable(installedLSPs)
		end,
	},
}
