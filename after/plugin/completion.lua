local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    completion = {
        completeopt = "menu,menuone,noinsert",
    },

    performance = {
        debounce = 50,
        throttle = 50,
        fetching_timeout = 200,
        max_item_count = 10,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-a>"] = cmp.mapping.scroll_docs(-4),
        ["<C-s>"] = cmp.mapping.scroll_docs(4),
    }),

    sources = cmp.config.sources({
        {
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
                local kind = entry:get_kind()

                if kind == cmp.lsp.CompletionItemKind.Text then
                    return false
                end

                return true
            end,
        },
        { name = "luasnip" },
        { name = "path" },
    }),
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
    }),
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})
