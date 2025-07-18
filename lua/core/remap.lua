local key = vim.keymap

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
local builtin = require("telescope.builtin")

key.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
key.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hh", mark.add_file)
vim.keymap.set("n", "<C-h>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
    ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
    ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
    ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
    ui.nav_file(4)
end)
