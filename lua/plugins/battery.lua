return {
	{
		"justinhj/battery.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		config = function()
			require("battery").setup({
				update_rate_seconds = 30, -- Number of seconds between checking battery status
				show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
				show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
				show_unplugged_icon = false, -- When true show a diconnected cable icon when not plugged in
				show_percent = true, -- Whether or not to show the percent charge remaining in digits
				vertical_icons = true, -- When true icons are vertical, otherwise shows horizontal battery icon
				multiple_battery_selection = 1, -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
			})
		end,
	},
}
