return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        require("core.lsp").setup()
    end,
}
