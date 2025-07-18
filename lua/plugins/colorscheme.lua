return {
	{
		"rose-pine/nvim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",
				extend_background_behind_borders = true,
				styles = {
					italic = false,
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
