return {
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
			csharp_enable_inlay_hints_for_lambda_parameter_types = true,
			csharp_enable_inlay_hints_for_types = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = true,
			dotnet_enable_implementations_code_lens = true,
		},
	},

	on_attach = function()
		Remap("n", "<leader><leader>r", "<CMD>terminal dotnet run<CR>i", { desc = "Dotnet run" })
	end,
}
