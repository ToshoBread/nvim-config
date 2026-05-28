<h1 align="center">My Neovim Config</h1>

## Architecture

`init.lua` → lazy.nvim → `lua/plugins/*.lua` (28 specs) → `lua/core/*.lua`
(sets, autocmds, native keymaps)

| Directory      | Purpose                                                 |
| -------------- | ------------------------------------------------------- |
| `lua/plugins/` | Per-plugin specs, each declares `keys` for lazy loading |
| `lua/core/`    | Settings, globals, autocmds, motion remaps              |
| `lsp/`         | LSP server configs (Nvim 0.11+ `vim.lsp.config`)        |
| `ftplugin/`    | Filetype configs                                        |

Leader is `<space>`. See each plugin spec for keymaps [`lua/plugins/*.lua`].

### :pushpin: Core

:gear: Plugin Manager: [Lazy.nvim](https://github.com/folke/lazy.nvim.git)

:package: Package Manager: [Mason](https://github.com/williamboman/mason.nvim)

:pencil2: Formatter Manager: [Conform](https://github.com/stevearc/conform.nvim)

:file_folder: File Explorer: [Oil.nvim](https://github.com/stevearc/oil.nvim)

### LSP (Nvim 0.11+)

Mason-managed servers in `lsp/`. Not nvim-lspconfig.

### :rocket: Navigation

- [Harpoon](https://github.com/ThePrimeagen/harpoon) — `<leader>1`–`<leader>9`
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

### :wrench: Utilities

- [Omni-preview](https://github.com/SylvanFranklin/omni-preview.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Undotree](https://github.com/mbbill/undotree)
- [Kulala](https://github.com/mistweaverco/kulala.nvim)
- [Laravel](https://github.com/adibhanna/laravel.nvim)

### :bulb: Completion

- [Blink.cmp](https://github.com/saghen/blink.cmp)

### :twisted_rightwards_arrows: Git

- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Vim-fugitive](https://github.com/tpope/vim-fugitive) — `<leader>gt`

### :star2: UI / QoL

- [Autotag](https://github.com/windwp/nvim-ts-autotag)
- [Colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Mini.ai](https://github.com/nvim-mini/mini.ai)
- [Mini.comment](https://github.com/nvim-mini/mini.comment)
- [Mini.cursorword](https://github.com/nvim-mini/mini.cursorword)
- [Mini.pairs](https://github.com/nvim-mini/mini.pairs)
- [Mini.splitjoin](https://github.com/nvim-mini/mini.splitjoin)
- [Mini.surround](https://github.com/nvim-mini/mini.surround)
- [Noice](https://github.com/folke/noice.nvim)
- [Notify](https://github.com/rcarriga/nvim-notify)
- [Nvim-recorder](https://github.com/chrisgrieser/nvim-recorder)
- [Rainbow-Delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim)
- [Searchbox](https://github.com/VonHeikemen/searchbox.nvim)
- [Screenkey](https://github.com/NStefan002/screenkey.nvim) — `<leader>sk`
- [Tabout](https://github.com/abecodes/tabout.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [No-neck-pain](https://github.com/shortcuts/no-neck-pain.nvim) — `<leader>z`

### :art: Theme

- [Rose-pine](https://github.com/rose-pine/nvim) — variant `main`, transparency on
