local notify = require("notify")

notify.setup({
    background_color = "#000000",
    fps = 60,
    level = 2,
    minimum_width = 50,
    render = "compact",
    stages = "slide",
    time_formats = {
        notification = "%T",
        notification_history = "%F%T",
    },
    timout = 3500,
    top_down = true,
})

notify("Welcome to Neovim!")
