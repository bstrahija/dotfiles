return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                prompt_prefix = "Search> ",
                selection_caret = "> ",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                },
                path_display = { "smart" },
                file_ignore_patterns = {
                    ".git/",
                    "node_modules/",
                    "vendor/",
                },
            },
        })
    end,
}
