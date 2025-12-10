return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                intelephense = {
                    init_options = {
                        globalStoragePath = vim.fn.stdpath("data") .. "/intelephense",
                    },
                    settings = {
                        intelephense = {
                            environment = {
                                includePaths = {
                                    vim.fn.expand("~/Code/influendo/optimizepress/public/wp-includes"),
                                    vim.fn.expand("~/Code/influendo/optimizepress/public/wp-admin"),
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}
