return {
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- dashboard.section.header.val = {
			--     "                                                     ",
			--     "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			--     "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			--     "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			--     "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			--     "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			--     "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			--     "                                                     ",
			-- }

			dashboard.section.header.val = {

				"     .-') _  ('-.                   (`-.         _   .-')    ",
				"    ( OO ) _(  OO)                _(OO  )_      ( '.( OO )_  ",
				",--./ ,--,(,------..-'),-----.,--(_/   ,. \\,-.-'),--.   ,--.)",
				"|   \\ |  |\\|  .---( OO'  .-.  \\   \\   /(__/|  |OO|   `.'   | ",
				"|    \\|  | |  |   /   |  | |  |\\   \\ /   / |  |  |         | ",
				"|  .     |(|  '--.\\_) |  | |  | \\   '   /, |  |(_|  |'.'|  | ",
				"|  |\\    | |  .--'  \\ |  | |  |  \\     /__,|  |_.|  |   |  | ",
				"|  | \\   | |  `---.  `'  '-'  '   \\   /  (_|  |  |  |   |  | ",
				"`--'  `--' `------'    `-----'     `-'     `--'  `--'   `--' ",
			}

			-- Set Buttons
			dashboard.section.buttons.val = {
				dashboard.button("e", "📁 File Explorer", ":Oil<CR>"),
				dashboard.button("f", "🔍 Find File", ":Telescope find_files<CR>"),
				dashboard.button("n", "📄 New File", ":ene <BAR> startinsert <CR>"),
				dashboard.button("q", "🚪 Quit", ":qa<CR>"),
			}

			-- Set Footer
			-- dashboard.section.footer.val = { "🚀 Welcome to Neovim!" }

			alpha.setup(dashboard.config)

			-- Auto-load Alpha instead of netrw when opening a directory
			vim.api.nvim_create_autocmd("VimEnter", {
				group = vim.api.nvim_create_augroup("AlphaReplaceNetrw", { clear = true }),
				callback = function()
					-- If Neovim was opened with a directory
					if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
						-- Change to the directory
						vim.cmd("cd " .. vim.fn.argv(0))
						-- Start Alpha
						require("alpha").start()
					end
				end,
			})
		end,
	},
}
