local api = vim.api

pcall(vim.treesitter.language.register, "php", "blade")

local group = api.nvim_create_augroup("DotfilesTreesitter", { clear = true })
local parsers = {
    bash = true,
    css = true,
    html = true,
    javascript = true,
    javascriptreact = true,
    json = true,
    lua = true,
    php = true,
    query = true,
    svelte = true,
    tsx = true,
    typescript = true,
    typescriptreact = true,
    vim = true,
    vimdoc = true,
    vue = true,
    yaml = true,
    blade = true,
}

api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
        if not parsers[vim.bo[args.buf].filetype] then
            return
        end

        pcall(vim.treesitter.start, args.buf)
    end,
})
