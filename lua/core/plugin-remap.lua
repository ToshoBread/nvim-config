-- Trouble
remap("n", "<leader>dx", "<CMD>Trouble diagnostics toggle<CR>", { desc = "Workspace Diagnostics" })
remap("n", "<leader>dX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics" })
remap("n", "<leader>ds", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "Document Symbols" })
remap("n", "<leader>dl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>")
remap("n", "<leader>dL", "<CMD>Trouble loclist toggle<CR>")
remap("n", "<leader>dQ", "<CMD>Trouble qflist toggle<CR>")

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

remap("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Add mark to harpoon" })

remap("n", "<leader>hl", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open harpoon UI" })

for i = 1, 9, 1 do
	remap("n", "<leader>" .. i, function()
		harpoon:list():select(i)
	end, { desc = "Goto Harpoon mark " .. i })
end

-- SearchBox
remap("n", "/", vim.cmd.SearchBoxIncSearch)
remap("n", "<leader>/", "<CMD>lua require('searchbox').match_all({title='Search All', clear_matches=false})<CR>")
remap("n", "?", vim.cmd.SearchBoxReplace)

-- Undotree
remap("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree pane" })

-- Omni Preview
remap("n", "<leader>po", ":OmniPreview start<CR>")
remap("n", "<leader>pc", ":OmniPreview stop<CR>")
