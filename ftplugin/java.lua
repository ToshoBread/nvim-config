-- JDTLS (Java LSP) configuration
local jdtls = require("jdtls")
local home = vim.env.USERPROFILE or vim.env.HOME -- Get the home directory
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local mason_dir = "\\AppData\\Local\\nvim-data\\mason\\"
local workspace_dir = home .. "\\.dev\\java\\" .. project_name

-- Determine OS
local system_os = vim.fn.has("mac") == 1 and "mac"
    or vim.fn.has("unix") == 1 and "linux"
    or (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1) and "win"
    or "linux"

-- Java debug and test bundles
local bundles = {
    vim.fn.glob(home .. mason_dir .. "share\\java-debug-adapter\\com.microsoft.java.debug.plugin.jar"),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. mason_dir .. "share\\java-test\\*.jar", 1), "\n"))

local jdtls_launcher =
    vim.fn.glob(home .. mason_dir .. "share\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar")
if jdtls_launcher == "" then
    error("JDTLS launcher JAR not found! Check Mason installation.")
end

-- JDTLS configuration
local config = {
    cmd = {
        -- "C:\\Program Files\\Eclipse Adoptium\\jdk-21.0.6.7-hotspot\\bin\\java.exe",
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx4g",
        "-javaagent:" .. home .. mason_dir .. "share\\jdtls\\lombok.jar",
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

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle", "src" })
        or vim.fn.getcwd(),

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

    capabilities = require("cmp_nvim_lsp").default_capabilities(),

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
    end,
}

jdtls.start_or_attach(config)
