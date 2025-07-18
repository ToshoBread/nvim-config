vim.g.mapleader = " "

vim.opt.guicursor = "n-v-c-sm:ver25-blinkon1,i-ci-ve:ver25-blinkon1,r-cr-o:ver25-blinkon1"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~") .. "\\.vim\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 60

vim.opt.colorcolumn = "0"

vim.api.nvim_set_option("clipboard", "unnamedplus")

--Set default terminal to powershell-core
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

-- Excludes jsregexp from luasnip requirements
vim.g.luasnip_load_jsregexp = 0
