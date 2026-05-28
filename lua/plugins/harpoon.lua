return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			Remap("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Add mark to harpoon" })
			Remap("n", "<leader>hl", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open harpoon UI" })

			for i = 1, 9 do
				Remap("n", "<leader>" .. i, function()
					harpoon:list():select(i)
				end, { desc = "Goto Harpoon mark " .. i })
			end
		end,
	},
}
