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

local plugins = {
	-- automatically check for plugin updates
	checker = { enabled = true },

	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "rose-pine" } },

	-- Themes
	{ "rose-pine/nvim", name = "rose-pine" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "olimorris/onedarkpro.nvim", name = "onedarkpro" },
	{ "tiagovla/tokyodark.nvim", name = "tokyodark" },

	-- Navigation
	{ "nvim-telescope/telescope.nvim", version = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
	"ThePrimeagen/harpoon",

	-- Utility
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"mbbill/undotree",
	"MunifTanjim/nui.nvim",
	"VonHeikemen/fine-cmdline.nvim",
	"VonHeikemen/searchbox.nvim",

	-- Language Server Protocols (LSP)
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x", -- or 'main' for the latest stable version
		dependencies = {
			-- LSP support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional, for managing LSP servers
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional, for Mason integration
			-- Autocompletion support
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	},
	{ "nvimtools/none-ls.nvim", dependencies = { "nvimtools/none-ls-extras.nvim" } },
	"rafamadriz/friendly-snippets",

	-- Git Integration
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",

	-- Quality of Life
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	"rcarriga/nvim-notify",
	"norcalli/nvim-colorizer.lua",
	"numToStr/Comment.nvim",
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
}

require("lazy").setup(plugins, {})
