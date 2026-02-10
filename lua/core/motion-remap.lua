Remap("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Return to Oil.nvim" })

-- Buffer Actions
Remap("n", "<leader>ww", "<CMD>w<CR>", { desc = "Write/Save File" })
Remap("n", "<leader>wq", "<CMD>wq<CR>", { desc = "Write file then quit" })
Remap("n", "<leader>qq", "<CMD>qa!<CR>", { desc = "Force quit without saving" })
Remap("n", "<leader>qw", "<CMD>close<CR>", { desc = "Close window" })
Remap("n", "<leader>a", "gg0VG", { desc = "Select the entire buffer" })

-- Text Manipulation
Remap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
Remap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })

Remap({ "n", "v" }, "d", '"_d', { desc = "Delete to the void register" })
Remap({ "n", "v" }, "c", '"_c', { desc = "Change motion doesn't yank" })
Remap("v", "p", '"_dP', { desc = "Paste without yanking" })
-- remap("n", "s", '"_s', { desc = "Substitute motion doesn't yank" })
-- remap("n", "S", '"_S', { desc = "Substitute line motion doesn't yank" })

Remap({ "n", "v" }, "<leader>yy", '"+y', { desc = "Copy to system clipboard" })
Remap("n", "Y", "y$", { desc = "Copy to End of Line" })

Remap("v", ">", ">gv", { desc = "Indent a line or block" })
Remap("v", "<", "<gv", { desc = "Unindent a line or block" })

Remap("n", "<CR>", "o<Esc>k", { desc = "Insert a line below" })
Remap("n", "<S-CR>", "O<Esc>j", { desc = "Insert a line above" })

Remap("n", "J", "mzJ`z", { desc = "Join next line, preserving cursor position" })

-- Navigation
Remap("n", "n", "nzzzv", { desc = "Center cursor in forward incremental search" })
Remap("n", "N", "Nzzzv", { desc = "Center cursor in backward incremental search" })

Remap("n", "<C-u>", "<C-u>zzzv", { desc = "Center cursor while PgUp" })
Remap("n", "<C-d>", "<C-d>zzzv", { desc = "Center cursor while PgDown" })

Remap("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
Remap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom pane" })
Remap("n", "<C-k>", "<C-w>k", { desc = "Move to top pane" })
Remap("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- Pane Resize
Remap("n", "<C-K>", "<CMD>resize -2<CR>", { desc = "Resize pane up" })
Remap("n", "<C-J>", "<CMD>resize +2<CR>", { desc = "Resize pane down" })
Remap("n", "<C-H>", "<CMD>vertical resize -2<CR>", { desc = "Resize pane left" })
Remap("n", "<C-L>", "<CMD>vertical resize +2<CR>", { desc = "Resize pane right" })

-- Terminal Mappings
Remap("n", "<leader>tr", "<CMD>tabnew term://zsh<CR>i", { desc = "Open terminal in new tab" })
Remap("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left pane in terminal mode" })
Remap("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom pane in terminal mode" })
Remap("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top pane in terminal mode" })
Remap("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right pane in terminal mode" })
Remap("t", "<C-x>", "exit<CR>", { desc = "Exit and Close Terminal" })
