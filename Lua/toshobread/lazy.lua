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
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "rose-pine" } },

    -- automatically check for plugin updates
    checker = { enabled = true },

    {'nvim-telescope/telescope.nvim',  version = '0.1.8', dependencies = {'nvim-lua/plenary.nvim'}},

    { "rose-pine/nvim", name = "rose-pine" },

    { "catppuccin/nvim", name = "catppuccin" },

    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',

    'ThePrimeagen/harpoon',

    'mbbill/undotree',

    -- Add lsp-zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x', -- or 'main' for the latest stable version
        dependencies = {
            -- LSP support
            {'neovim/nvim-lspconfig'},   -- Required
            {'williamboman/mason.nvim'}, -- Optional, for managing LSP servers
            {'williamboman/mason-lspconfig.nvim'}, -- Optional, for Mason integration
            -- Autocompletion support
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
        }
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    'numToStr/Comment.nvim',
    'tpope/vim-fugitive'
}

require("lazy").setup(plugins, {})
