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

-- Oil.nvim hidden files
_G.hidden_files = {
	".",
	"lazy-lock",
	"package-lock",
	"node_modules",
	".git/",
	"build",
	"dist",
	"LICENSE",
}

-- Notify when saving
vim.api.nvim_create_autocmd("BufWrite", {
	pattern = "*",
	callback = function()
		local currentBuf = vim.fn.expand("%:t")
		vim.notify("Written to " .. currentBuf)
	end,
})
