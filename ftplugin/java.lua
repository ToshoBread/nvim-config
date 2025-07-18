-- JDTLS (Java LSP) configuration
local jdtls = require("jdtls")
local home = vim.env.USERPROFILE or vim.env.HOME -- Get the home directory
local mason_dir = "\\AppData\\Local\\nvim-data\\mason\\"
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = home .. "\\.dev\\java\\" .. project_name
local workspace_dir = vim.fn.getcwd()

-- Determine OS
local system_os = vim.fn.has("mac") == 1 and "mac"
	or vim.fn.has("unix") == 1 and "linux"
	or (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1) and "win"
	or "linux"

-- Java debug and test bundles
local bundles = {
	vim.fn.glob(home .. mason_dir .. "share\\java-debug-adapter\\com.microsoft.java.debug.plugin.jar"),
	"C:\\Program Files (x86)\\Java\\lib\\mysql-connector-j-9.2.0.jar",
}

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. mason_dir .. "share\\java-test\\*.jar", true), "\n"))

local jdtls_launcher = vim.fn.glob(home .. mason_dir .. "share\\jdtls\\plugins\\org.eclipse.equinox.launcher_*.jar")
if jdtls_launcher == "" then
	error("JDTLS launcher JAR not found! Check Mason installation.")
end

-- JDTLS configuration
local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. mason_dir .. "share\\jdtls\\lombok.jar",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Eclipse jdtls location
		"-jar",
		jdtls_launcher,
		"-configuration",
		home .. mason_dir .. "packages\\jdtls\\config_" .. system_os,
		"-data",
		workspace_dir,
	},

	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	-- or vim.fn.getcwd(),

	root_dir = require("jdtls.setup").find_root({ ".git", "build.gradle", "pom.xml" }),

	settings = {
		java = {
			home = "C:\\Program Files\\Eclipse Adoptium\\jdk-21.0.6.7-hotspot",
			eclipse = { downloadSources = true },
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{
						name = "JavaSE-21",
						path = "C:\\Program Files\\Eclipse Adoptium\\jdk-21.0.6.7-hotspot\\",
					},
				},
			},
			project = {
				sourcePaths = { "src" },
				outputPath = "bin",
			},
			maven = { downloadSources = true },
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
			references = { includeDecompiledSources = true },
			signatureHelp = { enabled = true },
			format = { enabled = true },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				importOrder = { "java", "javax", "com", "org" },
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
			},
		},
	},

	capabilities = require("blink.cmp").get_lsp_capabilities(),

	flags = { allow_incremental_sync = true },

	init_options = {
		bundles = bundles,
		extendedClientCapabilities = {
			jdtls.extendedClientCapabilities,
			projectImportProvider = false,
		},
	},

	on_attach = function(client, bufnr)
		jdtls.setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	end,
}

jdtls.start_or_attach(config)
