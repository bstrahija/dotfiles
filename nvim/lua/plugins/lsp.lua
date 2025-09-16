return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            autoformat = false
        },
        config = function()
            require("lspconfig").intelephense.setup {
                settings = {
                    intelephense = {
                        format = {
                            braces = "k&r",
                        },
                    },
                },
            }
        end
    }
}
