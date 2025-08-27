-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup("plugins", {
	change_detection = {
		enabled = false,
		notify = false,
	},
})

-- Require settings and remaps
require("core")

-- Set colorscheme
vim.cmd.colorscheme("rose-pine")
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "none" })

-- Oil.nvim hidden files
_G.hidden_files = {
	".",
	"lazy-lock",
	".git",
	"LICENSE",

	"package",
	"node_modules",
	"build",
	"dist",

	"composer",
	"vendor",
}
