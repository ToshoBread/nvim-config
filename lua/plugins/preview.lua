return {
	"sylvanfranklin/omni-preview.nvim",
	dependencies = {
		{ "chomosuke/typst-preview.nvim", lazy = true }, -- typst
		{ "toppair/peek.nvim", lazy = true, build = "deno task --quiet build:fast" }, -- markdown
		{ "wallpants/github-preview.nvim", lazy = true }, -- Github READMEs
		-- { 'hat0uma/csvview.nvim',         lazy = true },                                         -- csv
	},
	config = function()
		require("omni-preview").setup()
		require("typst-preview").setup()
		require("peek").setup({ app = "browser" })
		require("github-preview").setup({})

		-- require("csvview").setup({
		--     view = {
		--         display_mode = "border"
		--     }
		-- })
	end,
}
