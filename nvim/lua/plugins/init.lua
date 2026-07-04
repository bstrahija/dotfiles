local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to install lazy.nvim\n", "ErrorMsg" },
            { out, "None" },
        }, true, {})
        return
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.rose_pine"),
    require("plugins.plenary"),
    require("plugins.which_key"),
    require("plugins.mason"),
    require("plugins.lspconfig"),
    require("plugins.mason_lspconfig"),
    require("plugins.conform"),
    require("plugins.snacks"),
    require("plugins.treesitter"),
    require("plugins.treesitter_textobjects"),
    require("plugins.telescope"),
    require("plugins.oil"),
    require("plugins.gitsigns"),
    require("plugins.lualine"),
    require("plugins.autopairs"),
    require("plugins.mini"),
    require("plugins.emmet"),
    require("plugins.blade"),
}, {
    checker = { enabled = false },
    change_detection = { notify = false },
    defaults = { lazy = true },
    install = {
        colorscheme = { "rose-pine" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
