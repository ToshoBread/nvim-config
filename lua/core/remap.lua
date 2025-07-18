local key = vim.keymap

-- Return to Oil.nvim
key.set("n", "<leader>ee", "<CMD>Oil<CR>")

-- Write file
key.set("n", "<leader>ww", "<CMD>w<CR>")
key.set("n", "<leader>wq", "<CMD>wq<CR>")
key.set("n", "<leader>qq", "<CMD>q!<CR>")

-- Select the whole file
key.set("n", "<leader><C-a>", "ggvG")

-- Quit
key.set("n", "<leader>qq", "<CMD>q<CR>")

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
key.set("i", "<C-H>", "<ESC>ciw")

-- Delete with the void register
key.set({ "n", "v" }, "d", '"_d')

-- Copy to the system clipboard
key.set("v", "<C-S-Y>", '"+yy')

key.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Git
key.set("n", "<leader>gs", vim.cmd.Git)

-- Telescope
local builtin = require("telescope.builtin")

key.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
key.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

key.set("n", "<leader>hh", mark.add_file)
key.set("n", "<C-h>", ui.toggle_quick_menu)

key.set("n", "<leader>1", function()
	ui.nav_file(1)
end)
key.set("n", "<leader>2", function()
	ui.nav_file(2)
end)
key.set("n", "<leader>3", function()
	ui.nav_file(3)
end)
key.set("n", "<leader>4", function()
	ui.nav_file(4)
end)

-- SearchBox
key.set("n", "/", vim.cmd.SearchBoxIncSearch)
key.set("n", "<leader>/", "<CMD>lua require('searchbox').match_all({title='Search All', clear_matches=false})<CR>")
key.set("n", "?", vim.cmd.SearchBoxReplace)

-- Undotree
key.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Peek
local peek = require("peek")
key.set("n", "<leader>po", function()
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end)

key.set("n", "<leader>lt", vim.cmd.LiveServerToggle)
