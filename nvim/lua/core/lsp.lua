local M = {}

local function setup_diagnostics()
    vim.diagnostic.config({
        severity_sort = true,
        virtual_text = {
            spacing = 2,
            prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        float = {
            border = "rounded",
            source = "if_many",
        },
    })
end

local function setup_server_configs()
    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = false,
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = { enable = false },
            },
        },
    })

    vim.lsp.config("intelephense", {
        settings = {
            intelephense = {
                files = {
                    maxSize = 5000000,
                },
            },
        },
    })

    vim.lsp.config("tailwindcss", {
        filetypes = {
            "blade",
            "css",
            "html",
            "javascript",
            "javascriptreact",
            "php",
            "svelte",
            "typescript",
            "typescriptreact",
            "vue",
        },
    })

    vim.lsp.config("html", {
        filetypes = { "blade", "html", "php" },
    })

    vim.lsp.config("cssls", {
        filetypes = { "blade", "css", "html", "php", "scss", "less" },
    })
end

local function setup_keymaps()
    local group = vim.api.nvim_create_augroup("DotfilesLsp", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(args)
            local bufnr = args.buf
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, {
                    buffer = bufnr,
                    desc = desc,
                })
            end

            map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
            map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
            map("n", "gr", vim.lsp.buf.references, "References")
            map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
            map("n", "K", vim.lsp.buf.hover, "Hover Docs")
            map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
            map("n", "<leader>lf", function()
                vim.lsp.buf.format({ async = true })
            end, "Format Buffer")
        end,
    })
end

function M.setup()
    setup_diagnostics()
    setup_server_configs()
    setup_keymaps()
end

return M
