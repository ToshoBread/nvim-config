return {
	{
		"chrisgrieser/nvim-recorder",
		dependencies = "rcarriga/nvim-notify",
		opts = {
			slots = { "a", "b" },
			clear = false,
			lessNotifications = true,
			useNerdfontIcons = true,

			mapping = {
				startStopRecording = "q",
				playMacro = "Q",
				switchSlot = "<C-q>",
				editMacro = "cq",
				deleteAllMacros = "dq",
				yankMacro = "yq",
				-- ⚠️ this should be a string you don't use in insert mode during a macro
				addBreakPoint = "##",
			},
		},
	},
}
