local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
    ensure_installed = {
        "prettier",
        "ruff",
    },
    automatic_installation = true,
})

local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.completion.spell,
    require("none-ls.formatting.ruff_format").with({ extra_args = { "--extend-select", "I" } }),
    require("none-ls.formatting.ruff_format"),
    null_ls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2" } }),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
