vim.keymap.set('n', '/', ':SearchBoxIncSearch<CR>')
vim.keymap.set("n", "<leader>/", ":lua require('searchbox').match_all({title='Search All', clear_matches=false})<CR>")
vim.keymap.set("n", "?" , ":SearchBoxReplace<CR>")
