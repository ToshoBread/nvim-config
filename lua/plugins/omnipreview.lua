return {
	"sylvanfranklin/omni-preview.nvim",
	dependencies = {
		{ "chomosuke/typst-preview.nvim", lazy = true }, -- typst
		{ "toppair/peek.nvim", lazy = true, build = "deno task --quiet build:fast" }, -- markdown
		{ "hat0uma/csvview.nvim", lazy = true }, -- csv
	},
	keys = {
		{ "<leader>po", "<cmd>OmniPreview start<CR>", desc = "Open preview" },
		{ "<leader>pc", "<cmd>OmniPreview stop<CR>", desc = "Close preview" },
	},
	config = function()
		require("omni-preview").setup()

		require("typst-preview").setup()
		require("peek").setup({ app = "browser" })
		require("csvview").setup({
			view = {
				display_mode = "border",
			},
		})
	end,
}
