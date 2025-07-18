return {
	{
		"tpope/vim-dadbod",
		lazy = true,
		ft = "sql",
		dependencies = {
			{
				"kristijanhusak/vim-dadbod-ui",
				cmd = {
					"DBUI",
					"DBUIToggle",
					"DBUIAddCOnnection",
					"DBUIFindBuffer",
				},
				init = function()
					vim.g.db_ui_use_nerd_fonts = 1
				end,
			},
			"kristijanhusak/vim-dadbod-completion",
		},
	},
}
