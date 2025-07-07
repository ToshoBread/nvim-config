return {
	{
		"nvzone/floaterm",
		dependencies = "nvzone/volt",
		cmd = "FloatermToggle",
		config = function()
			local api = require("floaterm.api")

			require("floaterm").setup({
				border = false,
				size = { h = 80, w = 90 },

				-- to use, make this func(buf)
				mappings = {
					-- sidebar = nil,
					term = function(buf)
						remap({ "n", "t" }, "<C-x>", vim.cmd.FloatermToggle, { desc = "Toggle Floating Terminal" })

						remap({ "n", "t" }, "<C-a>", function()
							api.cycle_term_bufs("prev")
						end, { buffer = buf, desc = "Previous Terminal Buffer" })

						remap({ "n", "t" }, "<C-s>", function()
							api.cycle_term_bufs("next")
						end, { buffer = buf, desc = "Next Terminal Buffer" })
					end,
				},

				-- Default sets of terminals you'd like to open
				terminals = {
					{ name = "Terminal" },
					-- cmd can be function too
					-- More terminals
				},
			})
		end,
	},
}
