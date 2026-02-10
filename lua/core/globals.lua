---Auto set noremap and silent on remaps, allowing for extended config
---@param mode string | table n|v|i|t|x
---@param lhs string Key map to press
---@param rhs string | function Command to be executed
---@param opts table Options table
function Remap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

---Temporarily change colorscheme
---@param theme string Theme name
function ChangeTheme(theme)
	vim.cmd.colorscheme(theme)
end
