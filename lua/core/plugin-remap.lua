-- Trouble
Remap("n", "<leader>dx", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Workspace Diagnostics" })
Remap("n", "<leader>dX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics" })
Remap("n", "<leader>ds", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Document Symbols" })
Remap("n", "<leader>dl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP Location List" })
Remap("n", "<leader>dL", "<CMD>Trouble loclist toggle<CR>", { desc = "Location List" })
Remap("n", "<leader>dQ", "<CMD>Trouble qflist toggle<CR>", { desc = "Quickfix List" })

-- Telescope
local builtin = require("telescope.builtin")

Remap("n", "<leader>ff", builtin.find_files, { desc = "Find files in current workspace" })
Remap("n", "<leader>fw", builtin.live_grep, { desc = "Find regex in current workspace" })
Remap("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Find regex in current buffer" })
Remap("n", "<leader>ft", builtin.treesitter, { desc = "Find Treesitter symbols in current buffer" })
Remap("n", "<leader>fk", builtin.keymaps, { desc = "List all Normal Mode keymaps" })

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

Remap("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Add mark to harpoon" })

Remap("n", "<leader>hl", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon UI" })

for i = 1, 9, 1 do
	Remap("n", "<leader>" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Goto Harpoon mark " .. i })
end

-- SearchBox
Remap("n", "/", vim.cmd.SearchBoxIncSearch, { desc = "Search for the next occurence of a pattern" })
Remap(
	"n",
	"<leader>/",
	"<CMD>lua require('searchbox').match_all({title='Search All', clear_matches=false})<CR>",
	{ desc = "Search all occurences of a pattern" }
)
Remap("n", "?", vim.cmd.SearchBoxReplace, { desc = "Replace all occurences of a pattern" })

-- Undotree
Remap("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree pane" })

-- Omni Preview
Remap("n", "<leader>po", ":OmniPreview start<CR>", { desc = "Open preview" })
Remap("n", "<leader>pc", ":OmniPreview stop<CR>", { desc = "Close preview" })
