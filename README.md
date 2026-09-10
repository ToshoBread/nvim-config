<div align="center">

# My Neovim Config

A personal Neovim configuration built for speed and developer ergonomics.

![Neovim](https://img.shields.io/badge/Neovim-0.11%2B-57A143?style=flat-square&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-5.1-000080?style=flat-square&logo=lua&logoColor=white)
![License](https://img.shields.io/badge/License-CC0_1.0-lightgrey?style=flat-square)

[Features](#features) - [Architecture](#architecture) - [Plugins](#plugins) - [Keymaps](#keymaps) - [Getting Started](#getting-started)

</div>

## Features

- **Fast startup** -- lazy-loaded plugins, no bloat
- **Native LSP** -- uses Nvim 0.11 `vim.lsp.config` API (no nvim-lspconfig)
- **Mason** -- auto-installs and manages LSP servers, formatters, linters
- **Treesitter** -- syntax highlighting and smart indentation
- **Blink.cmp** -- fast autocompletion with snippets, LSP, and path sources
- **Oil.nvim** -- edit filesystem like a buffer
- **Rose Pine** -- dark, transparent theme
- **Multi-language support** -- Lua, PHP, Java, C#, Python, TypeScript, Typst, Markdown, and more
- **Plugin toggle system** -- enable/disable plugins via `:lua TogglePlugin()`

## Architecture

```
.
├── init.lua                 -- Entry point: bootstraps lazy.nvim
├── lua/
│   ├── core/                -- Settings, globals, autocmds, motion remaps
│   ├── plugins/             -- Per-plugin specs (one file per plugin)
│   ├── plugin-spec.lua      -- Plugin loader with disable support
│   └── disabled.lua         -- List of plugins to disable
├── lsp/                     -- LSP server configs (auto-loaded by Mason)
└── ftplugin/                -- Filetype-specific settings
```

> [!NOTE]
> `core` loads **before** plugins. The global `Remap()` function is defined in `core/globals.lua` first, so all plugin specs can use it.

## Plugins

### Core

| Plugin                                              | Purpose           |
| :-------------------------------------------------- | :---------------- |
| [Lazy.nvim](https://github.com/folke/lazy.nvim)     | Plugin manager    |
| [Mason](https://github.com/williamboman/mason.nvim) | Package installer |
| [Conform](https://github.com/stevearc/conform.nvim) | Formatter manager |

### Navigation

| Plugin                                                        | Purpose                                      |
| :------------------------------------------------------------ | :------------------------------------------- |
| [Oil.nvim](https://github.com/stevearc/oil.nvim)              | File explorer as a buffer                    |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, symbols, keymaps) |
| [Harpoon](https://github.com/ThePrimeagen/harpoon)            | Quick file marks (`<leader>1`-`<leader>9`)   |

### Completion & LSP

| Plugin                                                           | Purpose                             |
| :--------------------------------------------------------------- | :---------------------------------- |
| [Blink.cmp](https://github.com/saghen/blink.cmp)                 | Autocompletion                      |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                   | Snippet engine                      |
| [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and indentation |
| [Trouble](https://github.com/folke/trouble.nvim)                 | Diagnostics list                    |

### Git

| Plugin                                                 | Purpose                     |
| :----------------------------------------------------- | :-------------------------- |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) | Git signs in the gutter     |
| [Vim-fugitive](https://github.com/tpope/vim-fugitive)  | Git commands (`<leader>gt`) |

### UI / QoL

| Plugin                                                                   | Purpose                               |
| :----------------------------------------------------------------------- | :------------------------------------ |
| [Noice](https://github.com/folke/noice.nvim)                             | Command-line UI replacement           |
| [Lualine](https://github.com/nvim-lualine/lualine.nvim)                  | Statusline                            |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                   | Notification UI                       |
| [Colorizer](https://github.com/norcalli/nvim-colorizer.lua)              | Color highlighter                     |
| [Rainbow Delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) | Colored brackets                      |
| [Searchbox](https://github.com/VonHeikemen/searchbox.nvim)               | Search UI                             |
| [Nvim-recorder](https://github.com/chrisgrieser/nvim-recorder)           | Macro recording with UI               |
| [Tabout](https://github.com/abecodes/tabout.nvim)                        | Tab out of brackets/quotes            |
| [No-neck-pain](https://github.com/shortcuts/no-neck-pain.nvim)           | Centered editing (`<leader>z`)        |
| [Undotree](https://github.com/mbbill/undotree)                           | Undo history visualizer (`<leader>u`) |

### Mini Suite

| Plugin                                                          | Purpose                        |
| :-------------------------------------------------------------- | :----------------------------- |
| [mini.ai](https://github.com/nvim-mini/mini.ai)                 | Extended around-inside motions |
| [mini.comment](https://github.com/nvim-mini/mini.comment)       | Filetype aware comment motion  |
| [mini.surround](https://github.com/nvim-mini/mini.surround)     | Surround motions               |
| [mini.splitjoin](https://github.com/nvim-mini/mini.splitjoin)   | Split or join arrays or lists  |
| [mini.pairs](https://github.com/nvim-mini/mini.pairs)           | Auto pair brackets             |
| [mini.cursorword](https://github.com/nvim-mini/mini.cursorword) | Underline same word in buffer  |

### Language Support

| Plugin                                                              | Purpose                                     |
| :------------------------------------------------------------------ | :------------------------------------------ |
| [Roslyn](https://github.com/seblyng/roslyn.nvim)                    | C# LSP                                      |
| [Laravel](https://github.com/adibhanna/laravel.nvim)                | Laravel integration (artisan, routes, make) |
| [Kulala](https://github.com/mistweaverco/kulala.nvim)               | HTTP/REST client                            |
| [Omni-preview](https://github.com/SylvanFranklin/omni-preview.nvim) | Markdown, Typst, CSV preview                |

### Theme

| Plugin                                         | Purpose                      |
| :--------------------------------------------- | :--------------------------- |
| [Rose Pine](https://github.com/rose-pine/nvim) | Dark theme with transparency |

## Keymaps

Leader key is `<space>`.

### Global

| Keymap       | Action                   |
| :----------- | :----------------------- |
| `<leader>ww` | Write file               |
| `<leader>wq` | Write and quit           |
| `<leader>qq` | Force quit               |
| `<leader>a`  | Select entire buffer     |
| `<leader>yy` | Copy to system clipboard |

### Navigation

| Keymap        | Action                        |
| :------------ | :---------------------------- |
| `<C-h/j/k/l>` | Move between panes            |
| `<C-H/J/K/L>` | Resize panes                  |
| `<CR>`        | Insert line below             |
| `<S-CR>`      | Insert line above             |
| `J`           | Join lines (preserves cursor) |

### Search & Find

| Keymap       | Action                  |
| :----------- | :---------------------- |
| `<leader>ff` | Find files              |
| `<leader>fw` | Live grep               |
| `<leader>fb` | Find in buffer          |
| `<leader>ft` | Find Treesitter symbols |
| `<leader>fk` | Find keymaps            |
| `/`          | Search forward          |
| `?`          | Search/replace          |
| `<leader>/`  | Search all occurrences  |

### Harpoon

| Keymap                  | Action       |
| :---------------------- | :----------- |
| `<leader>ha`            | Add mark     |
| `<leader>hl`            | Open menu    |
| `<leader>1`-`<leader>9` | Jump to mark |

### Git

| Keymap       | Action             |
| :----------- | :----------------- |
| `<leader>gt` | Git tab (fugitive) |
| `<leader>gb` | Git blame          |
| `<leader>gd` | Git diff           |

### Diagnostics

| Keymap       | Action                |
| :----------- | :-------------------- |
| `K`          | Hover docs            |
| `gd`         | Go to definition      |
| `gD`         | Go to declaration     |
| `gi`         | Go to implementation  |
| `gr`         | References            |
| `<leader>rn` | Rename                |
| `<leader>ca` | Code action           |
| `<leader>dx` | Workspace diagnostics |
| `<leader>dX` | Buffer diagnostics    |

### Editing

| Keymap             | Action                         |
| :----------------- | :----------------------------- |
| `d/c/x`            | Delete/change to void register |
| `K` / `J` (visual) | Move selected lines up/down    |
| `>` / `<` (visual) | Indent/unindent block          |
| `<leader>u`        | Toggle undotree                |
| `<leader>z`        | Toggle centered mode           |
| `<leader>ee`       | Open Oil file explorer         |

> [!TIP]
> See each plugin spec in `lua/plugins/*.lua` for additional keymaps defined per plugin.

## LSP Servers

Custom configs live in `lsp/` and are loaded via Nvim 0.11's native `vim.lsp.config` API.

| Server                              | Language              |
| :---------------------------------- | :-------------------- |
| `lua-language-server`               | Lua                   |
| `marksman`                          | Markdown              |
| `tinymist`                          | Typst                 |
| `ts_ls`                             | TypeScript/JavaScript |
| `pylsp`                             | Python                |
| `rust_analyzer`                     | Rust                  |
| `jdtls` configured in `ftplugin/`   | Java                  |
| `roslyn` also install `roslyn.nvim` | C#                    |
| `clangd`                            | C/C++                 |
| `cssls`                             | CSS                   |
| `html`                              | HTML                  |
| `intelephense` / `phpactor`         | PHP                   |
| `bashls`                            | Bash                  |
| `sqls`                              | SQL                   |
| `docker_language_server`            | Docker                |
| `emmet_language_server`             | Emmet                 |
| `gdscript`                          | GDScript              |
| `astro`                             | Astro                 |
| `vue_ls`                            | Vue                   |

## Getting Started

### Prerequisites

- Neovim >= 0.11
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)

### Install

```bash
git clone https://github.com/ToshoBread/nvim-config.git ~/.config/nvim
```

### Customization

- **Add a plugin**: Create a new file in `lua/plugins/`
- **Disable a plugin**: Add its name to `lua/disabled.lua`
- **Add an LSP server**: Install via Mason and create a config in `lsp/`
- **Add a formatter**: Add an entry to `formatters_by_ft` in `lua/plugins/formatter.lua`
- **Change theme**: Edit `lua/plugins/colorscheme.lua` and update `init.lua`
