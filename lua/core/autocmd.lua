-- Hightlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "Hightlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 250, visual = true })
	end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("restore_cursor", { clear = true }),
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- No auto continue comments
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Refresh icon highlighting after LSP events
vim.api.nvim_create_autocmd({ "LspAttach", "DiagnosticChanged" }, {
	group = vim.api.nvim_create_augroup("devicons_refresh", { clear = true }),
	callback = function()
		vim.schedule(function()
			pcall(require("nvim-web-devicons").refresh)
		end)
	end,
})

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
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
