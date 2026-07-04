return {
    "olrtg/nvim-emmet",
    ft = {
        "css",
        "blade",
        "html",
        "javascriptreact",
        "php",
        "svelte",
        "typescriptreact",
        "vue",
    },
    config = function()
        vim.keymap.set({ "n", "v" }, "<leader>xe", function()
            require("nvim-emmet").wrap_with_abbreviation()
        end, { desc = "Emmet Wrap" })
    end,
}
