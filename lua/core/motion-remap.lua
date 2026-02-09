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
remap({ "n", "v" }, "c", '"_c', { desc = "Change motion doesn't yank" })
remap("v", "p", '"_dP', { desc = "Paste without yanking" })
remap("n", "s", '"_s', { desc = "Substitute motion doesn't yank" })
remap("n", "S", '"_S', { desc = "Substitute line motion doesn't yank" })

remap({ "n", "v" }, "<leader>yy", '"+y', { desc = "Copy to system clipboard" })
remap("n", "Y", "y$", { desc = "Copy to End of Line" })

remap("v", ">", ">gv", { desc = "Indent a line or block" })
remap("v", "<", "<gv", { desc = "Unindent a line or block" })

remap("n", "<CR>", "o<Esc>k", { desc = "Insert a line below" })
remap("n", "<S-CR>", "O<Esc>j", { desc = "Insert a line above" })

remap("n", "J", "mzJ`z", { desc = "Join next line, preserving cursor position" })

-- Navigation
remap("n", "n", "nzzzv", { desc = "Center cursor in forward incremental search" })
remap("n", "N", "Nzzzv", { desc = "Center cursor in backward incremental search" })

remap("n", "<C-u>", "<C-u>zzzv", { desc = "Center cursor while PgUp" })
remap("n", "<C-d>", "<C-d>zzzv", { desc = "Center cursor while PgDown" })

remap("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
remap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom pane" })
remap("n", "<C-k>", "<C-w>k", { desc = "Move to top pane" })
remap("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- Pane Resize
remap("n", "<C-K>", "<CMD>resize -2<CR>")
remap("n", "<C-J>", "<CMD>resize +2<CR>")
remap("n", "<C-H>", "<CMD>vertical resize -2<CR>")
remap("n", "<C-L>", "<CMD>vertical resize +2<CR>")

-- Terminal Mappings
remap("n", "<leader>tr", "<CMD>tabnew term://zsh<CR>i", { desc = "Open terminal in new tab" })
remap("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left pane in terminal mode" })
remap("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom pane in terminal mode" })
remap("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top pane in terminal mode" })
remap("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right pane in terminal mode" })
remap("t", "<C-x>", "exit<CR>", { desc = "Exit and Close Terminal" })
