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

require("core")

_G.hidden_files = {
	".",
	"LICENSE",
	"lazy-lock",
	"package-lock",
	"node_modules",
}

-- Temporarily change colorscheme
function _G.changeTheme(color)
	vim.cmd.colorscheme(color)
end

-- Notify when saving
vim.api.nvim_create_autocmd("BufWrite", {
	pattern = "*",
	callback = function()
		local currentBuf = vim.fn.expand("%:t")
		vim.notify("Written to " .. currentBuf)
	end,
})

-- Define an autocmd to reload lualine when noice.nvim is initialized
vim.api.nvim_create_augroup("LualineReload", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = "LualineReload",
	pattern = "NoiceInit",
	callback = function()
		require("lualine").setup()
	end,
})

-- Trigger the NoiceInit event after noice.nvim is loaded
vim.api.nvim_exec_autocmds("User", { pattern = "NoiceInit" })
