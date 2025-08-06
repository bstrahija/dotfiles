return {
    -- Laravel Blade --\
    {
        "jwalton512/vim-blade",
        ft = "blade",
        config = function()
            vim.g.blade_delimiters = { open = "{{", close = "}}" }
            vim.g.blade_php_syntax = 1
        end,
    },
}
