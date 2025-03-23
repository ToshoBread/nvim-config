local key = vim.keymap

key.set("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Return to Oil.nvim", silent = true })

-- Write file
key.set("n", "<leader>ww", "<CMD>w<CR>", { desc = "Write/Save File" })
key.set("n", "<leader>wq", "<CMD>wq<CR>", { desc = "Write file then quit" })
key.set("n", "<leader>qq", "<CMD>qa!<CR>", { desc = "Force quit without saving", silent = true })
key.set("n", "<leader>qw", "<CMD>close<CR>", { desc = "Close window", silent = true })

key.set("n", "<leader><C-a>", "ggvG", { desc = "Select the entire buffer", silent = true })

-- Move text up and down
key.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up", silent = true })
key.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down", silent = true })

-- Center cursor while navigating vertically
key.set("n", "<C-u>", "<C-u>zzzv", { desc = "Center cursor while PgUp", silent = true })
key.set("n", "<C-d>", "<C-d>zzzv", { desc = "Center cursor while PgDown", silent = true })

-- Center cursor while searching terms
key.set("n", "n", "nzzzv", { desc = "Center cursor in forward incremental search", silent = true })
key.set("n", "N", "Nzzzv", { desc = "Center cursor in backward incremental search", silent = true })

-- Delete with void register
key.set({ "n", "v" }, "d", '"_d', { desc = "Delete to the void register" })

-- Delete previous word in insert mode
key.set("i", "<C-H>", '<C-o>"_diw', { desc = "Delete the current word in insert mode" })

-- Copy to the system clipboard
key.set("v", "<C-S-Y>", '"+yy', { desc = "Copy to system clipboard", silent = false })

-- Incremental Rename
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

key.set("n", "<leader>hh", mark.add_file, { desc = "Add mark to harpoon" })
key.set("n", "<C-h>", ui.toggle_quick_menu, { desc = "Open harpoon UI" })

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
key.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree pane" })

-- Peek
local peek = require("peek")
key.set("n", "<leader>tp", function()
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end, { desc = "Toggle Markdown Preview" })

-- Live Server
key.set("n", "<leader>tl", vim.cmd.LiveServerToggle, { desc = "Toggle Live Server" })

-- Twilight
key.set("n", "<leader>tt", vim.cmd.Twilight, { desc = "Toggle Twilight" })

-- Zen Mode
key.set("n", "<leader>z", vim.cmd.ZenMode, { desc = "Toggle Zen Mode" })

-- Transparent
key.set("n", "<leader>tz", vim.cmd.TransparentToggle, { desc = "Toggle background opacity" })
