return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"saghen/blink.cmp",
		},

		config = function()
			local mason = require("mason")
			local registry = require("mason-registry")
			local blink = require("blink.cmp")

			local ensureInstalled = {
				"lua-language-server",
				"marksman", -- Markdown
				"tinymist", -- Typst
				-- "typescript-language-server",
				-- "python-lsp-server",
				-- "rust_analyzer",
				-- "roslyn", -- C#
				-- "jdtls", -- Java
			}

			local capabilities =
				vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities())

			mason.setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})

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
					local ok, pkg = pcall(registry.get_package, lsp)
					if ok and pkg and not installedDict[lsp] then
						pkg:install()
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

			vim.lsp.log.set_level(vim.log.levels.OFF)
			vim.lsp.enable(installedLSPs)
		end,
	},
}
