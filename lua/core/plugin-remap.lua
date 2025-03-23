local remap = vim.keymap.set

-- Incremental Rename
remap("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Git
remap("n", "<leader>gs", vim.cmd.Git)

-- Telescope
local builtin = require("telescope.builtin")

remap("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
remap("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

remap("n", "<leader>hh", mark.add_file, { desc = "Add mark to harpoon" })
remap("n", "<C-h>", ui.toggle_quick_menu, { desc = "Open harpoon UI" })

remap("n", "<leader>1", function()
	ui.nav_file(1)
end)
remap("n", "<leader>2", function()
	ui.nav_file(2)
end)
remap("n", "<leader>3", function()
	ui.nav_file(3)
end)
remap("n", "<leader>4", function()
	ui.nav_file(4)
end)

-- SearchBox
remap("n", "/", vim.cmd.SearchBoxIncSearch)
remap("n", "<leader>/", "<CMD>lua require('searchbox').match_all({title='Search All', clear_matches=false})<CR>")
remap("n", "?", vim.cmd.SearchBoxReplace)

-- Undotree
remap("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree pane" })

-- Peek
local peek = require("peek")
remap("n", "<leader>tp", function()
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end, { desc = "Toggle Markdown Preview" })

-- Live Server
remap("n", "<leader>tl", vim.cmd.LiveServerToggle, { desc = "Toggle Live Server" })

-- Twilight
remap("n", "<leader>tt", vim.cmd.Twilight, { desc = "Toggle Twilight" })

-- Zen Mode
remap("n", "<leader>z", vim.cmd.ZenMode, { desc = "Toggle Zen Mode" })

-- Emmet Abbreviation
remap(
	{ "n", "v" },
	"<leader>ew",
	require("nvim-emmet").wrap_with_abbreviation,
	{ desc = "Wrap selected text with Emmet" }
)

-- Transparent
remap("n", "<leader>tz", vim.cmd.TransparentToggle, { desc = "Toggle background opacity" })
