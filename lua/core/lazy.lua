-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
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
    { "rose-pine/nvim",                   name = "rose-pine" },
    { "catppuccin/nvim",                  name = "catppuccin" },

    -- Navigation
    { "nvim-telescope/telescope.nvim",    dependencies = "nvim-lua/plenary.nvim" },
    "ThePrimeagen/harpoon",

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = "nvim-treesitter/playground",
    },

    -- Utilities
    "MunifTanjim/nui.nvim",
    "mbbill/undotree",
    "VonHeikemen/searchbox.nvim",
    {
        "toppair/peek.nvim",
        event = "VeryLazy",
        build = "deno task --quiet build:fast",
    },

    -- LSP & Autocompletion
    {
        "neovim/nvim-lspconfig", -- Required
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",  -- Optional, for managing LSP servers
            "williamboman/mason-lspconfig.nvim", -- Optional, for Mason integration
            "jayp0521/mason-null-ls.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "j-hui/fidget.nvim",
            "folke/neodev.nvim",
        },
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    { "L3MON4D3/LuaSnip",        dependencies = "rafamadriz/friendly-snippets" },
    "saadparwaiz1/cmp_luasnip",
    { "nvimtools/none-ls.nvim",  dependencies = "nvimtools/none-ls-extras.nvim" },
    { "mfussenegger/nvim-jdtls", ft = "java" },

    -- Git Integration
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",

    -- UI / QoL
    { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
    "rcarriga/nvim-notify",
    "norcalli/nvim-colorizer.lua",
    "tpope/vim-commentary",
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
}

require("lazy").setup(plugins, {})
