return {
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            blade = { "blade-formatter" },
            css = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            lua = { "stylua" },
            php = { "pint" },
            svelte = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            vue = { "prettierd", "prettier", stop_after_first = true },
        },
        formatters = {
            pint = {
                command = "pint",
                args = { "--quiet", "--config", vim.fn.expand("~/.config/pint/laravel.json"), "$FILENAME" },
                stdin = false,
            },
        },
    },
}
