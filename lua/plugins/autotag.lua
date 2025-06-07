return {
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		ft = { "html", "php", "jsx", "tsx" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
