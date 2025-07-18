return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	settings = {
		pylsp = {
			plugins = {
				jedi_completion = { enabled = true },
				pylsp_mypy = { enabled = true },
				pylsp_rope = { enabled = true },
				ruff = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				black = { enabled = false },
			},
			skip_token_initialization = true,
		},
	},
}
