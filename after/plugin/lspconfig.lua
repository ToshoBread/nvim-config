local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local mason_tool_installer = require("mason-tool-installer")

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "phpactor",
        "bashls",
        "jdtls",
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

local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup_handlers({
    function(server_name)
        if server_name ~= "jdtls" then
            lspconfig[server_name].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end
    end,
})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
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
