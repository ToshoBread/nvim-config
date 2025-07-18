-- Auto set noremap and silent on remaps, allowing for extended config
function _G.remap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Temporarily change colorscheme
function _G.changeTheme(color)
	vim.cmd.colorscheme(color)
end
