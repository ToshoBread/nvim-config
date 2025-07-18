return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local devicons = require("nvim-web-devicons")
			local recorder = require("recorder")

			vim.api.nvim_set_hl(0, "LualineFilenameWithIcon", { bg = "NONE" })

			local function filenameAndIcon()
				local filename = vim.fn.expand("%:t")
				local extension = vim.fn.expand("%:e")
				local icon, icon_highlight = devicons.get_icon(filename, extension)

				if icon == nil then
					icon = "󰡯"
				end

				if filename == "" then
					return ""
				end

				return string.format(
					"%%#%s#%s%%#LualineFilenameWithIcon# %s",
					icon_highlight or "LualineFilenameWithIcon",
					icon,
					filename
				)
			end

			local function clock12hour()
				return os.date("%I:%M%p")
			end

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					-- component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
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
					lualine_a = { "mode" },
					-- lualine_a = { { "mode", icons_enabled = true, icon = "" } },
					lualine_b = { "diagnostics", "branch", "diff" },
					lualine_c = { filenameAndIcon },
					lualine_x = { "lsp_status" },
					lualine_y = { recorder.displaySlots, recorder.recordingStatus },
					lualine_z = { clock12hour },
					-- lualine_z = { { "ctime", icons_enabled = true, icon = "" } },
				},

				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress", "filename" },
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
