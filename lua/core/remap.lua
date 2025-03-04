local key = vim.keymap
local builtin = require("telescope.builtin")

-- Return to netrw
key.set("n", "<leader>ee", vim.cmd.Ex)

-- Write file
key.set("n", "<leader>ww", ":w<CR>")
key.set("n", "<leader>wq", ":wq<CR>")
key.set("n", "<leader>qq", ":q!<CR>")

-- Select the whole file
key.set("n", "<leader><C-a>", "ggvG")

-- Quit
key.set("n", "<leader>qq", ":q<CR>")

-- Move text up and down
key.set("v", "K", ":m '<-2<CR>gv=gv")
key.set("v", "J", ":m '>+1<CR>gv=gv")

-- Center cursor while navigating vertically
key.set("n", "<C-u>", "<C-u>zzzv")
key.set("n", "<C-d>", "<C-d>zzzv")

-- Center cursor while searching terms
key.set("n", "n", "nzzzv")
key.set("n", "N", "Nzzzv")

-- Delete previous word in insert mode
key.set("i", "<C-H>", "<C-O>db")

-- Telescope
key.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
key.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
