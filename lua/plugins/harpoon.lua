local keys = {
	{ "<leader>ha", function() require("harpoon"):list():add() end, desc = "Add mark to harpoon" },
	{ "<leader>hl", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Open harpoon UI" },
}
for i = 1, 9 do
	keys[#keys + 1] = {
		"<leader>" .. i,
		function() require("harpoon"):list():select(i) end,
		desc = "Goto Harpoon mark " .. i,
	}
end

return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = "nvim-lua/plenary.nvim",
		keys = keys,
		config = function()
			require("harpoon"):setup()
		end,
	},
}
