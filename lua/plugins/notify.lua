return {
	{
		"rcarriga/nvim-notify",
		lazy = true,
		config = function()
			require("notify").setup({
				render = "minimal",
				timeout = 1250,
				maximum_width = 50,
				minimum_width = 10,
				top_down = true,
				background_colour = "#0f0f0f",
				merge_duplicates = true,
			})

			-- Notify when saving
			vim.api.nvim_create_autocmd("BufWrite", {
				pattern = "*",
				callback = function()
					local currentBuf = vim.fn.expand("%:t")
					vim.notify("Written to " .. currentBuf)
				end,
			})
		end,
	},
}
