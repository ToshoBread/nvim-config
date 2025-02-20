local comment = require "Comment.api"
require("Comment").setup()

-- Comment/uncomment the current line
vim.keymap.set("n", "<leader>cc", function() comment.toggle.linewise.current() end)

