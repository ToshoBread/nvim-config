return {
	{
		{
			"tpope/vim-dadbod",
			lazy = true,
			cmd = {
				"DBUI",
				"DBUIToggle",
				"DBUIAddConnection",
				"DBUIFindBuffer",
			},
		},
		{
			"kristijanhusak/vim-dadbod-ui",
			lazy = true,
			cmd = {
				"DBUI",
				"DBUIToggle",
				"DBUIAddConnection",
				"DBUIFindBuffer",
			},
			dependencies = "tpope/vim-dadbod",
			init = function()
				vim.g.db_ui_use_nerd_fonts = 1
			end,
		},
		{
			"kristijanhusak/vim-dadbod-completion",
			lazy = true,
			ft = { "sql", "mysql" },
			dependencies = "tpope/vim-dadbod",
		},
	},
}
