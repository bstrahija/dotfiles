return {
    "stevearc/oil.nvim",
    lazy = false,
    priority = 900,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
            keymaps = {
                ["q"] = "actions.close",
                ["<Esc>"] = "actions.close",
            },
        })
    end,
}
