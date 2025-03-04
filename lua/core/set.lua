local opt = vim.opt

vim.g.mapleader = " "

opt.guicursor = "n-v-c-sm:ver25-blinkon1,i-ci-ve:ver25-blinkon1,r-cr-o:ver25-blinkon1"

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~") .. "\\.vim\\undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 10
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 60

opt.colorcolumn = "0"

vim.api.nvim_set_option("clipboard", "unnamedplus")

--Set default terminal to powershell-core
opt.shell = "pwsh"
opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellxquote = ""

-- Excludes jsregexp from luasnip requirements
vim.g.luasnip_load_jsregexp = 0
