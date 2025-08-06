return {
    "karb94/neoscroll.nvim",
    opts = {
        -- These settings control the animation speed
        -- Lower values = faster scrolling
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = "quadratic", -- or nil for linear
        performance_mode = false,

        -- Override default scroll speed (smaller = faster)
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    },

    config = function(_, opts)
        require("neoscroll").setup(opts)

        local neoscroll = require('neoscroll')
        neoscroll.setup({
            mappings = {
                ['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '10' } },
                ['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '10' } }
            }
        })
    end,
}
