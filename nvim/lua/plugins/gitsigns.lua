return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = true, -- ✅ This enables inline blame
        current_line_blame_opts = {
            delay = 300,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    },
}
