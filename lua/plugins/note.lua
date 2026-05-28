return {
	{
		"gsuuon/note.nvim",
		opts = {
			spaces = { "~" },
		},
		cmd = "Note",
		ft = "note",
		config = function(_, opts)
			require("note").setup(opts)
			Remap("n", "<leader>n", "<cmd>Note<CR>", { desc = "Create/Open daily note" })
			Remap("n", "<leader>fn", function()
				require("telescope.builtin").live_grep({
					cwd = require("note.api").current_note_root(),
				})
			end, { desc = "Search notes" })
		end,
	},
}
