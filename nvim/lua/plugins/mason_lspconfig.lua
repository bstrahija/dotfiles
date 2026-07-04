return {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
        ensure_installed = {
            "cssls",
            "html",
            "intelephense",
            "jsonls",
            "lua_ls",
            "tailwindcss",
            "ts_ls",
        },
        automatic_enable = true,
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
