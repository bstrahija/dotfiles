local api = vim.api

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

local group = api.nvim_create_augroup("DotfilesCore", { clear = true })

api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "mail",
    callback = function()
        vim.opt_local.textwidth = 0
        vim.opt_local.wrapmargin = 0
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.colorcolumn = "80"
    end,
})

api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 })
    end,
})

api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    group = group,
    callback = function()
        vim.wo.cursorline = true
    end,
})

api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    group = group,
    callback = function()
        vim.wo.cursorline = false
    end,
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = group,
    pattern = { "*.txt", "*.md", "*.tex" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = { "en" }
    end,
})

api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = group,
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd.checktime()
        end
    end,
})
