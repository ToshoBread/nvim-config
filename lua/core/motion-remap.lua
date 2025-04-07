local remap = vim.keymap.set

remap("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Return to Oil.nvim", silent = true })

-- Buffer Actions
remap("n", "<leader>ww", "<CMD>w<CR>", { desc = "Write/Save File" })
remap("n", "<leader>wq", "<CMD>wq<CR>", { desc = "Write file then quit" })
remap("n", "<leader>qq", "<CMD>qa!<CR>", { desc = "Force quit without saving", silent = true })
remap("n", "<leader>qw", "<CMD>close<CR>", { desc = "Close window", silent = true })
remap("n", "<leader>a", "gg0VG", { desc = "Select the entire buffer", silent = true })

-- Text Manipulation
remap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up", silent = true })
remap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down", silent = true })

remap({ "n", "v" }, "d", '"_d', { desc = "Delete to the void register" })

remap("i", "<C-H>", '<C-o>"_db', { desc = "Delete the current word in insert mode" })

remap("v", "<C-S-Y>", '"+yy', { desc = "Copy to system clipboard", silent = false })

-- Buffer Navigation
remap({ "n", "o", "x" }, "w", "<CMD>lua require('spider').motion('w')<CR>")
remap({ "n", "o", "x" }, "e", "<CMD>lua require('spider').motion('e')<CR>")
remap({ "n", "o", "x" }, "b", "<CMD>lua require('spider').motion('b')<CR>")

remap("n", "n", "nzzzv", { desc = "Center cursor in forward incremental search", silent = true })
remap("n", "N", "Nzzzv", { desc = "Center cursor in backward incremental search", silent = true })

remap("n", "<C-u>", "<C-u>zzzv", { desc = "Center cursor while PgUp", silent = true })
remap("n", "<C-d>", "<C-d>zzzv", { desc = "Center cursor while PgDown", silent = true })

-- Numerical Actions
remap("n", "+", "<C-a>", { desc = "Increment", silent = true })
remap("n", "-", "<C-x>", { desc = "Decrement", silent = true })
