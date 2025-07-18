require("toshobread.set")

-- Go to netrw explorer
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- Save and format the file with cursor position restoration
vim.keymap.set("n", "<leader>sf", function()
    -- Format the file
    vim.lsp.buf.format()

    -- Save/Write the file
    vim.api.nvim_command("w")
end)

-- Select the whole file
vim.keymap.set("n", "<leader><C-a>", "ggvG")
-- Quit
vim.keymap.set("n", "<leader>qq", ":q<CR>")

-- Move text up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Center cursor while searching terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
