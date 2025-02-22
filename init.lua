require("toshobread")

local function changeTheme(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

changeTheme()


--vim.api.nvim_create_autocmd("FileType", {
--    pattern = "java",
--    callback = function()
--        require('after.plugin.java')
--    end,
--})
