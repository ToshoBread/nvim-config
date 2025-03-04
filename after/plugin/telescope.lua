require("telescope").setup({
    defaults = {
        border = true,
        winblend = 0,
        file_ignore_pattens = {
            "node_modules",
            ".git/",
            "build",
            "dist",
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
    },
})
