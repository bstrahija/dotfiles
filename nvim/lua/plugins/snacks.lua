return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = {
            enabled = true,
            scope = { enabled = false },
        },
        input = { enabled = true },
        notifier = { enabled = true },
        picker = { enabled = false },
        quickfile = {
            enabled = true,
            exclude = {
                "latex",
                "markdown",
                "markdown_inline",
            },
        },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}
