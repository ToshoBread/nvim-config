require("toshobread")

local function changeTheme(color)
    color = color or "tokyodark"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.o.winblend = 0
end

changeTheme()

--vim.api.nvim_create_autocmd("FileType", {
--    pattern = "java",
--    callback = function()
--        require('after.plugin.java')
--    end,
--})
