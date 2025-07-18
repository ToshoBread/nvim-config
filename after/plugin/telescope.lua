local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require("telescope").setup({
	defaults = {
		border = true,
		winblend = 0,
		file_ignore_pattens = {
			"node_modules",
			".git/",
			"build",
			"dist",
		},
	},
})
