remap("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Return to Oil.nvim" })

-- Buffer Actions
remap("n", "<leader>ww", "<CMD>w<CR>", { desc = "Write/Save File" })
remap("n", "<leader>wq", "<CMD>wq<CR>", { desc = "Write file then quit" })
remap("n", "<leader>qq", "<CMD>qa!<CR>", { desc = "Force quit without saving" })
remap("n", "<leader>qw", "<CMD>close<CR>", { desc = "Close window" })
remap("n", "<leader>a", "gg0VG", { desc = "Select the entire buffer" })

-- Text Manipulation
remap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
remap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })

remap({ "n", "v" }, "d", '"_d', { desc = "Delete to the void register" })

remap("v", "<C-S-Y>", '"+yy', { desc = "Copy to system clipboard" })

remap("v", ">", ">gv", { desc = "Indent a line or block" })
remap("v", "<", "<gv", { desc = "Unindent a line or block" })

remap("n", "<CR>", "o<Esc>k", { desc = "Insert a line below" })
remap("n", "<S-CR>", "O<Esc>j", { desc = "Insert a line above" })

-- Buffer Navigation
-- remap({ "n", "o", "x" }, "w", "<CMD>lua require('spider').motion('w')<CR>", { desc = "Move forward" })
-- remap({ "n", "o", "x" }, "e", "<CMD>lua require('spider').motion('e')<CR>", { desc = "Move foward to end" })
-- remap({ "n", "o", "x" }, "b", "<CMD>lua require('spider').motion('b')<CR>", { desc = "Move backward" })

remap("n", "n", "nzzzv", { desc = "Center cursor in forward incremental search" })
remap("n", "N", "Nzzzv", { desc = "Center cursor in backward incremental search" })

remap("n", "<C-u>", "<C-u>zzzv", { desc = "Center cursor while PgUp" })
remap("n", "<C-d>", "<C-d>zzzv", { desc = "Center cursor while PgDown" })

-- Numerical Actions
remap("n", "+", "<C-a>", { desc = "Increment" })
remap("n", "-", "<C-x>", { desc = "Decrement" })
