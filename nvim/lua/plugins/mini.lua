return {
    "nvim-mini/mini.nvim",
    version = "*",
    lazy = false,
    priority = 800,
    config = function()
        require("mini.ai").setup()
        require("mini.bufremove").setup()
        require("mini.comment").setup()
        require("mini.surround").setup()
    end,
}
