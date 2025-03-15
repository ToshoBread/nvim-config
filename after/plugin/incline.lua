-- local helpers = require("incline.helpers")
require("incline").setup({
	window = {
		width = "fit",
		padding = 0,
		margin = {
			horizontal = 3,
			vertical = 0,
		},

		placement = {
			horizontal = "right",
			vertical = "top",
		},

		options = {
			winblend = 100,
		},
	},

	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if filename == "" then
			filename = "[Unnamed]"
		end
		local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
		local modified = vim.bo[props.buf].modified
		local buffer = {
			-- guifg = helpers.contrast_color(ft_color)
			{ filename, " ", gui = modified and "bold, italic" or "bold" },
			{ (ft_icon or ""), " ", guibg = ft_color, guifg = ft_color },
			guibg = "", -- Color
		}
		return buffer
	end,
})
