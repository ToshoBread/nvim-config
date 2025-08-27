-- Incremental Rename
remap("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Trouble
remap("n", "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Workspace Diagnostics" })
remap("n", "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics" })
remap("n", "<leader>xs", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Document Symbols" })
remap("n", "<leader>xl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>")
remap("n", "<leader>xL", "<CMD>Trouble loclist toggle<CR>")
remap("n", "<leader>xQ", "<CMD>Trouble qflist toggle<CR>")

-- Telescope
local builtin = require("telescope.builtin")

remap("n", "<leader>ff", builtin.find_files, { desc = "Find files in current workspace" })
remap("n", "<leader>fw", builtin.live_grep, { desc = "Find regex in current workspace" })
remap("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Find regex in current buffer" })
remap("n", "<leader>ft", builtin.treesitter, { desc = "Find Treesitter symbols in current buffer" })
remap("n", "<leader>fk", builtin.keymaps, { desc = "List all Normal Mode keymaps" })

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

remap("n", "<leader>hh", function()
	harpoon:list():add()
end, { desc = "Add mark to harpoon" })

remap("n", "<leader>hr", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon UI" })

remap("n", "<leader>1", function()
	harpoon:list():select(1)
end, { desc = "Goto harpoon mark 1" })
remap("n", "<leader>2", function()
	harpoon:list():select(2)
end, { desc = "Goto harpoon mark 2" })
remap("n", "<leader>3", function()
	harpoon:list():select(3)
end, { desc = "Goto harpoon mark 3" })
remap("n", "<leader>4", function()
	harpoon:list():select(4)
end, { desc = "Goto harpoon mark 4" })
remap("n", "<leader>5", function()
	harpoon:list():select(5)
end, { desc = "Goto harpoon mark 5" })

-- SearchBox
remap("n", "/", vim.cmd.SearchBoxIncSearch)
remap("n", "<leader>/", "<CMD>lua require('searchbox').match_all({title='Search All', clear_matches=false})<CR>")
remap("n", "?", vim.cmd.SearchBoxReplace)

-- Undotree
remap("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree pane" })

-- Omni Preview
remap("n", "<leader>po", ":OmniPreview start<CR>")
remap("n", "<leader>pc", ":OmniPreview stop<CR>")

-- Emmet Abbreviation
remap(
	{ "n", "v" },
	"<leader>ew",
	require("nvim-emmet").wrap_with_abbreviation,
	{ desc = "Wrap selected text with Emmet" }
)
