return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "archibate/lualine-time" },
		config = function()
			local devicons = require("nvim-web-devicons")

			local function filenameAndIcon()
				local filename = vim.fn.expand("%:t")
				local extension = vim.fn.expand("%:e")
				local icon, icon_highlight = devicons.get_icon(filename, extension)

				if icon == nil then
					icon = "󰡯"
				end

				return string.format("%s %s", icon, filename)
			end
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					-- component_separators = { left = "", right = "" },
					component_separators = { left = "|", right = "|" },
					-- section_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = true,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = { { "mode", icons_enabled = true, icon = "" } },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = {},
					lualine_x = { filenameAndIcon },
					lualine_y = { "lsp_status", "progress" },
					lualine_z = { { "ctime", icons_enabled = true, icon = "" } },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "filename" },
					lualine_z = { "location" },
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
