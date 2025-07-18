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

	-- Themes
	{ "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon" },
	{ "rose-pine/nvim", name = "rose-pine" },
	{ "catppuccin/nvim", name = "catppuccin" },

	-- Navigation
	{ "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },
	"ThePrimeagen/harpoon",

	-- Parsing
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = "nvim-treesitter/playground",
	},

	-- Utilities
	"stevearc/conform.nvim",
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	"MunifTanjim/nui.nvim",
	"mbbill/undotree",
	"VonHeikemen/searchbox.nvim",
	{
		"toppair/peek.nvim",
		event = "FileType markdown",
		build = "deno task --quiet build:fast",
	},
	{
		"tpope/vim-dadbod",
		event = "VeryLazy",
		ft = "sql",
		dependencies = {
			{
				"kristijanhusak/vim-dadbod-ui",
				cmd = {
					"DBUI",
					"DBUIToggle",
					"DBUIAddConnection",
					"DBUIFindBuffer",
				},
				init = function()
					vim.g.db_ui_use_nerd_fonts = 1
				end,
			},
			"kristijanhusak/vim-dadbod-completion",
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		build = "npm install -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},

	-- LSP & Autocompletion
	{
		"neovim/nvim-lspconfig", -- Required
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim", -- Optional, for managing LSP servers
			"williamboman/mason-lspconfig.nvim", -- Optional, for Mason integration
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", event = "LspAttach" },
		},
	},
	{ "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-buffer" } },
	{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
	"saadparwaiz1/cmp_luasnip",
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		event = "Filetype java",
	},

	-- Git
	"tpope/vim-fugitive",
	{ "lewis6991/gitsigns.nvim", event = "BufEnter" },

	-- UI / QoL
	{ "goolord/alpha-nvim", event = "VimEnter" },
	{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
	{ "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "BufEnter" },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	"b0o/incline.nvim",
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
	},
	"xiyaowong/transparent.nvim",
}

require("lazy").setup(plugins, {})
