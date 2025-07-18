vim.g.mapleader = " "

vim.opt.guicursor = "v-c-sm:ver25-blinkon1,i-ci-ve:ver25-blinkon1,r-cr-o:ver25-blinkon1"
vim.opt.mouse = ""

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~") .. "\\.vim\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "0"
vim.opt.cmdheight = 0
vim.opt.laststatus = 0

vim.diagnostic.config({
	virtual_text = true,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
	signs = true,
	virtual_lines = false,
})

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 60

-- Excludes jsregexp from luasnip requirements
vim.g.luasnip_load_jsregexp = 0
