-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Close completion menu with Esc without leaving insert mode
vim.keymap.set("i", "<Esc>", function()
    return vim.fn.pumvisible() == 1 and "<C-e>" or "<Esc>"
end, { expr = true })
