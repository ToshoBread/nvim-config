local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"html", -- For HTML
	"cssls", -- For CSS
	"eslint", -- For ESLint (Javascript LSP)
	"phpactor", -- For PHP
	"pyright", -- For Python
	"bashls", -- For Bash
})

vim.api.nvim_create_autocmd("BufReadPre", {
	pattern = { "*/.wezterm.lua" },
	callback = function()
		vim.lsp.stop_client(vim.lsp.get_active_clients(), true)
	end,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-o>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-p>"] = cmp.mapping.select_next_item(cmp_select),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = {},
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)

	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)

	vim.keymap.set("n", "<leader>cr", function()
		vim.lsp.buf.references()
	end, opts)

	vim.keymap.set("n", "<leader>R", function()
		vim.lsp.buf.rename()
	end, opts)
end)

lsp.setup()
